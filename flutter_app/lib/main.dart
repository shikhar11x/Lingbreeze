import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'presentation/providers/word_provider.dart';
import 'presentation/screens/vocabulary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WordProvider(),
      child: MaterialApp(
        title: 'LingoBreeze',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF6C63FF),
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: const VocabularyScreen(),
      ),
    );
  }
}