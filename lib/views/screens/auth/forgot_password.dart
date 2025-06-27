import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';
import 'package:wanderlink/views/screens/auth/otp_verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailCtrl = TextEditingController();

  void onClick() async {
    Get.to(() => OtpVerification(isResettingPass: true));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      appbarPadding: false,
      children: [
        Text(
          "Forgot Your Password?",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        const SizedBox(height: 21),
        Text(
          "Please enter the email address associated with your account and we’ll send you a verification link.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff333333)),
        ),
        const SizedBox(height: 38),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextField(hintText: "Email Address"),
        ),
        const SizedBox(height: 84),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButton(text: "Send", onTap: onClick),
        ),
      ],
    );
  }
}
