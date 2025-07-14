import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/settings/report_form_confirmation.dart';

class ReportForm extends StatefulWidget {
  final bool isPost;
  const ReportForm({super.key, this.isPost = false});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  List<String> reasons = [
    "Spams or Scams",
    "Harassment or Bullying",
    "Hate Speech or Violence",
    "Nudity or Sexual Content",
    "Misinformation",
    "Intellectual Property Violation",
    "Impersonation",
    "Other . . .",
  ];
  int? index;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Report Form",
      hasNavbar: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You’ve reported",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff1C75BC),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ProfilePicture(
                    image: "Https://thispersondoesnotexist.com",
                    size: 40,
                    borderWidth: 1.5,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Derek’s ${widget.isPost ? "Post" : "Profile"}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          height: 1,
                        ),
                      ),
                      Text(
                        "@derektravels",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xb81B1F26),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                "Help us keep the community safe- select a reason for reporting this . . .",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0xff1C75BC),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 48, top: 10, bottom: 10),
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
            child: Column(
              children: [
                for (int i = 0; i < reasons.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index == i) {
                          index = null;
                        } else {
                          index = i;
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: i == index
                                ? Color(0xff2F80ED).withAlpha(26)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              reasons[i],
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffACACAC),
                              ),
                            ),
                          ),
                        ),
                        if (i != reasons.length - 1)
                          Divider(color: Color(0x80c4c4c4)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
              maxLines: 4,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "You can add any other details here . . .",
                hintStyle: TextStyle(fontSize: 14, color: Color(0xffACACAC)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 60),
          child: CustomButton(
            onTap: () {
              Get.to(() => ReportFormConfirmation());
            },
            text: "Submit",
            trailing: "assets/icons/arrow_right.svg",
          ),
        ),
      ],
    );
  }
}
