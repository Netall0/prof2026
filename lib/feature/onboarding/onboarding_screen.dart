import 'package:flutter/material.dart';
import 'package:for_prof/common/ui/color/colors.dart';
import 'package:for_prof/common/ui/text/text.dart';
import 'package:for_prof/feature/auth/widget/auth_guard.dart';
import 'package:for_prof/feature/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

typedef ButtonUsage = (Function callback, String text);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _current = 0;

  bool onLustPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,

        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLustPage = (index == 2);
              });
            },
            children: [
              OnBoardingScreen1(
                assets: 'assets/ob1.png',
                headerText: 'Confidence in your words',
                bodyText:
                    'With conversation-based learning, you \nll be talking from lesson one',
                buttonText: 'Next',
              ),
              OnBoardingScreen2(
                assets: 'assets/ob2.png',
                headerText: 'Take your time to learn',
                bodyText:
                    'Develop a habit of learning and \nmake it a part of your daily routine',
                buttonText: 'More',
              ),
              OnBoardingScreen3(
                assets: 'assets/ob3.png',
                headerText: 'The lessons you need to learn',
                bodyText:
                    'Using a variety of learning styles to learn \nand retain',
                buttonText: 'Choose a language',
              ),
            ],
          ),
          SizedBox(
            child: Align(
              alignment: Alignment(0, 0.15),

              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 8,
                  activeDotColor: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({
    super.key,
    required this.assets,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
  });

  final String assets;
  final String headerText;
  final String bodyText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(assets),
            SizedBox(height: size.height * 0.2),
            Text(headerText, style: TextSS.header),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: size.width * 0.2,
              ),
              child: Text(
                bodyText,

                textAlign: TextAlign.center,
                style: TextSS.body.copyWith(),
              ),
            ),
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.all(16),
              width: size.width,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorSS.bottomColor,
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextSS.header.copyWith(color: Colors.white),
                ),
              ),
            ),
            Text(
              'Skip onbording',
              style: TextSS.body.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({
    super.key,
    required this.assets,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
  });

  final String assets;
  final String headerText;
  final String bodyText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(assets),
            SizedBox(height: size.height * 0.2),
            Text(headerText, style: TextSS.header),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: size.width * 0.2,
              ),
              child: Text(
                bodyText,

                textAlign: TextAlign.center,
                style: TextSS.body.copyWith(),
              ),
            ),
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.all(16),
              width: size.width,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorSS.bottomColor,
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextSS.header.copyWith(color: Colors.white),
                ),
              ),
            ),
            Text(
              'Skip onbording',
              style: TextSS.body.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({
    super.key,
    required this.assets,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
  });

  final String assets;
  final String headerText;
  final String bodyText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(assets),
            SizedBox(height: size.height * 0.2),
            Text(headerText, style: TextSS.header),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: size.width * 0.2,
              ),
              child: Text(
                bodyText,

                textAlign: TextAlign.center,
                style: TextSS.body.copyWith(),
              ),
            ),
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.all(16),
              width: size.width,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorSS.bottomColor,
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextSS.header.copyWith(color: Colors.white),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthGuard(),
                  ), //auth guard
                );
              },
              child: Text('skip onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}
