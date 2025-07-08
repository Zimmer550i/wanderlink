import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_switch.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/base/world_map.dart';
import 'package:wanderlink/views/screens/friends/inbox.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int index = 0;
  bool enableBlur = false;
  bool compare = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      enableBlur: enableBlur,
      trailing: Row(
        spacing: 6,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => Inbox());
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomSvg(asset: "assets/icons/message.svg"),
              ),
            ),
          ),
          actionButton(),
        ],
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
        compare
            ? CustomButton(
                text: "Follow",
                width: 230,
                leading: "assets/icons/follow.svg",
              )
            : Container(
                height: 40,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: Color(0xffE3E3E3)),
                ),
                child: Row(
                  spacing: 12,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvg(
                      asset: "assets/icons/follow.svg",
                      color: Colors.black,
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff090909),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(height: 24),
        Container(
          width: 145,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: Colors.black12,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: CustomSvg(
                    asset: "assets/icons/world.svg",
                    size: index == 0 ? 30 : 24,
                    color: index == 0 ? Color(0xff007AFF) : Color(0x4a3C3C43),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: CustomSvg(
                    asset: "assets/icons/camera.svg",
                    size: index == 1 ? 30 : 24,
                    color: index == 1 ? Color(0xff007AFF) : Color(0x4a3C3C43),
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 28),
        index == 1
            ? Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  children: [
                    for (int i = 0; i < 7; i++)
                      Image.network(
                        "https://picsum.photos/1200/1200",
                        width: MediaQuery.of(context).size.width / 3 - 1.5,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              )
            : Column(
                children: [
                  WorldMap(
                    myCountries: compare ? ["ru", "in", "au", "us"] : [],
                    otherCountries: ["cn", "in", "br"],
                  ),
                  if (compare)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Row(
                        children: [
                          const SizedBox(width: 24),
                          Spacer(),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color(0xffFC9300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "My Countries",
                            style: TextStyle(fontFamily: "nunito", fontSize: 8),
                          ),
                          Spacer(),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color(0xff6DA544),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Derek's Countries",
                            style: TextStyle(fontFamily: "nunito", fontSize: 8),
                          ),
                          Spacer(),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Color(0xffFF73C7),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Common Countries",
                            style: TextStyle(fontFamily: "nunito", fontSize: 8),
                          ),
                          Spacer(),
                          const SizedBox(width: 24),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Compare",
                        style: TextStyle(
                          fontFamily: "nunito",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff273430),
                        ),
                      ),
                      const SizedBox(width: 24),
                      CustomSwitch(
                        value: compare,
                        isOval: false,
                        color: Color(0xff007AFF),
                        onChange: () {
                          setState(() {
                            compare = !compare;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      progressCard("Countries", 9, 17),
                      progressCard("Continents", 2, 7),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                        child: Text(
                          "Visited",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff273430),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CountryWidget(countryCode: "us", isSelected: false),
                          CountryWidget(countryCode: "bd", isSelected: false),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                        child: Text(
                          "Bucket List",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff273430),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CountryWidget(countryCode: "gd", isSelected: false),
                          CountryWidget(countryCode: "cn", isSelected: false),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: CustomSvg(asset: "assets/icons/add.svg"),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                        child: Text(
                          "Favourites",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff273430),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CountryWidget(countryCode: "br", isSelected: false),
                          CountryWidget(countryCode: "ar", isSelected: false),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: CustomSvg(asset: "assets/icons/add.svg"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Container progressCard(String title, int value, int total) {
    double progress = (value / total) * 100;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 14,
            color: Colors.black.withAlpha((7 * 2.55).toInt()),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xffFC9300),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  height: 16 / 22,
                  color: Color(0xff273430),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "out of $total",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 16 / 14,
                  color: Color(0xffAEAEAE),
                ),
              ),
            ],
          ),
          const SizedBox(width: 7),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress / 100,
                strokeWidth: 5,
                color: Color(0xffFC9300),
                backgroundColor: Color(0xffd9d9d9),
                strokeCap: StrokeCap.round,
                constraints: BoxConstraints(
                  minHeight: 48,
                  maxHeight: 48,
                  minWidth: 48,
                  maxWidth: 48,
                ),
              ),
              SizedBox(
                height: 38,
                width: 38,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "${progress.toInt()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff273430),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuButton<dynamic> actionButton() {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          enableBlur = false;
        });
        if (value == 0) {
        } else if (value == 1) {
          
        }
      },
      onCanceled: () {
        setState(() {
          enableBlur = false;
        });
      },
      onOpened: () {
        setState(() {
          enableBlur = true;
        });
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem<int>(
          value: 0,
          height: 25,
          child: Container(
            width: double.infinity,
            height: 25,
            padding: EdgeInsets.only(left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xB81B1F26),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          height: 7,
          enabled: false,
          child: Container(
            width: double.infinity,
            height: 1,
            color: Color(0xffc4c4c4),
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          height: 25,
          child: Container(
            width: double.infinity,
            height: 25,
            padding: EdgeInsets.only(left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Block',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xB81B1F26),
                ),
              ),
            ),
          ),
        ),
      ],
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: CustomSvg(asset: "assets/icons/three_dot.svg")),
      ),
    );
  }
}
