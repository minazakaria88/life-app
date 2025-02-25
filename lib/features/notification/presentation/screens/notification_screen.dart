import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/core/widgets/shimmer_listview.dart';
import 'package:life/features/notification/presentation/manager/notification_cubit.dart';
import 'package:life/features/notification/presentation/manager/notification_state.dart';
import 'package:life/generated/l10n.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    context.read<NotificationCubit>().getNotifications(page: 1);
    context.read<NotificationCubit>().getMoreNotifications(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notification),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
        var cubit = context.read<NotificationCubit>();

        if (state is GetNotificationLoadingState &&
            cubit.notifications.isEmpty) {
          return const ShimmerListview();
        }

       else if (state is GetNotificationFailureState|| cubit.notifications.isEmpty) {
          return const NoResultWidget();
        }

        return ListView.builder(
          controller: controller,
          itemBuilder: (context, index) => index == cubit.notifications.length
              ? state is GetNotificationLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor))
                  : const SizedBox()
              : NotificationCard(model: cubit.notifications[index]),
          itemCount: cubit.notifications.length + 1,
        );
      }),
    );
  }
}
