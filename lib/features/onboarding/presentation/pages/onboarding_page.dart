import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/onboarding_page_1.dart';
import '../widgets/onboarding_page_2.dart';
import '../widgets/onboarding_page_3.dart';
import '../widgets/onboarding_page_4.dart';
import 'choose_language_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLanguage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const ChooseLanguagePage(),
      ),
    );
  }

  void _nextPage() {
    final int? page = _pageController.hasClients ? _pageController.page?.round() : null;
    if (page == null) {
      return;
    }

    if (page >= 3) {
      _goToLanguage();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage1(
            onSkip: _goToLanguage,
            onNext: _nextPage,
          ),
          OnboardingPage2(
            onSkip: _goToLanguage,
            onNext: _nextPage,
          ),
          OnboardingPage3(
            onSkip: _goToLanguage,
            onNext: _nextPage,
          ),
          OnboardingPage4(
            onSkip: _goToLanguage,
            onNext: _goToLanguage,
          ),
        ],
      ),
    );
  }
}

