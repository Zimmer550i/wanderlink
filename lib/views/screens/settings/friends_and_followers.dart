import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';

class FriendsAndFollowers extends StatefulWidget {
  const FriendsAndFollowers({super.key});

  @override
  State<FriendsAndFollowers> createState() => _FriendsAndFollowersState();
}

class _FriendsAndFollowersState extends State<FriendsAndFollowers> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "My Countries",
      isScrollable: false,
      hasNavbar: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((90 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 24,
                  color: Colors.black.withAlpha((23 * 2.55).toInt()),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 0
                        ? CustomButton(
                            text: "Friends",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Friends",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 1
                        ? CustomButton(
                            text: "Followers",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Followers",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 2
                        ? CustomButton(
                            text: "Blocked",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Blocked",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        for (int i = 0; i < index + 4; i++)
          Container(
            height: 64,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((80 * 2.55).toInt()),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                ProfilePicture(
                  size: 48,
                  borderWidth: 0,
                  image: "https://thispersondoesnotexist.com",
                ),
                const SizedBox(width: 16),
                Text(
                  "Lee Williamson",
                  style: TextStyle(
                    color: Color(0xff1B1A57),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Spacer(),

                Container(
                  height: 25,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: Color(0xff090909)),
                  ),
                  child: Center(
                    child: Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 10,
                        fontFamily: "nunito",
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
              ],
            ),
          ),
      ],
    );
  }
}
