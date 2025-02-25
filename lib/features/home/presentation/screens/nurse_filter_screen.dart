import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/home_state.dart';
import '../widgets/nurse_filter_listview.dart';

class NurseFilterScreen extends StatefulWidget {
  const NurseFilterScreen({super.key});

  @override
  State<NurseFilterScreen> createState() => _NurseFilterScreenState();
}

class _NurseFilterScreenState extends State<NurseFilterScreen> {
  late final HomeCubit homeCubit;
  final ScrollController nurseFilterController = ScrollController();
  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    homeCubit.getMoreNurses(nurseFilterController);
    super.initState();
  }

  @override
  void dispose() {
    homeCubit.filterNurses = null;
    nurseFilterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).service_request),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      30.height,
                      Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xFF333333),
                        ),
                      ),
                      20.height,
                    ],
                  ),
                  AnimatedContainer(
                    height: state is GetFilterNursesLoadingState ? 150 : 200,
                    duration: const Duration(seconds: 1),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesNurse,
                          fit: BoxFit.fill,
                        ),
                        20.width,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              S.of(context).getYourNurse,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  controller: nurseFilterController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: 10.height,
                    ),
                    cubit.filterNurses == null
                        ? state is GetFilterNursesLoadingState
                            ? const SliverFillRemaining(
                                child: ShimmerListview(),
                              )
                            : const SliverToBoxAdapter(child: NoResultWidget())
                        : cubit.filterNurses!.data!.isEmpty
                            ? const SliverToBoxAdapter(child: NoResultWidget())
                            : NurseFilterListView(
                                nurseList: cubit.filterNurses!.data!,
                                state: state,
                              ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
