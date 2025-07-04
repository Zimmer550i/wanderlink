import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';

class FriendRequest extends StatelessWidget {
  const FriendRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      tabIndex: 2,
      title: "Friend Requests",
      children: [
        for (int i = 0; i < 4; i++)
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

                if ([0, 3, 2].contains(i))
                  Row(
                    spacing: 3,
                    children: [
                      Container(
                        height: 22,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xbf007AFF),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0x8c808080),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Center(
                          child: Text(
                            "Reject",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if ([1].contains(i))
                  Row(
                    spacing: 3,
                    children: [
                      Container(
                        height: 22,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: Color(0xffd0d0d0)),
                        ),
                        child: Center(
                          child: Text(
                            "Accept",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Color(0xff434343),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xbf007AFF),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Follow Back",
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

                const SizedBox(width: 20),
              ],
            ),
          ),
      ],
    );
  }
}
