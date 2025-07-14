import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/auth/create_profile.dart';
import 'package:wanderlink/views/screens/settings/about_us.dart';
import 'package:wanderlink/views/screens/settings/friends_and_followers.dart';
import 'package:wanderlink/views/screens/settings/help_center.dart';
import 'package:wanderlink/views/screens/settings/my_countries.dart';
import 'package:wanderlink/views/screens/settings/preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      tabIndex: 3,
      title: "Settings",
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  options(
                    "pen",
                    "Profile Settings",
                    CreateProfile(editProfile: true),
                  ),
                  options("world", "My Countries", MyCountries()),
                  options(
                    "social",
                    "Friends and Followers",
                    FriendsAndFollowers(),
                  ),
                  options("bell", "Preferences", Preferences()),
                  options("about", "About Us", AboutUs()),
                  options(
                    "help",
                    "Help Centre",
                    HelpCenter(),
                    hasBorder: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector options(
    String iconName,
    String title,
    Widget page, {
    bool hasBorder = true,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(() => page);
      },
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          border: hasBorder
              ? Border(bottom: BorderSide(color: Color(0x80C4C4C4)))
              : null,
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Color(0xff338AF3),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: CustomSvg(
                  asset: "assets/icons/$iconName.svg",
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Spacer(),
            CustomSvg(asset: "assets/icons/arrow_forward.svg"),
          ],
        ),
      ),
    );
  }
}
