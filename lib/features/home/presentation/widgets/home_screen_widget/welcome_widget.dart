import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/features/home/presentation/manager/home_state.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: -0.25,
    ).animate(controller);

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.2),
            AppColors.primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Row(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final name = context.read<HomeCubit>().profileModel!.data!.name ?? '';
              return Flexible(
                child: RichText(
                  text: TextSpan(
                    text: greeting(context),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      const TextSpan(text: ' \t'),
                      TextSpan(
                        text: name,
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
          RotationTransition(
            turns: rotateAnimation,
            child: const Icon(
              Icons.waving_hand,
              color: AppColors.myRed,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  String greeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return S.of(context).greeting_morning;
    } else if (hour >= 12 && hour < 17) {
      return S.of(context).greeting_afternoon;
    } else if (hour >= 17 && hour < 21) {
      return S.of(context).greeting_evening;
    } else {
      return S.of(context).greeting_night;
    }
  }
}
