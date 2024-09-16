import 'package:appadsgp1/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cursos App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'), // Portugues
        Locale('en'), // English
      ],
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                foregroundColor: WidgetStatePropertyAll(Colors.white))),
        inputDecorationTheme: const InputDecorationTheme(
            errorStyle: TextStyle(color: Colors.deepPurple)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          background: Colors.grey[100],
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
