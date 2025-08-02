import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'Tutorial_1_frame.svg',
      'title':
          'Добро пожаловать'
          'в Путеводитель',

      'desc': 'Ищи новые локации и сохраняй самые любимые.',
    },
    {
      'image': 'Tutorial_2_frame.svg',
      'title': 'Построй маршрут и отправляйся в путь',
      'desc': 'Достигай цели максимально быстро и комфортно.',
    },
    {
      'image': 'Tutorial_3_frame.svg',
      'title': 'Добавляй места, которые нашёл сам',
      'desc': 'Делись самыми интересными и помоги нам стать лучше!',
    },
    {
      'image': '',
      'title': 'Готов к приключениям?',
      'desc': 'Давайте начнём прямо сейчас!',
    },
  ];

  String _getImagePath(String iconName) {
    return 'assets/icons/$iconName';
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/list'),
                child: const Text(
                  "Пропустить",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                final imagePath = _getImagePath(page['image']!);

                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(imagePath, height: 150),
                      const SizedBox(height: 24),
                      Text(
                        page['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        page['desc']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.green : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 150,
                vertical: 12,
              ),
            ),
            child: Text(
              _currentPage == _pages.length - 1 ? 'НА СТАРТ' : 'Далее',
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
