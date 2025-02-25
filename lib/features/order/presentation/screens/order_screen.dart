import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/functions/show_snack_bar.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/loader_widget.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/features/nurse_data/data/models/nurse_data_model.dart';
import 'package:life/features/order/presentation/manager/order_cubit.dart';
import 'package:life/features/order/presentation/manager/order_state.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/check_state.dart';
import '../widgets/order_stepper_widget.dart';
import '../widgets/shimmer_stepper.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    required this.nurseDataModel,
  });
  final NurseDataModel nurseDataModel;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context
        .read<OrderCubit>()
        .getAllData(id: widget.nurseDataModel.nationality!.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).new_order),
      ),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          checkState(context, state);

          if (state is MakeOrderSuccessState) {
            showSnackBar(
              message: S.of(context).msg_order_success,
              context: context,
              title: S.of(context).msg_order_success,
              contentType: ContentType.success,
            );
            context.popUntil(Routes.mainScreen);
          }
        },
        builder: (context, state) {
          var cubit = context.read<OrderCubit>();
          return cubit.getData
              ? Theme(
                  data: ThemeData(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: AppColors.primaryColor,
                        ),
                  ),
                  child: Stack(
                    children: [
                      OrderStepperWidget(
                          cubit: cubit, model: widget.nurseDataModel),
                      state is MakeOrderLoadingState
                          ? const Positioned.fill(child: LoaderWidget())
                          : const SizedBox()
                    ],
                  ),
                )
              : state is GetAllDataFailureState
                  ? const NoResultWidget()
                  : const ShimmerStepper();
        },
      ),
    );
  }
}
