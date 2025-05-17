import 'package:flutter/material.dart';
import 'gradient_text.dart';
import 'chat.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: "How to get ChatGPT API?",
      description:
      "To get access to the ChatGPT API, you can sign up on beta.openai.com by creating an account. Once you have an API key, you can use it to access the API and start using ChatGPT. Do not share your API key with others, or expose it in the browser or other client-side code. In order to protect the security of your account",
      imagePath: "assets/robot1.png",
    ),
    OnboardingPageData(
      title: "How to use ChatGPT?",
      description:
      "To use ChatGPT, you can simply ask it a question or give it a prompt and it will generate a response. For example, you can ask it a question like \"What is the capital of India?\" or give it a prompt like \"Write a poem on Flutter.\"",
      imagePath: "assets/robot_world.png",
    ),
    OnboardingPageData(
      title: "Introduction of ChatGPT",
      description:
      "Hello, I am ChatGPT, a large language model trained by OpenAI. I can answer questions, generate text, and assist with various tasks. I am a work in progress, so please be patient with me.",
      imagePath: "assets/robot1.png",
    ),
    OnboardingPageData(
      title: "Welcome to Chatbot",
      description: "",
      imagePath: "assets/robot2.png",
      isInputPage: true,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, ChatPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AI ChatBot",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.cyan.shade800,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(pageData: _pages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: _pages.map((page) {
                    int index = _pages.indexOf(page);
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.cyan
                            : Colors.cyan.shade200,
                      ),
                    );
                  }).toList(),
                ),
                MaterialButton(
                  onPressed: _nextPage,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.cyan,
                          Colors.cyanAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Container(
                      constraints:
                      const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: GradientText(
                        _currentPage == _pages.length - 1 ? 'Start' : 'Next',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;
  final bool isInputPage;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isInputPage = false,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData pageData;

  const OnboardingPage({Key? key, required this.pageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.cyan,
                    Colors.cyanAccent,
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0),
                          child: Text(
                            pageData.title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (!pageData.isInputPage)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 8.0,
                                bottom: 16.0),
                            child: Text(
                              pageData.description,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        if (pageData.isInputPage)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 8.0,
                                bottom: 16.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.cyan,
                                      Colors.cyanAccent,
                                    ],
                                  ),
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(pageData.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const SizedBox(
                          height: 150,
                          width: 150),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBoxBorder extends BoxBorder {
  final Gradient gradient;

  const GradientBoxBorder({required this.gradient});

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  bool get isUniform => true;

  @override
  void paint(
      Canvas canvas,
      Rect rect, {
        TextDirection? textDirection,
        BoxShape shape = BoxShape.rectangle,
        BorderRadius? borderRadius,
      }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    if (shape == BoxShape.circle) {
      canvas.drawCircle(rect.center, rect.shortestSide / 2, paint);
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect,
          borderRadius?.bottomLeft ?? Radius.zero,
        ),
        paint,
      );
    }
  }

  @override
  ShapeBorder scale(double t) => this;
}