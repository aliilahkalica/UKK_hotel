import 'package:flutter/material.dart';
import 'package:ukk_hotel/components/splashscreen.dart';
import 'package:ukk_hotel/formPemesanan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 14, 63, 169)),
          useMaterial3: true,
        ),
        home: Splashscreen());
  }
}
