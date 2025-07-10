import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/user_profile.dart';

class UserProfileLocked extends StatelessWidget {
  const UserProfileLocked({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      trailing: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: CustomSvg(asset: "assets/icons/three_dot.svg")),
      ),
      children: [
        Row(
          children: [
            const SizedBox(width: 24),
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              size: 68.5,
              borderWidth: 3.25,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Derek",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "@derektravels",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xB81B1F26),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Followers",
                  style: TextStyle(
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: Color(0xff1C73A3),
                  ),
                ),
                Text(
                  "236",
                  style: TextStyle(
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff273430),
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Following",
                  style: TextStyle(
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: Color(0xff1C73A3),
                  ),
                ),
                Text(
                  "15",
                  style: TextStyle(
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff273430),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 38,
              width: 145,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(4),
                    child: CustomSvg(
                      asset: "assets/flags/us.svg",
                      height: 21,
                      width: 31,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            fontFamily: "nunito",
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Color(0xff0289F2),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "United States",
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xff273430),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 38,
              width: 145,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(4),
                    child: CustomSvg(
                      asset: "assets/flags/us.svg",
                      height: 21,
                      width: 31,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lives In",
                          style: TextStyle(
                            fontFamily: "nunito",
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Color(0xff0289F2),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "United States",
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              color: Color(0xff273430),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        CustomButton(
          text: "Follow",
          width: MediaQuery.of(context).size.width / 1.63,
          leading: "assets/icons/follow.svg",
        ),

        const SizedBox(height: 40),
        InkWell(
          onTap: () {
            Get.off(() => UserProfile());
          },
          child: CustomSvg(asset: "assets/icons/lock.svg"),
        ),
        const SizedBox(height: 12),
        Text(
          "Account is private",
          style: TextStyle(
            fontFamily: "nunito",
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xff273430),
          ),
        ),
      ],
    );
  }
}
