import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "About Us",
      hasNavbar: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                Text(
                  "About Us",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff1C75BC),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                  style: TextStyle(fontSize: 13, color: Color(0xff929292)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                Text(
                  "Our story",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff1C75BC),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et. Tap to change phone number Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut. ",
                  style: TextStyle(fontSize: 13, color: Color(0xff929292)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
