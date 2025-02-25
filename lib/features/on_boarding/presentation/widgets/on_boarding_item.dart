
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/on_boarding_model.dart';

class OnBoardingScreenItem  extends StatelessWidget {
  const OnBoardingScreenItem ({super.key, required this.controller, required this.onBoardingList, required this.onPageChanged});
  final PageController controller;
  final List<OnBoardingModel> onBoardingList;
  final Function onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: onBoardingList.length,
        onPageChanged: (index) {
          onPageChanged(index);
        },
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    onBoardingList[index].image,
                    height: 200,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                onBoardingList[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                onBoardingList[index].description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


