import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/features/complaints/presentation/widgets/priority_menu.dart';
import 'package:life/features/complaints/presentation/widgets/select_image_bottom_model.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/loader_widget.dart';
import '../../../../generated/l10n.dart';
import '../manager/complaints_cubit.dart';
import '../manager/complaints_state.dart';
import 'add_complaint_button.dart';
import 'add_file_widget.dart';
import 'complaint_text_form_field.dart';

class AddComplaintsBody extends StatelessWidget {
  const AddComplaintsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComplaintsCubit, ComplaintsState>(
      listener: (context, state) {
        if (state is AddComplaintsSuccess) {
          showSnackBar(
            message: S.of(context).msg_ticket_success,
            context: context,
            title: S.of(context).msg_ticket_success,
            contentType: ContentType.success,
          );
          context.pop();
        }
        if (state is AddComplaintsError) {
          showSnackBar(
            message: state.message,
            context: context,
            title: state.message,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<ComplaintsCubit>();
        return Form(
          key: cubit.formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.height,
                          Text(
                            S.of(context).ticket_name,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          ComplaintsTextFormField(
                            controller: cubit.titleController,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).msg_ticket_title_required;
                              } else if (value.length < 6) {
                                return S
                                    .of(context)
                                    .msg_ticket_title_most_by_more_than_6_characters;
                              }
                              return null;
                            },
                          ),
                          20.height,
                          Text(
                            S.of(context).notes,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          ComplaintsTextFormField(
                            controller: cubit.noteController,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).msg_ticket_note_required;
                              } else if (value.length < 16) {
                                return S
                                    .of(context)
                                    .msg_ticket_note_most_by_more_than_16_characters;
                              }
                              return null;
                            },
                            maxLines: 4,
                          ),
                          20.height,
                          Text(
                            S.of(context).ticket_priority,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          PriorityMenu(cubit: cubit),
                          20.height,
                          Text(
                            S.of(context).upload_file,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          AddFileWidget(
                            onTap: () {
                              //showFileDialog(context, cubit);
                              buildShowModalBottomSheet(context, cubit);
                            },
                          ),
                          10.height,
                          if (cubit.image != null)
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(cubit.image!.path),
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      cubit.clearImage();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 30,
                                    )),
                              ],
                            ),
                          20.height,
                          AddComplaintButton(cubit: cubit),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (state is AddComplaintsLoading)
                const Positioned.fill(child: LoaderWidget()),
            ],
          ),
        );
      },
    );
  }


}
