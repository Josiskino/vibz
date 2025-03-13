class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime date;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.date,
  });

  // Méthode statique pour accéder aux messages de démonstration
  static List<ChatMessage> getSampleMessages() {
    return [
      // Jour 1 - 9 juin 2023
      ChatMessage(
        text: "Hello there!",
        isMe: true,
        date: DateTime(2023, 6, 9),
      ),
      ChatMessage(
        text: "Hi! How are you?",
        isMe: false,
        date: DateTime(2023, 6, 9),
      ),
      ChatMessage(
        text: "I've been meaning to reach out about that Flutter project.",
        isMe: true,
        date: DateTime(2023, 6, 9),
      ),
      ChatMessage(
        text: "Perfect timing! I was just looking at some UI designs for chat apps.",
        isMe: false,
        date: DateTime(2023, 6, 9),
      ),
      ChatMessage(
        text: "Have you seen the new Material 3 guidelines?",
        isMe: true,
        date: DateTime(2023, 6, 9),
      ),
      ChatMessage(
        text: "Yes! I'm trying to incorporate those with some iOS-inspired elements.",
        isMe: false,
        date: DateTime(2023, 6, 9),
      ),

      // Jour 2 - 10 juin 2023
      ChatMessage(
        text: "I'm doing great, thanks for asking. How about you?",
        isMe: true,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "Pretty good! Just working on a new Flutter project.",
        isMe: false,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "What kind of features are you implementing?",
        isMe: true,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "I'm focusing on a timeline view with pinch-to-zoom for navigation.",
        isMe: false,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "Sounds challenging. Are you using any specific packages?",
        isMe: true,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "No, I'm building it from scratch to have full control over the animations.",
        isMe: false,
        date: DateTime(2023, 6, 10),
      ),
      ChatMessage(
        text: "That's impressive! Custom animations can be tricky.",
        isMe: true,
        date: DateTime(2023, 6, 10),
      ),

      // Jour 3 - 11 juin 2023
      ChatMessage(
        text: "That sounds exciting!",
        isMe: true,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "It is! I'm building a chat app with a cool timeline view.",
        isMe: false,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "I've been thinking about the UX flow for messaging apps lately.",
        isMe: true,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "What aspects specifically? Message organization? Input methods?",
        isMe: false,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "Both, actually. I think the way we navigate conversation history could be improved.",
        isMe: true,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "That's exactly what I'm trying to solve with the timeline view!",
        isMe: false,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "Have you considered adding jump-to-date functionality?",
        isMe: true,
        date: DateTime(2023, 6, 11),
      ),
      ChatMessage(
        text: "Yes, I'm implementing that with a date picker that shows conversation density.",
        isMe: false,
        date: DateTime(2023, 6, 11),
      ),

      // Jour 4 - 12 juin 2023
      ChatMessage(
        text: "Like this one?",
        isMe: true,
        date: DateTime(2023, 6, 12),
      ),
      ChatMessage(
        text: "Yes, but with smoother transitions between zoom levels.",
        isMe: false,
        date: DateTime(2023, 6, 12),
      ),
      ChatMessage(
        text: "What kind of transitions are you envisioning?",
        isMe: true,
        date: DateTime(2023, 6, 12),
      ),
      ChatMessage(
        text: "I'm using hero animations when transitioning between detail and overview modes.",
        isMe: false,
        date: DateTime(2023, 6, 12),
      ),
      ChatMessage(
        text: "Are you planning to add search functionality too?",
        isMe: true,
        date: DateTime(2023, 6, 12),
      ),
      ChatMessage(
        text: "Definitely. With highlighted matches and quick navigation between results.",
        isMe: false,
        date: DateTime(2023, 6, 12),
      ),

      // Jour 5 - 13 juin 2023
      ChatMessage(
        text: "How's the project coming along?",
        isMe: true,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "Exactly!",
        isMe: false,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "I've been testing some prototypes with users.",
        isMe: false,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "What kind of feedback have you been getting?",
        isMe: true,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "People love the timeline, but getting them to discover the pinch gesture is challenging.",
        isMe: false,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "Maybe you could add a subtle hint or tutorial the first time they use it?",
        isMe: true,
        date: DateTime(2023, 6, 13),
      ),
      ChatMessage(
        text: "Great idea! I'll implement a quick onboarding guide.",
        isMe: false,
        date: DateTime(2023, 6, 13),
      ),

      // Jour 6 - 14 juin 2023
      ChatMessage(
        text: "The design looks really clean and modern.",
        isMe: true,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "Thanks! I spent a lot of time on the visual details.",
        isMe: false,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "The subtle animations really make it feel premium.",
        isMe: true,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "I'm glad you noticed! I worked hard on making them feel natural.",
        isMe: false,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "Are you using any particular state management solution?",
        isMe: true,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "I'm trying Riverpod for this project. It's been a great experience so far.",
        isMe: false,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "I've heard good things about it. More intuitive than Provider?",
        isMe: true,
        date: DateTime(2023, 6, 14),
      ),
      ChatMessage(
        text: "Definitely. The dependency injection model is much cleaner.",
        isMe: false,
        date: DateTime(2023, 6, 14),
      ),

      // Jour 7 - 15 juin 2023
      ChatMessage(
        text: "Thanks!",
        isMe: false,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "Can you show me more features?",
        isMe: true,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "I've also implemented a voice message recording feature.",
        isMe: false,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "How does it work?",
        isMe: true,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "Long press on the mic button to start recording, release to send.",
        isMe: false,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "Nice! Does it have visual feedback during recording?",
        isMe: true,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "Yes, with animated waveforms that respond to voice volume.",
        isMe: false,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "That sounds really polished. What about haptic feedback?",
        isMe: true,
        date: DateTime(2023, 6, 15),
      ),
      ChatMessage(
        text: "Absolutely! It vibrates when recording starts and stops.",
        isMe: false,
        date: DateTime(2023, 6, 15),
      ),

      // Jour 8 - 16 juin 2023
      ChatMessage(
        text: "Have you considered adding end-to-end encryption?",
        isMe: true,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Sure",
        isMe: false,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Yes, I'm researching libraries for that now.",
        isMe: false,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Any particular ones you're looking at?",
        isMe: true,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "I'm considering Signal's protocol implementation for Dart.",
        isMe: false,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Good choice. How are you handling key management?",
        isMe: true,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Using Flutter Secure Storage and a custom authentication flow.",
        isMe: false,
        date: DateTime(2023, 6, 16),
      ),
      ChatMessage(
        text: "Smart approach. Security is so important for messaging apps.",
        isMe: true,
        date: DateTime(2023, 6, 16),
      ),

      // Jour 9 - 17 juin 2023
      ChatMessage(
        text: "What's your plan for message attachments?",
        isMe: true,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "I'm implementing support for images, videos, documents, and location sharing.",
        isMe: false,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "Are you using any cloud storage for media?",
        isMe: true,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "Firebase Storage with cached thumbnails for quick loading.",
        isMe: false,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "Nice optimization! What about message delivery status?",
        isMe: true,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "I'm showing sent, delivered, and read receipts with subtle icons.",
        isMe: false,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "How are you testing all these features?",
        isMe: true,
        date: DateTime(2023, 6, 17),
      ),
      ChatMessage(
        text: "Combination of unit tests, widget tests, and integration tests with Firebase Test Lab.",
        isMe: false,
        date: DateTime(2023, 6, 17),
      ),

      // Jour 10 - 18 juin 2023
      ChatMessage(
        text: "Have you thought about accessibility?",
        isMe: true,
        date: DateTime(2023, 6, 18),
      ),
      ChatMessage(
        text: "Yes, I'm making sure it works well with screen readers and supports dynamic text sizes.",
        isMe: false,
        date: DateTime(2023, 6, 18),
      ),
      ChatMessage(
        text: "That's great to hear. What about dark mode?",
        isMe: true,
        date: DateTime(2023, 6, 18),
      ),
      ChatMessage(
        text: "Fully supported with a smooth transition animation between modes.",
        isMe: false,
        date: DateTime(2023, 6, 18),
      ),
      ChatMessage(
        text: "Manual toggle or system setting?",
        isMe: true,
        date: DateTime(2023, 6, 18),
      ),
      ChatMessage(
        text: "Both options! Users can follow system or choose their preference.",
        isMe: false,
        date: DateTime(2023, 6, 18),
      ),

      // Jour 11 - 19 juin 2023
      ChatMessage(
        text: "Are you planning to support multiple languages?",
        isMe: true,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "Definitely. I'm using Flutter's localization system with ARB files.",
        isMe: false,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "Which languages will you support initially?",
        isMe: true,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "English, French, Spanish, Arabic, and Chinese to cover different text directions and scripts.",
        isMe: false,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "That's ambitious! How are you handling the translations?",
        isMe: true,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "Working with professional translators to ensure natural-sounding text.",
        isMe: false,
        date: DateTime(2023, 6, 19),
      ),
      ChatMessage(
        text: "Smart approach. Machine translation isn't quite there yet for UI text.",
        isMe: true,
        date: DateTime(2023, 6, 19),
      ),

      // Jour 12 - 20 juin 2023
      ChatMessage(
        text: "What's your monetization strategy?",
        isMe: true,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "Freemium model with premium features like custom themes and increased storage.",
        isMe: false,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "No ads?",
        isMe: true,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "No ads. I want to keep the experience clean and privacy-focused.",
        isMe: false,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "That's refreshing! How will you implement the payments?",
        isMe: true,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "Using RevenueCat to manage subscriptions across iOS and Android.",
        isMe: false,
        date: DateTime(2023, 6, 20),
      ),
      ChatMessage(
        text: "Good choice. They handle a lot of the complexity for you.",
        isMe: true,
        date: DateTime(2023, 6, 20),
      ),

      // Jour 13 - 21 juin 2023
      ChatMessage(
        text: "How's the performance optimization going?",
        isMe: true,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "I've been focusing on reducing rebuild scopes and memory usage.",
        isMe: false,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "Any specific challenges you've faced?",
        isMe: true,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "The timeline view was causing jank when scrolling through large conversations.",
        isMe: false,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "How did you solve it?",
        isMe: true,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "Implemented virtual scrolling to only render visible messages and added pagination.",
        isMe: false,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "That's a solid approach. Are you using flutter_hooks?",
        isMe: true,
        date: DateTime(2023, 6, 21),
      ),
      ChatMessage(
        text: "Yes, combined with hooks_riverpod for even cleaner state management.",
        isMe: false,
        date: DateTime(2023, 6, 21),
      ),

      // Jour 14 - 22 juin 2023
      ChatMessage(
        text: "When are you planning to launch?",
        isMe: true,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "Aiming for a beta release next month with a small group of testers.",
        isMe: false,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "Are you using TestFlight and Google Play internal testing?",
        isMe: true,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "Yes, plus Firebase App Distribution for some external testers.",
        isMe: false,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "How will you collect feedback?",
        isMe: true,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "In-app feedback form plus analytics for user behavior patterns.",
        isMe: false,
        date: DateTime(2023, 6, 22),
      ),
      ChatMessage(
        text: "Sounds like you've thought of everything!",
        isMe: true,
        date: DateTime(2023, 6, 22),
      ),

      // Jour 15 - 23 juin 2023
      ChatMessage(
        text: "Have you implemented notification settings?",
        isMe: true,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "Yes, with granular controls per conversation and scheduled quiet hours.",
        isMe: false,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "What about custom notification sounds?",
        isMe: true,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "That's part of the premium package, with a library of options.",
        isMe: false,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "Smart monetization choice! Are push notifications working well?",
        isMe: true,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "Using Firebase Cloud Messaging with fallbacks for Huawei devices.",
        isMe: false,
        date: DateTime(2023, 6, 23),
      ),
      ChatMessage(
        text: "Good thinking considering Huawei's situation with Google services.",
        isMe: true,
        date: DateTime(2023, 6, 23),
      ),

      // Messages de la veille et aujourd'hui
      ChatMessage(
        text: "You can pinch to zoom out and see the timeline view.",
        isMe: true,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "I'm excited to try out the timeline navigation!",
        isMe: false,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "The pinch gesture feels very intuitive once you know about it.",
        isMe: true,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "I'm testing different levels of haptic feedback to make it feel just right.",
        isMe: false,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "Have you considered adding a tutorial overlay for first-time users?",
        isMe: true,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "Yes, I've implemented a subtle hint system that appears after a few seconds.",
        isMe: false,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatMessage(
        text: "And you can scroll through dates to navigate messages quickly.",
        isMe: false,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "Let me know what you think!",
        isMe: true,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "I'm really impressed with the smooth animations!",
        isMe: false,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "Thanks! I spent a lot of time optimizing the performance.",
        isMe: true,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "The timeline feature is going to be really useful for long conversations.",
        isMe: false,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "That was my main goal - making it easier to navigate message history.",
        isMe: true,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "Mission accomplished! When can I try the beta version?",
        isMe: false,
        date: DateTime.now(),
      ),
      ChatMessage(
        text: "I'll add you to the TestFlight list this week!",
        isMe: true,
        date: DateTime.now(),
      ),
    ];
  }
}