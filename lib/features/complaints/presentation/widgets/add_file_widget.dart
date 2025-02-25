import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class AddFileWidget extends StatelessWidget {
  const AddFileWidget({
    super.key,
    required this.onTap,
  });

final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyDeep),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload_file,
              color: Colors.red,
            ),
            10.width,
            Text(
              S.of(context).upload_file,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}