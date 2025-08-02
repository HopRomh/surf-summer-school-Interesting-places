import 'package:flutter/material.dart';
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';


// Заглушка для списка мест
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список мест')),
      body: const Center(child: Text('Тут будет список')),
    );
  }
}
// Заглушка для списка мест

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Интересные места',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(), 
        '/list': (_) => const ListScreen(), 
      },
    );
  }
}
