import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life/constant.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/loader_widget.dart';
import 'package:life/features/login/presentation/manager/login_cubit.dart';
import 'package:life/features/login/presentation/manager/login_state.dart';
import 'package:life/generated/l10n.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../generated/assets.dart';
import '../functions/show_snack_bar.dart';
import '../routes/routes.dart';
import '../utils/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key, required this.phoneNumber, required this.otpAction});
  final String phoneNumber;
  final OtpAction otpAction; // login or reset password
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    listenForCode();
    super.initState();
  }

  Timer? otpTimer;
  String seconds = '60';
  void startTimer() {
    otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds = '${60 - timer.tick}'.padLeft(2, '0');
      });
      if (timer.tick == 60) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    otpTimer?.cancel();
  }

  String currentCode = '';

  listenForCode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is VerifyOtpFailure) {
        showSnackBar(
          message: state.message,
          context: context,
          title: S.of(context).loginFailed,
          contentType: ContentType.failure,
        );
      }
      if (state is VerifyOtpSuccess) {

        if (widget.otpAction == OtpAction.login) {
          showSnackBar(
            message: S.of(context).loginSuccessfully,
            context: context,
            title: S.of(context).loginSuccessfully,
            contentType: ContentType.success,
          );
          context.pushNamedAndRemoveUntil(Routes.mainScreen, (c) => false);


        } else {
          showSnackBar(
            message: S.of(context).passwordResetSuccessfully,
            context: context,
            title: S.of(context).passwordResetSuccessfully,
            contentType: ContentType.success,
          );
          context.pushNamedAndRemoveUntil(Routes.resetPassword, (c) => false);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                    width: double.infinity,
                  ),
                  SvgPicture.asset(
                    Assets.imagesOtp,
                    width: 230.78,
                    height: 242.18,
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).otp_verification,
                        style: const TextStyle(
                            color: AppColors.greyDeep,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      // 10.width,
                      // Container(
                      //   padding: const EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: AppColors.primaryColor,
                      //   ),
                      //   child: Text(
                      //     '00:$seconds',
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ],
                  ),
                  20.height,
                  RichText(
                    text: TextSpan(
                      text: S.of(context).enter_the_code_sent_to,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '  +966 ${widget.phoneNumber}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.greyDeep,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10),
                    child: PinFieldAutoFill(
                      smsCodeRegexPattern: r"\d{4}",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      autoFocus: true,
                      cursor: Cursor(
                        enabled: true,
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: CirclePinDecoration(
                          strokeColorBuilder: const FixedColorBuilder(
                        AppColors.black,
                      )),
                      currentCode: currentCode,
                      onCodeSubmitted: (code) {},
                      onCodeChanged: (String? code) {
                        currentCode = code ?? '';
                        if (code?.length == 4) {
                          context.read<LoginCubit>().verifyOtp(
                              code: code!,
                              errorMsg: S
                                  .of(context)
                                  .msg_verification_code_is_invalid,
                              phone: widget.phoneNumber);
                        }
                      },
                      codeLength: 4,
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).did_not_receive_the_code,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).resend_code,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              if (state is VerifyOtpLoading)
                const Positioned.fill(child: LoaderWidget()),
            ],
          ),
        ),
      );
    });
  }
}
