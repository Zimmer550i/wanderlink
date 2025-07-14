import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/settings/get_in_touch_confirmation.dart';

class GetInTouch extends StatefulWidget {
  const GetInTouch({super.key});

  @override
  State<GetInTouch> createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {
  final titleCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Get in Touch",
      hasNavbar: false,
      sidePadding: 24,
      children: [
        const SizedBox(height: 20),
        Text(
          "Fill out the form below to get in touch. If you’ve got issues, feedback or anything else, we’d love to hear it!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff1C75BC),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: Colors.black.withAlpha((12 * 2.55).toInt()),
              ),
            ],
          ),
          child: Center(
            child: TextField(
              controller: titleCtrl,
              decoration: InputDecoration( 
                border: InputBorder.none,
                hintText: "Type the subject line . . .",
                hintStyle: TextStyle(fontSize: 14, color: Color(0xffACACAC)),
                isDense: true
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: Colors.black.withAlpha((12 * 2.55).toInt()),
              ),
            ],
          ),
          child: TextField(
            controller: detailsCtrl,
            maxLines: 15,
            decoration: InputDecoration(border: InputBorder.none,
                hintText: "What’s up? . . .",
                hintStyle: TextStyle(fontSize: 14, color: Color(0xffACACAC)),
                isDense: true),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomButton(
            onTap: () {
              Get.to(() => GetInTouchConfirmation());
            },
            text: "Send form",
            trailing: "assets/icons/arrow_right.svg",
            width: 248,
          ),
        ),
      ],
    );
  }
}
