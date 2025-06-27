import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/auth/create_profile.dart';
import 'package:wanderlink/views/screens/auth/reset_password.dart';

class OtpVerification extends StatefulWidget {
  final bool isResettingPass;
  const OtpVerification({super.key, required this.isResettingPass});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final FocusNode _focusNode = FocusNode();

  void onClick() async {
    if (widget.isResettingPass) {
      Get.to(() => ResetPassword());
    }else{
      Get.to(() => CreateProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      appbarPadding: false,
      children: [
        Text(
          "Verification Code",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        const SizedBox(height: 21),
        Text("Please enter code we just send to", textAlign: TextAlign.center),
        Text(
          "dereksmith@gmail.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 21),
        Pinput(
          length: 4,
          focusNode: _focusNode,
          preFilledWidget: Text(
            "_",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          onTapOutside: (event) {
            _focusNode.unfocus();
          },
          defaultPinTheme: PinTheme(
            height: 56,
            width: 56,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 21),
        Text("Didn’t receive OTP?"),
        Text(
          "Resend OTP",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xffFF5069),
            decorationColor: Color(0xffFF5069),
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(text: "Verify", onTap: onClick),
        ),
      ],
    );
  }
}
