import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/settings/get_in_touch.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  List<bool> expanded = [false, false, false];
  List<String> titles = [
    "Data Management",
    "Account Management",
    "Payment Queries",
  ];
  String placeHolder =
      "Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Help Center",
      hasNavbar: false,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomButton(
            onTap: () {
              Get.to(() => GetInTouch());
            },
            text: "Get in touch",
            trailing: "assets/icons/arrow_right.svg",
            width: 248,
          ),
        ),
        const SizedBox(height: 30),
        dropDownInfoBox(titles[0], placeHolder, 0),
        const SizedBox(height: 20),
        dropDownInfoBox(titles[1], placeHolder, 1),
        const SizedBox(height: 20),
        dropDownInfoBox(titles[2], placeHolder, 2),
      ],
    );
  }

  Widget dropDownInfoBox(String title, String details, int pos) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          setState(() {
            expanded[pos] = !expanded[pos];
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff1C75BC),
                    ),
                  ),
                  Spacer(),
                  AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: expanded[pos] ? 0.5 : 0,
                    child: CustomSvg(
                      asset: "assets/icons/arrow_down.svg",
                      color: Color(expanded[pos] ? 0xffFF9811 : 0xb2AEAEAE),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: expanded[pos]
                    ? Column(
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            details,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff929292),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(width: double.infinity, height: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
