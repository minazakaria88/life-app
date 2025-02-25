import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';

Future<dynamic> showOtpDialog({
  required BuildContext context,
  required String currentCode,
  required Function onSubmit,
  required bool isLoading,
  required Function onCodeChange,
}) {
  return showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).verification_code,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                20.height,
                PinFieldAutoFill(
                  cursor: Cursor(
                    color: AppColors.primaryColor,
                    enabled: true,
                    width: 2,
                  ),
                  keyboardType: TextInputType.number,
                  codeLength: 4,
                  decoration: UnderlineDecoration(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      color: AppColors.primaryColor,
                    ),
                    colorBuilder: const FixedColorBuilder(
                      AppColors.primaryColor,
                    ),
                    gapSpace: 20,
                    lineHeight: 2,
                  ),
                  smsCodeRegexPattern: r"\d{4}",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  currentCode: currentCode,
                  onCodeChanged: (code) {
                    onCodeChange(code);
                  },
                ),
                20.height,
                Row(
                  children: [
                    Text(
                      S.of(context).did_not_receive_the_code,
                    ),
                    TextButton(
                      onPressed: () {
                        onSubmit();
                      },
                      child: Text(
                        S.of(context).resend_code,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if(isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor,),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
