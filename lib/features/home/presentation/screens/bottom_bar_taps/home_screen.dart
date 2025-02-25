import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/features/home/presentation/manager/home_state.dart';
import 'package:life/features/home/presentation/widgets/home_screen_widget/welcome_widget.dart';
import 'package:life/generated/l10n.dart';
import '../../widgets/home_screen_widget/home_service_card.dart';
import '../../widgets/image_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              if (context.read<HomeCubit>().profileModel != null)
                const WelcomeWidget(),
              const ImageSlider(),
              10.height,
              HomeServiceCard(
                title: S.of(context).staying_offers,
                subTitle: S.of(context).month_nurse,
              ),
              20.height,
            ],
          );
        },
      ),
    );
  }
}
