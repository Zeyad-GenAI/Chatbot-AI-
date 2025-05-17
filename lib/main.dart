import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'chat.dart';

void main() {
  runApp( ChatGPTBotApp());
}

class ChatGPTBotApp extends StatelessWidget {
  const ChatGPTBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT Bot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.cyan.shade50,
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        ChatPage.routeName: (context) => const ChatPage(),
      },
    );
  }
}