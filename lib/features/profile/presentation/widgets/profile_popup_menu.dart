import 'package:flutter/material.dart';

import '../../../../core/functions/my_dialog.dart';
import '../../../../generated/l10n.dart';

class ProfilePopupMenu extends StatelessWidget {
  const ProfilePopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(S.of(context).delete_account),
            onTap: () => showMyDialog(
              context: context,
              alignment: Alignment.topCenter,
              message: S
                  .of(context)
                  .are_you_sure_you_want_to_delete_account,
              confirm: S.of(context).confirm,
              confirmAction: () {

              },
            ),
          ),
        ]);
  }
}
