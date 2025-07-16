import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';

class CreateUsername extends StatefulWidget {
  final void Function(String?) onSubmit;
  const CreateUsername({super.key, required this.onSubmit});

  @override
  State<CreateUsername> createState() => _CreateUsernameState();
}

class _CreateUsernameState extends State<CreateUsername> {
  String? errorText = "This username already exists";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 38),
        Text(
          "Country From",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomTextField(errorText: errorText, darkerShadow: false),
        ),
        const SizedBox(height: 245),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            text: "Save",
            onTap: () {
              widget.onSubmit(errorText);
            },
          ),
        ),
      ],
    );
  }
}
