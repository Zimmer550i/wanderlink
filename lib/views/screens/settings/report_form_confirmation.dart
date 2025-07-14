import 'package:flutter/material.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';

class ReportFormConfirmation extends StatelessWidget {
  const ReportFormConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Report Form\nSubmitted",
      hasNavbar: false,
      isScrollable: false,
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Text(
                  "Thanks for helping keep our community safe. we’ll review your report as soon as possible.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xff1C75BC),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomSvg(asset: "assets/icons/fly.svg"),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ],
    );
  }
}
