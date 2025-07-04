import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/inbox.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      tabIndex: 2,
      title: "Messages",
      children: [
        for (int i = 0; i < 8; i++)
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((80 * 2.55).toInt()),
            ),
            child: message(
              unreadCount: i == 2 ? 5 : 0,
              isPhoto: i == 3 ? true : false,
              sent: i == 4 || i == 1,
            ),
          ),
      ],
    );
  }

  Widget message({
    int unreadCount = 0,
    bool sent = false,
    bool isPhoto = false,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Inbox());
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: unreadCount == 0
              ? null
              : Color(0xff2F80ED).withAlpha((10 * 2.55).toInt()),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              size: 48,
              borderWidth: 0,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lee Williamson",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff1B1A57),
                  ),
                ),
                Spacer(),
                Row(
                  spacing: 4,
                  children: [
                    if (sent) CustomSvg(asset: "assets/icons/sent.svg"),
                    if (isPhoto)
                      CustomSvg(asset: "assets/icons/camera_small.svg"),
                    Text(
                      isPhoto ? "Photo" : "Yes, that’s gonna work, hopefully. ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                        color: Color(0xff4F5E7B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "10:29",
                  style: TextStyle(fontSize: 12, color: Color(0xff333333)),
                ),
                Spacer(),
                if (unreadCount != 0)
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: Color(0xff0F9BE9),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        unreadCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 16,
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomSvg(asset: "assets/icons/arrow_forward.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
