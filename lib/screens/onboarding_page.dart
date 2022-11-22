import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/screens/create_your_account.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';
import 'package:meditative_coloring/screens/set_your_intension.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  int currentIndex = 0;
  List<Map<String, dynamic>> onBoarding = [
    {
      "title": "Let's begin",
      "description": "Meditative Coloring is a simple "
          "\n and gentle way to tap into your "
          "\n intuition and understand your "
          "\n emotions through coloring.",
      "image": "assets/images/onboarding.png"
    },
    {
      "title": "Follow the prompts",
      "description": "The app will guide you through the"
          "entire Meditative Coloring process — "
          "coloring, interpreting, and releasing.",
      "image": "assets/images/onboarding2.png"
    },
    {
      "title": "Experience the Benefits",
      "description": "A consistent Meditative Coloring practice leads"
          "a stronger connection with your intution and"
          "a better understanding of your emotions.",
      "image": "assets/images/onboarding3.png"
    },
  ];
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: pageController,
                children: onBoarding.map((e) {
                  return OnboardingPage(
                    title: e["title"],
                    asset: e["image"],
                    description: e["description"],
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox.fromSize(
                      size: const Size.fromHeight(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildIndicator(currentIndex),
                      ),
                    ),
                    PrimaryButton(
                      title: "Continue",
                      onClick: () {
                        if (currentIndex < onBoarding.length - 1) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInOut);
                        } else {
                          ref.read(localStorageProvider).saveOnBoarding();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreateYourAccount(),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: isActive ? 15.0 : 12.0,
      width: isActive ? 15.0 : 12.0,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : null,
        shape: BoxShape.circle,
        border: isActive ? null : Border.all(color: Colors.black, width: 2),
      ),
    );
  }

  List<Widget> _buildIndicator(int currentIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String asset;
  final String description;
  const OnboardingPage({
    Key? key,
    required this.title,
    required this.asset,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 0),
          AspectRatio(
            aspectRatio: 3,
            child: Image.asset(asset),
          ),
          Column(
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Calder",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
