import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(20),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}