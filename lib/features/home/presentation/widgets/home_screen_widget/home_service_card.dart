import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class HomeServiceCard extends StatelessWidget {
  const HomeServiceCard({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColors.primaryColor.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            10.height,
            Image.asset(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.19,
              Assets.imagesMainNurse,
              fit: BoxFit.fill,
            ),
            15.height,
            InkWell(
              onTap: () {
                context.read<HomeCubit>().changeIndex(1);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        S.of(context).check_service,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
