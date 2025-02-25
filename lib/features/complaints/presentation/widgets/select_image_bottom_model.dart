import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../generated/l10n.dart';
import '../manager/complaints_cubit.dart';

Future<dynamic> buildShowModalBottomSheet(
    BuildContext context, ComplaintsCubit cubit) {
  return showModalBottomSheet(
    isDismissible: true,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).select_image_source,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  cubit.pickImage(source: ImageSource.camera);
                  context.pop();
                },
                title: Text(
                  S.of(context).camera,
                  style: const TextStyle(fontSize: 16),
                ),
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              ListTile(
                onTap: () {
                  cubit.pickImage(source: ImageSource.gallery);
                  context.pop();
                },
                title: Text(
                  S.of(context).gallery,
                  style: const TextStyle(fontSize: 16),
                ),
                leading: const Icon(Icons.image, color: Colors.green),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
        ),
      );
    },
  );
}