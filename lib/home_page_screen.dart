import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_nav_bar.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/recording_indicator.dart';
import '../widgets/timeline_view.dart';
import '../widgets/date_header.dart';
import '../animations/timeline_wave_animation.dart';
import 'entity/chat_mesage.dart';
import 'widgets/message_bubbble.dart';
import 'widgets/zoom_intruction_overlay.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isZoomedOut = false;
  bool _isPinching = false;
  double _currentDateIndex = 0;
  double _timelineDragPosition = 0;
  bool _showSendButton = false;
  bool _isRecording = false;
  
  // Messages
  late List<ChatMessage> _messages;

  // Animation controllers
  late AnimationController _animationController;
  late AnimationController _voiceButtonController;
  late AnimationController _zoomTransitionController;
  late AnimationController _inputAnimController;
  
  // Animations
  late Animation<double> _micToSendAnimation;
  late Animation<double> _cameraFadeAnimation;

  // Get unique dates from messages
  List<DateTime> get _uniqueDates {
    final dates = _messages
        .map((message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ))
        .toList();

    return dates.toSet().toList()..sort();
  }

  @override
  void initState() {
    super.initState();

    // Initialize messages
    _messages = ChatMessage.getSampleMessages();

    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _voiceButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _zoomTransitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _inputAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _micToSendAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _inputAnimController, curve: Curves.easeInOut));

    _cameraFadeAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _inputAnimController, curve: Curves.easeInOut));

    // Listen to text changes
    _messageController.addListener(_handleTextChange);

    // Set navigation bar style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CupertinoColors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    // Scroll to the latest message when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToLatestMessage();
    });
  }

  void _scrollToLatestMessage() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleTextChange() {
    final hasText = _messageController.text.isNotEmpty;
    if (hasText != _showSendButton) {
      setState(() {
        _showSendButton = hasText;
      });
      if (hasText) {
        _inputAnimController.forward();
      } else {
        _inputAnimController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _messageController.removeListener(_handleTextChange);
    _messageController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
    _voiceButtonController.dispose();
    _zoomTransitionController.dispose();
    _inputAnimController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleZoom() {
    setState(() {
      _isZoomedOut = !_isZoomedOut;
      if (_isZoomedOut) {
        _animationController.forward();
        _zoomTransitionController.forward();
      } else {
        _animationController.reverse();
        _zoomTransitionController.reverse();
      }
    });
  }

  void _onDateChange(double index, {bool animate = true}) {
    setState(() {
      _currentDateIndex = index.clamp(0, _uniqueDates.length - 1);
    });

    // Find first message with this date and scroll to it
    final targetDate = _uniqueDates[_currentDateIndex.round()];
    final targetIndex = _messages.indexWhere((message) =>
        message.date.year == targetDate.year &&
        message.date.month == targetDate.month &&
        message.date.day == targetDate.day);

    if (targetIndex != -1) {
      final estimatedPosition = _getMessagePosition(targetIndex);

      if (animate) {
        _scrollController.animateTo(
          estimatedPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      } else {
        _scrollController.jumpTo(estimatedPosition);
      }
    }
  }

  double _getMessagePosition(int messageIndex) {
    double position = 0;

    for (int i = 0; i < messageIndex; i++) {
      final message = _messages[i];
      final isSameDate = i > 0 &&
          message.date.year == _messages[i - 1].date.year &&
          message.date.month == _messages[i - 1].date.month &&
          message.date.day == _messages[i - 1].date.day;

      if (!isSameDate && !_isZoomedOut) {
        position += 50; // Date header height
      }

      final textLength = message.text.length;
      final messageHeight = _isZoomedOut ? 24 : (30 + (textLength / 20) * 8);
      position += messageHeight;
    }

    return position;
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
    });
    _voiceButtonController.forward();
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
    });

    // Play bounce animation then return to normal
    _voiceButtonController.reverse().then((_) {
      // Add bounce effect
      _voiceButtonController
          .animateTo(0.3, duration: const Duration(milliseconds: 100))
          .then((_) => _voiceButtonController.animateTo(0,
              duration: const Duration(milliseconds: 150)));
    });
  }

  void _handleTimelineWaveAnimation(double targetIndex, double currentPosition) {
    setState(() {
      _timelineDragPosition = currentPosition;
    });
    
    TimelineWaveAnimation.animate(
      targetIndex: targetIndex,
      currentPosition: currentPosition,
      onPositionChanged: (interpolatedIndex) {
        setState(() {
          _timelineDragPosition = interpolatedIndex;
          _currentDateIndex = interpolatedIndex;
        });
        _onDateChange(interpolatedIndex, animate: false);
      },
      mounted: mounted,
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          text: _messageController.text,
          isMe: true,
          date: DateTime.now(),
        ));
        _messageController.clear();
        _showSendButton = false;
      });
      
      _inputAnimController.reverse();

      // Scroll to bottom
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        setState(() {
          _isPinching = true;
        });
      },
      onScaleUpdate: (details) {
        if (_isPinching) {
          if (details.scale < 0.8 && !_isZoomedOut) {
            _toggleZoom();
            setState(() {
              _isPinching = false;
            });
          } else if (details.scale > 1.2 && _isZoomedOut) {
            _toggleZoom();
            setState(() {
              _isPinching = false;
            });
          }
        }
      },
      onScaleEnd: (details) {
        setState(() {
          _isPinching = false;
        });
      },
      child: CupertinoPageScaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        navigationBar: CustomNavBar(
          onBackPressed: () {
            // Handle back navigation
          },
          onVideoPressed: () {
            // Handle video call
          },
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                children: [
                  // Chat messages area
                  Expanded(
                    child: AnimatedBuilder(
                      animation: Listenable.merge([
                        _animationController,
                        _zoomTransitionController
                      ]),
                      builder: (context, child) {
                        final zoomProgress = _zoomTransitionController.value;
                        
                        return Row(
                          children: [
                            // Messages list
                            Expanded(
                              flex: _isZoomedOut ? 3 : 5,
                              child: Transform.scale(
                                scale: 1.0 - (zoomProgress * 0.05),
                                child: Opacity(
                                  opacity: 1.0 - (zoomProgress * 0.2),
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    physics: _isPinching
                                        ? const NeverScrollableScrollPhysics()
                                        : const BouncingScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8 + (_isZoomedOut ? 4 : 0)),
                                    itemCount: _messages.length,
                                    itemBuilder: (context, index) {
                                      final message = _messages[index];
                                      final isSameDate = index > 0 &&
                                          message.date.year ==
                                              _messages[index - 1].date.year &&
                                          message.date.month ==
                                              _messages[index - 1].date.month &&
                                          message.date.day ==
                                              _messages[index - 1].date.day;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          // Date header if it's a new date
                                          if (!isSameDate && !_isZoomedOut)
                                            DateHeader(date: message.date),

                                          // Message bubble
                                          MessageBubble(
                                            message: message,
                                            isZoomedOut: _isZoomedOut,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            // Timeline on right when zoomed out
                            if (_isZoomedOut)
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: zoomProgress,
                                child: TimelineView(
                                  dates: _uniqueDates,
                                  currentDateIndex: _currentDateIndex,
                                  onDateChanged: (newIndex) {
                                    setState(() {
                                      _currentDateIndex = newIndex;
                                    });
                                    _onDateChange(_currentDateIndex, animate: false);
                                  },
                                  onTimelineWaveAnimation: _handleTimelineWaveAnimation,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Message input area
                  ChatInputField(
                    messageController: _messageController,
                    focusNode: _focusNode,
                    showSendButton: _showSendButton,
                    isRecording: _isRecording,
                    cameraFadeAnimation: _cameraFadeAnimation,
                    micToSendAnimation: _micToSendAnimation,
                    voiceButtonAnimation: _voiceButtonController,
                    onSendMessage: _sendMessage,
                    onRecordingStart: (_) => _startRecording(),
                    onRecordingEnd: (_) => _stopRecording(),
                  ),
                ],
              ),

              // Zoom instruction overlay
              ZoomInstructionOverlay(isZoomedOut: _isZoomedOut),

              // Recording indicator
              RecordingIndicator(isRecording: _isRecording),
            ],
          ),
        ),
      ),
    );
  }
}