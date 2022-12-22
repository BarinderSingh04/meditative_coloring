import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditative_coloring/screens/home_screen.dart';

import 'package:meditative_coloring/screens/onboarding_page.dart';
import 'package:meditative_coloring/screens/login_account.dart';
import 'package:meditative_coloring/services/local_storage_service.dart';

import '../models/user.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialOnboarding();
  }

  void initialOnboarding() async {
    try {
      final token = await ref.read(localStorageProvider).getToken();
      final onBoarding = ref.read(localStorageProvider).getOnBoarding();
      final user = ref.read(localStorageProvider).getUserDetails();

      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      if (onBoarding != null) {
        if (token != null && user != null) {
          ref.read(userProvider.notifier).update((state) => state = user);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              settings: const RouteSettings(name: "/otp"),
              builder: (context) => const LogInAccount(),
            ),
          );
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingPage(),
          ),
        );
      }
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          settings: const RouteSettings(name: "/otp"),
          builder: (context) => const LogInAccount(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SizedBox.expand(
          child: Center(
            child: Text(
              "Meditative Coloring".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Calder",
                fontSize: 44,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
