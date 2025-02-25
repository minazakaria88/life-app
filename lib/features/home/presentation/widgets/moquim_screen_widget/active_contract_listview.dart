import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../../core/functions/get_language.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../nurse_data/data/models/contract_model.dart';
import 'contract_card.dart';

class ActiveContractListView extends StatelessWidget {
  const ActiveContractListView({
    super.key,
  required this.activeContracts,
  });


  final List<ContractsData> activeContracts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => ContractCard(
          onTap: () {
            context.pushNamed(
                Routes.contractDetailsScreen,arguments: activeContracts[index]);
          },
          title: getLanguage() == 'ar'
              ? activeContracts[index].package!
              .name!.ar!
              : activeContracts[index].package!
              .name!.en!,
          duration: activeContracts[index]
              .package!.duration!,
          status:
          activeContracts[index].status!,
        ),
        itemCount: activeContracts.length);
  }
}