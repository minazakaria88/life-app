import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/utils/app_colors.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/features/home/presentation/manager/home_state.dart';
import 'package:life/generated/l10n.dart';
import '../../widgets/moquim_screen_widget/active_contract_listview.dart';
import '../../widgets/moquim_screen_widget/all_contract_listview.dart';
import '../../widgets/moquim_screen_widget/expired_contract_listview.dart';

class MoquimScreen extends StatelessWidget {
  const MoquimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: AppColors.primaryColor.withOpacity(0.1),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 15),
                  unselectedLabelStyle: const TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor,
                  ),
                  tabs: [
                    Tab(text: S.of(context).all_contracts),
                    Tab(text: S.of(context).active),
                    Tab(text: S.of(context).expired),
                  ],
                ),
              ),
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                var cubit = context.read<HomeCubit>();
                return Padding(
                  padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
                  child: TabBarView(
                    children: [
                      _buildContractList(
                        context,
                        isLoading: cubit.isLoading,
                        isEmpty: cubit.allContracts.isEmpty,
                        emptyText: S.of(context).no_contracts,
                        child: AllContractListview(allContracts: cubit.allContracts),
                      ),
                      _buildContractList(
                        context,
                        isLoading: cubit.isLoading,
                        isEmpty: cubit.activeContracts.isEmpty,
                        emptyText: S.of(context).no_active_contracts,
                        child: ActiveContractListView(activeContracts: cubit.activeContracts),
                      ),
                      _buildContractList(
                        context,
                        isLoading: cubit.isLoading,
                        isEmpty: cubit.expiredContracts.isEmpty,
                        emptyText: S.of(context).no_expired_contracts,
                        child: ExpiredContractListview(expiredContracts: cubit.expiredContracts),
                      ),
                    ],
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
  Widget _buildContractList(
      BuildContext context, {
        required bool isLoading,
        required bool isEmpty,
        required String emptyText,
        required Widget child,
      }) {
    if (isLoading) {
      return const ShimmerListview();
    } else if (isEmpty) {
      return Center(child: Text(emptyText));
    } else {
      return child;
    }
  }
}
