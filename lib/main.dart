import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vibz/home_page_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Pour s'assurer que l'orientation est bonne et que le statut est configuré
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: CupertinoColors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Vibz Chat',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          // Utilisation d'une police lisible et agréable pour le chat
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            color: CupertinoColors.black,
          ),
          // Police légèrement différente pour les titres
          navTitleTextStyle: GoogleFonts.inter(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
      ),
      home: const HomePageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}