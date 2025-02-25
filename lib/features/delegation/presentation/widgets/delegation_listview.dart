import 'package:flutter/material.dart';
import 'package:life/core/functions/my_dialog.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../constant.dart';
import '../../../../core/functions/get_language.dart';
import '../../../../core/routes/routes.dart';
import '../../../../generated/l10n.dart';
import '../manager/delegation_cubit.dart';
import 'delegation_card.dart';

class DelegationListview extends StatelessWidget {
  const DelegationListview({
    super.key,
    required this.cubit,
  });

  final DelegationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
          itemBuilder: (context, index) => DataShowCard(
                edit: () {
                  cubit.delegationId = cubit.delegations!.data[index].id!;
                  cubit.fillData(cubit.delegations!.data[index]);
                  context.pushNamed(
                    Routes.addDelegation,
                    arguments: {
                      'action': DelegationAction.edit,
                      'cubit': cubit
                    },
                  );
                },
                remove: () {
                  showMyDialog(
                    context: context,
                    message: S
                        .of(context)
                        .are_you_sure_you_want_to_delete_delegation,
                    confirm: S.of(context).delete_delegation,
                    confirmAction: () {
                      cubit.deleteDelegation(
                          id: cubit.delegations!.data[index].id!);
                      context.pop();
                    },
                  );
                },
                title: cubit.delegations!.data[index].name ?? '',
                label1: S.of(context).iqama,
                label2: S.of(context).country,
                label3: S.of(context).phoneNumber,
                value1: cubit.delegations!.data[index].iqama ?? '',
                value2: getLanguage() == 'en'
                    ? cubit.delegations!.data[index].nationality!.name!.en ?? ''
                    : cubit.delegations!.data[index].nationality!.name!.ar ??
                        '',
                value3: cubit.delegations!.data[index].phone ?? '',
              ),
          itemCount: cubit.delegations!.data.length),
    );
  }
}
