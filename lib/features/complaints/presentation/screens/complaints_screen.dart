import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/routes/routes.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/complaints/presentation/manager/complaints_cubit.dart';
import 'package:life/features/complaints/presentation/manager/complaints_state.dart';
import 'package:life/features/complaints/presentation/widgets/complaints_list_view_item.dart';
import 'package:life/generated/assets.dart';
import 'package:life/generated/l10n.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/no_result_widget.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          S.of(context).tickets,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  context.pushNamed(
                    Routes.addComplaint,
                    arguments: context.read<ComplaintsCubit>(),
                  );
                },
                icon: SvgPicture.asset(
                  Assets.imagesPlus,
                  height: 20,
                  width: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          20.height,
          BlocBuilder<ComplaintsCubit, ComplaintsState>(
            buildWhen: (previous, current) {
              return current is ComplaintsSuccess ||
                  current is ComplaintsError ||
                  current is ComplaintsLoading;
            },
            builder: (context, state) {
              var list = context.read<ComplaintsCubit>().complaints?.data;
              if (state is ComplaintsSuccess && list!.isEmpty ||
                  state is ComplaintsError) {
                return const NoResultWidget();
              }
              return list == null || state is ComplaintsLoading
                  ? const Expanded(child: ShimmerListview())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) => ComplaintsListViewItem(
                          title: list[index].title!,
                          image: 'https://kdamat.com${list[index].file}',
                          subTitle: index % 2 == 0
                              ? S.of(context).closed
                              : S.of(context).opened,
                          color: index % 2 == 0
                              ? AppColors.myRed
                              : AppColors.myBlue,
                          label1: S.of(context).contract_id,
                          label2: S.of(context).type,
                          label3: S.of(context).date,
                          value1: '${list[index].contract!.id}',
                          value2: '${list[index].type}',
                          value3: '${list[index].createdAt}',
                          note: list[index].description!,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
