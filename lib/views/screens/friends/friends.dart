import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/friend_request.dart';
import 'package:wanderlink/views/screens/friends/leaderboard.dart';
import 'package:wanderlink/views/screens/friends/messages.dart';
import 'package:wanderlink/views/screens/friends/user_profile.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasLeading: false,
      appbarPadding: false,
      tabIndex: 2,
      children: [
        Row(
          children: [
            const SizedBox(width: 24),
            Expanded(child: card("Messages", Messages(), 5)),
            const SizedBox(width: 24),
            Expanded(child: card("Friend Requests", FriendRequest(), 1)),
            const SizedBox(width: 24),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: CustomSearchBar(hintText: "Search User..."),
        ),
        const SizedBox(height: 30),
        const SizedBox(height: 30),
        leaderboardSection(),
      ],
    );
  }

  Widget card(String name, Widget link, int unreadCount) {
    return GestureDetector(
      onTap: () {
        Get.to(() => link);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((90 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 12),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff273430),
                  ),
                ),
                Spacer(),
                CustomSvg(asset: "assets/icons/arrow_forward.svg"),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Positioned(
            right: -6,
            top: -8,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xffF7002D),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  unreadCount.toString(),
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
              child: GestureDetector(
                onTap: () {
                  Get.to(() => UserProfile());
                },
                behavior: HitTestBehavior.translucent,
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
            ),
            Divider(height: 1, thickness: 1, color: Color(0xffEEEAEE)),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => UserProfile());
                },
                behavior: HitTestBehavior.translucent,
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
            ),
            Divider(height: 1, thickness: 1, color: Color(0xffEEEAEE)),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => UserProfile());
                },
                behavior: HitTestBehavior.translucent,
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
}
