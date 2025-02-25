import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life/core/helpers/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../manager/complaints_cubit.dart';

Future<dynamic> showFileDialog(BuildContext context, ComplaintsCubit cubit) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  cubit.pickImage(source: ImageSource.gallery);
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    2.width,
                    Text(
                      S.of(context).gallery,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            10.width,
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  cubit.pickImage(source: ImageSource.camera);
                  context.pop();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColors.myRed),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    2.width,
                    Text(
                      S.of(context).camera,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
