import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/features/complaints/presentation/manager/complaints_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../widgets/add_complaints_body.dart';

class AddComplaintsScreen extends StatelessWidget {
  const AddComplaintsScreen({super.key, required this.cubit});
  final ComplaintsCubit cubit ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          S.of(context).add_ticket,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: BlocProvider.value(
        value: cubit,
        child: const AddComplaintsBody(),
      ),
    );
  }
}




