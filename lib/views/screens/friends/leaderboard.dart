import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/user_profile_locked.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      tabIndex: 2,
      title: "Leaderboard",
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(230),
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  blurRadius: 24,
                  offset: Offset(0, 4),
                  color: Colors.black.withAlpha(59),
                ),
              ],
            ),

            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: tabIndex == 0 ? Color(0xffFC9300) : null,
                      ),

                      child: Center(
                        child: Text(
                          "Global",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: tabIndex == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: tabIndex == 1 ? Color(0xffFC9300) : null,
                      ),

                      child: Center(
                        child: Text(
                          "Friends",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: tabIndex == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(230),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 0),
                  color: Colors.black.withAlpha((15 * 2.55).toInt()),
                ),
              ],
            ),
            child: Column(
              children: [
                for (int i = 0; i < 7; i++)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => UserProfileLocked());
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 56,
                          width: 60,
                          child: Center(
                            child: [0, 1, 2].contains(i)
                                ? Image.asset(
                                    "assets/images/medal${i + 1}.png",
                                    height: 25,
                                  )
                                : Text(
                                    "${i + 1}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xff273430),
                                    ),
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
                        Text(
                          "Name",
                          style: TextStyle(color: Color(0xff273430)),
                        ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
