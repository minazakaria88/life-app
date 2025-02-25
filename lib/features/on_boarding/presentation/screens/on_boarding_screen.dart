import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:life/features/on_boarding/presentation/widgets/on_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/on_boarding_screen_header.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFEEF1F6)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              OnBoardingScreenHeader(context: context),
              OnBoardingScreenItem(
                controller: controller,
                onBoardingList: onBoardingList,
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              SmoothPageIndicator(
                controller: controller,
                count: onBoardingList.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: Colors.grey,
                  dotWidth: 12,
                  dotHeight: 12,
                  expansionFactor: 4,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: (currentIndex + 1) / onBoardingList.length,
                backgroundColor: Colors.grey.shade300,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
              const SizedBox(height: 20),
              buildFloatingActionButton(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      onPressed: () {
        if (currentIndex == onBoardingList.length - 1) {
          context.pushNamedAndRemoveUntil(Routes.login, (c) => false);
        } else {
          controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Icon(
        currentIndex == onBoardingList.length - 1
            ? Icons.check
            : Icons.arrow_forward_ios,
        key: ValueKey<int>(currentIndex),
        color: Colors.white,
      ),
    );
  }
}

