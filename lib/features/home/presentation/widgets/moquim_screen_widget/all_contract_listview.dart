import 'package:flutter/widgets.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/nurse_data/data/models/contract_model.dart';

import '../../../../../core/functions/get_language.dart';
import '../../../../../core/routes/routes.dart';
import 'contract_card.dart';

class AllContractListview extends StatelessWidget {
  const AllContractListview({
    super.key,
    required this.allContracts,
  });


  final List<ContractsData> allContracts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => ContractCard(
          onTap: () {
            context.pushNamed(
                Routes.contractDetailsScreen,arguments: allContracts[index]);
          },
          title: getLanguage() == 'ar'
              ?allContracts[index].package!
              .name!.ar!
              : allContracts[index].package!
              .name!.en!,
          duration: allContracts[index].package!.duration!,
          status: allContracts[index].status!,
          price:allContracts[index].price!,
          tax:
          allContracts[index].package!.tax!,
        ),
        itemCount:allContracts.length);
  }
}