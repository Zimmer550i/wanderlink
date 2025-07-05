import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/friend_request.dart';
import 'package:wanderlink/views/screens/friends/leaderboard.dart';
import 'package:wanderlink/views/screens/friends/messages.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasLeading: false,
      appbarPadding: false,
      tabIndex: 2,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => FriendRequest());
              },
              child: friendRequestSection(),
            ),
            Positioned(
              right: 16,
              top: -10,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Color(0xffF7002D),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: CustomSearchBar(hintText: "Search User..."),
        ),
        const SizedBox(height: 30),
        Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => Messages());
              },
              child: messageSection(),
            ),
            Positioned(
              right: 18,
              top: -12,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Color(0xffF7002D),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        leaderboardSection(),
      ],
    );
  }

  Padding friendRequestSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha((90 * 2.55).toInt()),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 12),
              Text(
                "Friend Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff273430),
                ),
              ),
              const SizedBox(width: 27),
              CustomSvg(asset: "assets/icons/arrow_forward.svg"),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  Padding leaderboardSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.to(() => Leaderboard());
              },
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Color(0xffE9F5FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: CustomSvg(asset: "assets/icons/leaderboard.svg"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Leaderboard",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xff273430),
                    ),
                  ),
                  Spacer(),
                  CustomSvg(asset: "assets/icons/arrow_right_colored.svg"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: CustomSvg(asset: "assets/icons/seperated.svg"),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 56,
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/medal1.png",
                        height: 25,
                      ),
                    ),
                  ),
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 40,
                    borderWidth: 2.5,
                    whiteBorder: true,
                  ),
                  const SizedBox(width: 12),
                  Text("Name", style: TextStyle(color: Color(0xff273430))),
                  Spacer(),
                  Text(
                    "130/195",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withAlpha((50 * 2.55).toInt()),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        "65%",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff6DA544),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 56,
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/medal2.png",
                        height: 25,
                      ),
                    ),
                  ),
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 40,
                    borderWidth: 2.5,
                    whiteBorder: true,
                  ),
                  const SizedBox(width: 12),
                  Text("Name", style: TextStyle(color: Color(0xff273430))),
                  Spacer(),
                  Text(
                    "130/195",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withAlpha((50 * 2.55).toInt()),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        "65%",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff6DA544),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 56,
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/images/medal3.png",
                        height: 25,
                      ),
                    ),
                  ),
                  ProfilePicture(
                    image: "https://thispersondoesnotexist.com",
                    size: 40,
                    borderWidth: 2.5,
                    whiteBorder: true,
                  ),
                  const SizedBox(width: 12),
                  Text("Name", style: TextStyle(color: Color(0xff273430))),
                  Spacer(),
                  Text(
                    "130/195",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withAlpha((50 * 2.55).toInt()),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        "65%",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff6DA544),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: CustomSvg(asset: "assets/icons/friends_more.svg"),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Padding messageSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: Color(0xffE9F5FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CustomSvg(asset: "assets/icons/message.svg"),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Messages",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff273430),
              ),
            ),
            Spacer(),
            CustomSvg(asset: "assets/icons/arrow_right_colored.svg"),
          ],
        ),
      ),
    );
  }
}
