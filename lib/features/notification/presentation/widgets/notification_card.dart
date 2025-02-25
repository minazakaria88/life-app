import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

import '../../../../core/functions/get_language.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.model,
  });

  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: getLanguage() == 'ar'
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.data.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                5.width,
                const Icon(
                  Icons.notifications_active,
                  color: AppColors.myRed,
                )
              ],
            ),
            8.height,
            Text(
              model.data.message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
