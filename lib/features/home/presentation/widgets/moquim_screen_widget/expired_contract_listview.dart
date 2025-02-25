import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';

import '../../../../../core/functions/get_language.dart';
import '../../../../../core/routes/routes.dart';
import 'contract_card.dart';

class ExpiredContractListview extends StatelessWidget {
  const ExpiredContractListview({
    super.key,
   required this.expiredContracts,
  });


  final List<ContractsData> expiredContracts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ContractCard(
        onTap: () {
          context.pushNamed(
              Routes.contractDetailsScreen,arguments:expiredContracts[index]);
        },
        title: getLanguage() == 'ar'
            ?expiredContracts[index].package!
            .name!.ar!
            : expiredContracts[index].package!
            .name!.en!,
        duration:
            expiredContracts[index].package!.duration!,
        status: expiredContracts[index].status!,
      ),
      itemCount:expiredContracts.length,
    );
  }
}