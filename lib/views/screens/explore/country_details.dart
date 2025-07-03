import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/base/simple_switch.dart';

class CountryDetails extends StatefulWidget {
  const CountryDetails({super.key});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  int detailsIndex = 1;
  int imageIndex = 0;

  bool visited = false;
  bool bucket = false;
  bool fav = false;
  bool lived = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasAppbar: false,
      hasNavbar: false,
      sidePadding: 0,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://picsum.photos/1200/1200",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 18,
              top: 0,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha((80 * 2.5).toInt()),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff130F26),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 44,
              bottom: 0,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Opacity(
                      opacity: 0.75,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xff130F26),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Opacity(
                      opacity: 0.75,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff130F26),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -40,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF6DC3F2), Color(0xFF0289F2)],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(4),
                        child: CustomSvg(
                          asset: "assets/flags/ad.svg",
                          width: 52,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text("Andorra", style: TextStyle(fontSize: 17)),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        CustomSvg(asset: "assets/icons/location.svg", size: 24),
                        Text(
                          "Europe",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff7A7289),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VISITED BY",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.black.withAlpha((60 * 2.5).toInt()),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ProfilePicture(
                              size: 32,
                              image: "https://thispersondoesnotexist.com",
                              whiteBorder: true,
                              borderWidth: 2,
                            ),
                            Positioned(
                              left: 16,
                              child: ProfilePicture(
                                size: 32,
                                image: "https://thispersondoesnotexist.com",
                                whiteBorder: true,
                                borderWidth: 2,
                              ),
                            ),
                            Positioned(
                              left: 32,
                              child: ProfilePicture(
                                size: 32,
                                image: "https://thispersondoesnotexist.com",
                                whiteBorder: true,
                                borderWidth: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 42),
                        Text(
                          "5",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xB81B1F26),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "friends",
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.1,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(width: double.infinity, height: 1, color: Color(0xffC4C4C4)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    detailsIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  height: 45,
                  decoration: BoxDecoration(
                    color: detailsIndex == 0 ? Color(0xff007AFF) : Colors.white,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child: Text(
                      "Record",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: detailsIndex == 0
                            ? Color(0xffFAF2F2)
                            : Color(0xff313033),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    detailsIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  height: 45,
                  decoration: BoxDecoration(
                    color: detailsIndex == 1 ? Color(0xff007AFF) : Colors.white,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child: Text(
                      "Country Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: detailsIndex == 1
                            ? Color(0xffFAF2F2)
                            : Color(0xff313033),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    detailsIndex = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  height: 45,
                  decoration: BoxDecoration(
                    color: detailsIndex == 2 ? Color(0xff007AFF) : Colors.white,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child: Text(
                      "Friends",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: detailsIndex == 2
                            ? Color(0xffFAF2F2)
                            : Color(0xff313033),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        if (detailsIndex == 0) record(),
        if (detailsIndex == 1) profile(),
        if (detailsIndex == 2) friends(),
      ],
    );
  }

  Widget record() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff007AFF).withAlpha((60 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              children: [
                const SizedBox(width: 36),
                Text(
                  "Visited",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Spacer(),
                SimpleSwitch(
                  value: visited,
                  onChanged: () {
                    setState(() {
                      visited = !visited;
                    });
                  },
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
              right: 7,
              top: 2,
              bottom: 4,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha((90 * 2.55).toInt()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          "Times Visited",
                          style: TextStyle(color: Color(0xff273430)),
                        ),
                        Spacer(),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Color(0x4a3C3C43)),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              isCollapsed: true,
                              border: InputBorder.none,
                            ),
                            cursorColor: Color(0xff007AFF),
                            cursorHeight: 16,
                          ),
                        ),
                        const SizedBox(width: 17),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        lived = !lived;
                      });
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha((90 * 2.55).toInt()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Text(
                            "Lived here",
                            style: TextStyle(color: Color(0xff273430)),
                          ),
                          Spacer(),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                color: lived
                                    ? Color(0xff007AFF)
                                    : Color(0x4a3C3C43),
                              ),
                            ),
                            child: Center(
                              child: lived
                                  ? Icon(
                                      Icons.check_rounded,
                                      size: 16,
                                      color: Color(0xff007AFF),
                                    )
                                  : Container(),
                            ),
                          ),
                          const SizedBox(width: 17),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              children: [
                const SizedBox(width: 36),
                Text(
                  "Bucket List",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(),
                SimpleSwitch(
                  value: bucket,
                  onChanged: () {
                    setState(() {
                      bucket = !bucket;
                    });
                  },
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
          Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Row(
              children: [
                const SizedBox(width: 36),
                Text(
                  "Favourite",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(),
                SimpleSwitch(
                  value: fav,
                  onChanged: () {
                    setState(() {
                      fav = !fav;
                    });
                  },
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "Save",
            trailing: AppIcons.arrowRight,
            width: null,
          ),
        ],
      ),
    );
  }

  Widget profile() {
    Map<String, String> data = {
      "Constituent Of": "------",
      "Region / Territory Of": "------",
      "Capital City": "Andorra la Vella",
      "Continent": "Europe",
      "Neighbouring Countries": "France, Spain",
      "Official Language": "Catalan",
      "Population": "80,856",
      "Status": "UN recognised country",
    };
    return Column(
      children: [
        for (var i in data.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                const SizedBox(width: 38),
                Text(
                  i.key,
                  style: TextStyle(
                    color: Color(0xff0078BC),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  i.value,
                  style: TextStyle(color: Color(0xff273430), fontSize: 12),
                ),
                const SizedBox(width: 38),
              ],
            ),
          ),

        const SizedBox(height: 10),
        Container(width: double.infinity, height: 1, color: Color(0xffC4C4C4)),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Text(
            "Nestled in the Pyrenees between France and Spain, Andorra is one of Europe's smallest countries. Known for its ski resorts, tax-free shopping, and Romanesque churches, it’s a blend of Catalan culture and mountain charm. The official language is Catalan. Despite its size, Andorra maintains a high quality of life and robust tourism.",
            style: TextStyle(),
          ),
        ),
      ],
    );
  }

  Widget friends() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          friendSection("Visited", 9),
          const SizedBox(height: 22),

          friendSection("Lived in", 2),
          const SizedBox(height: 22),

          friendSection("Bucket Listed", 1),
          const SizedBox(height: 22),

          friendSection("Favourited", 2),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Column friendSection(String title, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7, bottom: 10),
          child: Text(
            "$title:",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: [
              for (int i = 0; i < count; i++)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 65,
                      child: Column(
                        children: [
                          ProfilePicture(
                            borderWidth: 0,
                            image: "https://thispersondoesnotexist.com",
                            size: 52,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withAlpha(
                                (65 * 2.55).toInt(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (i == 0)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          width: 24,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: Colors.black.withAlpha(
                                (40 * 2.55).toInt(),
                              ),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Center(
                            child: Text(
                              "x5",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 9,
                                color: Colors.black.withAlpha(
                                  (65 * 2.55).toInt(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
