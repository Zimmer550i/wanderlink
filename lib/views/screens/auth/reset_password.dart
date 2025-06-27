import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final passCtrl = TextEditingController();
  final conPassCtrl = TextEditingController();

  void onClick() async {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      appbarPadding: false,
      children: [
        Text(
          "Reset Your Password",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        const SizedBox(height: 47),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomTextField(
            hintText: "New Password...",
            controller: passCtrl,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomTextField(
            hintText: "Retype your new Password...",
            controller: conPassCtrl,
          ),
        ),
        const SizedBox(height: 96),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(text: "Save"),
        ),
      ],
    );
  }
}
