import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../nurse_data/data/models/nurse_data_model.dart';
import '../manager/order_cubit.dart';
import 'order_package_listview.dart';
import 'order_payment_widget.dart';
import 'order_personal_data.dart';
import 'order_summary.dart';

class OrderStepperWidget extends StatelessWidget {
  const OrderStepperWidget({
    super.key,
    required this.cubit,
    required this.model,
  });

  final OrderCubit cubit;
  final NurseDataModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stepper(
        currentStep: cubit.currentStep,
        controlsBuilder: (context, details) => Row(
          children: [
            if (cubit.currentStep != 0 && cubit.currentStep != 3)
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: details.onStepCancel,
                child: Text(
                  S.of(context).previous,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(width: 30),
            if (cubit.currentStep != 3)
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: details.onStepContinue,
                child: Text(
                  S.of(context).continue1,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            if (cubit.currentStep == 3)
              ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  cubit.makeOrder({
                    "musaneda_id": model.id,
                    "package_id": cubit.packagesData!.id,
                    "city_id": cubit.selectedCityId,
                    "location_id": cubit.selectedLocationId,
                    "branch_id": cubit.selectedBranchId,
                    "transfer": 0,
                    "merchant_transaction_id": 25,
                  });
                },
                child: Text(
                  S.of(context).makeOrder,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
        onStepTapped: (index) {
          cubit.changeStep(
            index,
            branchError: S.of(context).selectBranch,
            locationError: S.of(context).selectLocation,
            cityError: S.of(context).selectCity,
            packageError: S.of(context).selectPackage,
          );
        },
        onStepCancel: () {
          cubit.changeStep(
            cubit.currentStep - 1,
            branchError: S.of(context).selectBranch,
            locationError: S.of(context).selectLocation,
            cityError: S.of(context).selectCity,
            packageError: S.of(context).selectPackage,
          );
        },
        onStepContinue: () {
          cubit.changeStep(
            cubit.currentStep + 1,
            branchError: S.of(context).selectBranch,
            locationError: S.of(context).selectLocation,
            cityError: S.of(context).selectCity,
            packageError: S.of(context).selectPackage,
          );
        },
        steps: [
          Step(
              isActive: cubit.currentStep >= 0,
              state: _getStepState(0),
              title: Text(S.of(context).your_data),
              content: OrderPersonalData(cubit: cubit)),
          Step(
            isActive: cubit.currentStep >= 1,
            state: _getStepState(1),
            title: Text(S.of(context).package),
            content: OrderPackageListview(
              cubit: cubit,
            ),
          ),
          Step(
            isActive: cubit.currentStep >= 2,
            state: _getStepState(2),
            title: Text(S.of(context).summary),
            content: cubit.packagesData != null
                ? OrderSummaryWidget(model: model, cubit: cubit)
                : const SizedBox(),
          ),
          Step(
            isActive: cubit.currentStep == 3,
            state: _getStepState(3),
            title: Text(S.of(context).payment),
            content: cubit.packagesData != null
                ? OrderPaymentWidget(total: cubit.packagesData!.total)
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  StepState _getStepState(int index) {
    if (cubit.currentStep == index) {
      return StepState.editing;
    } else if (cubit.currentStep > index) {
      return StepState.complete;
    }
    return StepState.disabled;
  }
}
