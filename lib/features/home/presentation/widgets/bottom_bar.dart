import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/home_cubit.dart';
import '../manager/home_state.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeIndex(value);
            },
            selectedIconTheme: const IconThemeData(
              color: AppColors.primaryColor,
            ),
            selectedItemColor: AppColors.primaryColor,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.barHomeBlack,
                    colorFilter: colorFilter(0, cubit.currentIndex)
                  ),
                  label: S.of(context).home),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.bottomNeworder,
                  height: 25,
                  width: 25,
                  colorFilter: colorFilter(1, cubit.currentIndex)
                ),
                label: S.of(context).new_order,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.bottomHousemaid,
                  height: 25,
                  width: 25,
                  colorFilter: colorFilter(2, cubit.currentIndex)
                ),
                label: S.of(context).moquima,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.bottomHandshake,
                  height: 25,
                  width: 25,
                  colorFilter: colorFilter(3, cubit.currentIndex)
                ),
                label: S.of(context).mediation,
              ),
            ]);
      },
    );
  }
  ColorFilter? colorFilter(int index,int selectedIndex) {
    if (index == selectedIndex) {
      return const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn);
    }
    return null;
  }

}
