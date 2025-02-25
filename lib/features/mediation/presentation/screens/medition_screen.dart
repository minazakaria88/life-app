import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import '../../../../core/widgets/shimmer_listview.dart';
import '../manager/mediation_cubit.dart';
import '../manager/mediation_state.dart';
import '../widgets/medition_listview.dart';

class MediationScreen extends StatefulWidget {
  const MediationScreen({super.key});

  @override
  State<MediationScreen> createState() => _MediationScreenState();
}

class _MediationScreenState extends State<MediationScreen> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    context.read<MediationCubit>().getMediation(page: 1);
    context.read<MediationCubit>().getMoreMediation(controller);
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediationCubit, MediationState>(
        builder: (context, state) {
      var list = context.read<MediationCubit>().mediationModel?.data?.data!;

      if (state is GetMediationLoadingState && list == null) {
        return const ShimmerListview();
      }
      if (state is GetMediationFailureState ||
          (state is GetMediationSuccessState && list == null)) {
        return const NoResultWidget();
      }
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            children: [
              20.height,
              MeditionListview(
                controller: controller,
                list: list!,
                state: state,
              ),
              30.height,
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                context.pushNamed(Routes.addMediation);
              },
              backgroundColor: AppColors.primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    });
  }
}


