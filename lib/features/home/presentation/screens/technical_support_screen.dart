import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/my_text_from.dart';
import 'package:life/features/home/presentation/manager/home_cubit.dart';
import 'package:life/features/home/presentation/manager/home_state.dart';
import 'package:life/features/home/presentation/widgets/technical_support_widget/messages_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';

class TechnicalSupportScreen extends StatelessWidget {
  const TechnicalSupportScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).technical_support),
      ),
      body: BlocProvider.value(
        value:sl<HomeCubit>(),
        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => index % 2 == 0
                      ? HisMessageItem(
                          message: cubit.technicalSupportList[index])
                      : MyMessageItem(
                          message: cubit.technicalSupportList[index],
                        ),
                  itemCount: cubit.technicalSupportList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextForm(
                        label: S.of(context).typeYourQuestionHere,
                        controller: cubit.technicalSupportController,
                        validator: (String value) {},
                        prefixIcon: const Icon(Icons.edit),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            cubit.sendMessage(
                                message: cubit.technicalSupportController.text);
                          },
                          icon: const Icon(
                            Icons.send_sharp,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              20.height,
            ],
          );
        }),
      ),
    );
  }
}
