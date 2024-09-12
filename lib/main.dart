import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/core/constant/colors.dart';
import 'package:expense_management/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Services.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          titleTextStyle: TextStyle(
              fontFamily: 'ReemKufi',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', ''),
      supportedLocales: [
        // const Locale('en', ''),
        const Locale('ar', ''),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SplashScreen(),
    );
  }
}
