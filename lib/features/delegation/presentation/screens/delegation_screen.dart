import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/delegation/presentation/manager/delegation_cubit.dart';
import 'package:life/generated/l10n.dart';
import '../../../../constant.dart';
import '../../../../core/routes/routes.dart';
import '../../../../generated/assets.dart';
import '../manager/delegation_state.dart';
import '../widgets/delegation_listview.dart';

class DelegationScreen extends StatelessWidget {
  const DelegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).delegation),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(
                  Routes.addDelegation,
                  arguments: {
                    'action': DelegationAction.add,
                    'cubit': context.read<DelegationCubit>()
                  },
                );
              },
              icon: SvgPicture.asset(
                Assets.imagesPlus,
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DelegationCubit, DelegationState>(
          builder: (context, state) {
        var cubit = context.read<DelegationCubit>();
        return state is DelegationLoadingState ||
                state is DeleteDelegationLoadingState
            ? const ShimmerListview()
            : cubit.delegations != null && cubit.delegations!.data.isNotEmpty
                ? DelegationListview(cubit: cubit)
                : const NoResultWidget();
      }),
    );
  }
}
