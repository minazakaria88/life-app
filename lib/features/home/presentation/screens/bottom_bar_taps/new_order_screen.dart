import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/logo_image.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/generated/l10n.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../widgets/new_order_screen_widget/filter_dialog.dart';
import '../../widgets/new_order_screen_widget/order_screen_card_item.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          context.read<HomeCubit>().getNursesNationality();
        },
        child: ListView(children: [
          Column(
            children: [
              const LogoImage(),
              20.height,
              Text(
                S.of(context).choose_service,
                style: const TextStyle(
                  color:Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.height,
              OrderScreenCardItem(
                color: const Color(0xff128494),
                image: Assets.imagesContract,
                onTap: () {
                  myContractFilterDialog(context);
                },
                title: S.of(context).staying_service,
                subtitle: S.of(context).staying_service_desc,
              ),
              10.height,
              OrderScreenCardItem(
                color: const Color(0xff128494),
                image: Assets.imagesRefer,
                onTap: () {
                  context.read<HomeCubit>().changeIndex(3);
                },
                title: S.of(context).mediation_service,
                subtitle: S.of(context).mediation_service,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
