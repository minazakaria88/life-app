import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/widgets/moquim_screen_widget/contract_details_card.dart';
import '../../data/models/mediation_model.dart';
import '../manager/mediation_state.dart';

class MeditionListview extends StatelessWidget {
  const MeditionListview({
    super.key,
    required this.controller,
    required this.list,
    required this.state,
  });

  final ScrollController controller;
  final List<MediationData> list;
  final MediationState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => 5.height,
        controller: controller,
        itemCount: list.length + 1,
        itemBuilder: (context, index) => index == list.length
            ? state is GetMediationLoadingState
            ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
            : const SizedBox()
            : ContractDetailsCard(
          title: S.of(context).status,
          subTitle: list[index].statusText ?? '',
          label1: S.of(context).job,
          label2: S.of(context).experience,
          label3: S.of(context).country,
          value1: list[index].job ?? '',
          value2: list[index].experience ?? '',
          value3: list[index].country ?? '',
        ),
      ),
    );
  }
}