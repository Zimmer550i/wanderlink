import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_app_bar.dart';
import 'package:wanderlink/views/base/custom_bottom_navbar.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';
import 'package:wanderlink/views/base/profile_picture.dart';

class DesignSystem extends StatefulWidget {
  const DesignSystem({super.key});

  @override
  State<DesignSystem> createState() => _DesignSystemState();
}

class _DesignSystemState extends State<DesignSystem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F9BE9),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              CustomAppBar(title: "Design System"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  spacing: 16,
                  children: [
                    CustomSearchBar(hintText: "Search Country..."),
                    ProfilePicture(
                      image: "https://picsum.photos/500/500",
                      isEditable: true,
                    ),
                    CustomTextField(
                      leading: "assets/icons/email.svg",
                      hintText: "Email...",
                    ),
                    CustomTextField(
                      leading: "assets/icons/password.svg",
                      hintText: "Password...",
                      isPassword: true,
                    ),
                    CustomButton(
                      text: "Save",
                      trailing: "assets/icons/arrow_right.svg",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavbar(
              index: index,
              onClick: (p0) {
                setState(() {
                  index = p0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
