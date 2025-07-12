import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_modal_sheet.dart';
import 'package:wanderlink/views/base/custom_networked_image.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/base/simple_switch.dart';
import 'package:wanderlink/views/screens/explore/post_details.dart';
import 'package:wanderlink/views/screens/modal_sheets/record_country.dart';

class CountryDetails extends StatefulWidget {
  const CountryDetails({super.key});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  int buttonsIndex = 1;
  int imageIndex = 0;
  int postsIndex = 0;
  Widget? overlay;

  List<String> buttons = ["Record", "Country Profile", "Friends", "Posts"];

  bool visited = false;
  bool bucket = false;
  bool fav = false;
  bool lived = false;

  @override
  Widget build(BuildContext context) {
    return CustomModalSheet(
      overlay: overlay,
      showModal: overlay != null,
      onTapOutside: () {
        setState(() {
          overlay = null;
        });
      },
      child: CustomScaffold(
        hasAppbar: false,
        sidePadding: 0,
        floatingBackButton: true,
        tabIndex: 1,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://picsum.photos/seed/country$imageIndex/400/400",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff007AFF),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).viewPadding.top + 44,
                bottom: 0,
                left: 26,
                right: 26,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          imageIndex -= 1;
                        });
                      },
                      child: Opacity(
                        opacity: 0.50,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0xff130F26),
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          imageIndex += 1;
                        });
                      },
                      child: Opacity(
                        opacity: 0.50,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xff130F26),
                              size: 16,
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
                          CustomSvg(
                            asset: "assets/icons/location.svg",
                            size: 24,
                          ),
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
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withAlpha(225),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < buttons.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          buttonsIndex = i;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.5),
                        height: 34,
                        decoration: BoxDecoration(
                          color: buttonsIndex == i
                              ? Color(0xff007AFF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Center(
                          child: Text(
                            buttons[i],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: buttonsIndex == i
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (buttonsIndex == 0) record(),
          if (buttonsIndex == 1) profile(),
          if (buttonsIndex == 2) friends(),
          if (buttonsIndex == 3) posts(),
        ],
      ),
    );
  }

  Widget record() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 18,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                overlay = Padding(
                  padding: const EdgeInsets.only(top: 33, left: 40, right: 40),
                  child: RecordCountry(),
                );
              });
            },
            child: Container(
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  CustomSvg(asset: "assets/icons/edit_blue.svg"),
                  Text(
                    "Edit",
                    style: TextStyle(color: Color(0xb81B1F26), fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            child: Column(
              spacing: 10,
              children: [
                Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff34C759).withAlpha((45 * 2.55).toInt()),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 28),
                      Text(
                        "Visited",
                        style: TextStyle(color: Colors.black, fontSize: 13),
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
                      const SizedBox(width: 24),
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha((90 * 2.55).toInt()),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              Text(
                                "Times Visited",
                                style: TextStyle(
                                  color: Color(0xff273430),
                                  fontSize: 10,
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 16,
                                width: 16,
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
                      const SizedBox(width: 14),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              lived = !lived;
                            });
                          },
                          child: Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(
                                (90 * 2.55).toInt(),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                Text(
                                  "Lived here",
                                  style: TextStyle(
                                    color: Color(0xff273430),
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 16,
                                  width: 16,
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
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x1f767680),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 28),
                      Text(
                        "Bucket List",
                        style: TextStyle(color: Colors.black, fontSize: 13),
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
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x1f767680),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 28),
                      Text(
                        "Favourite",
                        style: TextStyle(color: Colors.black, fontSize: 13),
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomNetworkedImage(
                        randomSeed: "country1",
                        height: 50,
                        width: 80,
                      ),
                      CustomNetworkedImage(
                        randomSeed: "country2",
                        height: 50,
                        width: 80,
                      ),
                      CustomNetworkedImage(
                        randomSeed: "country3",
                        height: 50,
                        width: 80,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
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
        Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(125),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 25),
              for (int i = 0; i < count; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfilePicture(
                            borderWidth: 0,
                            image: "https://thispersondoesnotexist.com",
                            size: 50,
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black.withAlpha(
                                (65 * 2.55).toInt(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (i == 0)
                        Positioned(
                          right: -4,
                          top: 0,
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
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget posts() {
    return Column(
      children: [
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
                      postsIndex = 0;
                    });
                  },
                  child: CustomSvg(
                    asset: "assets/icons/social.svg",
                    size: postsIndex == 0 ? 30 : 24,
                    color: postsIndex == 0
                        ? Color(0xff007AFF)
                        : Color(0x4a3C3C43),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      postsIndex = 1;
                    });
                  },
                  child: CustomSvg(
                    asset: "assets/icons/world.svg",
                    size: postsIndex == 1 ? 30 : 24,
                    color: postsIndex == 1
                        ? Color(0xff007AFF)
                        : Color(0x4a3C3C43),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 12),
          child: Text(
            postsIndex == 0 ? "friends feed" : "global feed",
            style: TextStyle(fontSize: 11, color: Color(0xb81B1F26)),
          ),
        ),
        Wrap(
          spacing: 2,
          runSpacing: 2,
          children: [
            for (int i = 0; i < 70; i++)
              GestureDetector(
                onTap: () {
                  Get.to(() => PostDetails(url: "countryPosts$postsIndex$i"));
                },
                child: CustomNetworkedImage(
                  randomSeed: "countryPosts$postsIndex$i",
                  radius: 0,
                  height: MediaQuery.of(context).size.width / 3 - 1.5,
                  width: MediaQuery.of(context).size.width / 3 - 1.5,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
