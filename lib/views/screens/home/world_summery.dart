import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/base/world_map.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class WorldSummery extends StatefulWidget {
  const WorldSummery({super.key});

  @override
  State<WorldSummery> createState() => _WorldSummeryState();
}

class _WorldSummeryState extends State<WorldSummery> {
  final controller = WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(body: Center(child: generateImage())),
        CustomScaffold(
          hasNavbar: false,
          isScrollable: false,
          appbarPadding: false,
          sidePadding: 0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 29),
                  Text(
                    "MY WORLD SUMMARY",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Color(0xff0F9BE9),
                    ),
                  ),
                  Text(
                    "the countries I’ve visited",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xb81B1F26),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const SizedBox(width: 6),
                      ProfilePicture(
                        image: "https://thispersondoesnotexist.com",
                        borderWidth: 0,
                        size: 50,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Derek",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "@derektravels",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xb81B1F26),
                            ),
                          ),
                        ],
                      ),

                      Spacer(),
                      CustomSvg(asset: "assets/icons/logo.svg", height: 36),
                      const SizedBox(width: 6),
                    ],
                  ),
                  WorldMap(myCountries: ["ru", "cn", "br"]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      progressCard("Countries", 9, 17),
                      progressCard("Continents", 2, 7),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomSvg(asset: "assets/icons/branding.svg"),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                final file = await controller.capturePng(pixelRatio: 5);

                if (file != null) {
                  final params = SaveFileDialogParams(
                    data: file,
                    fileName: "World Summary.png",
                  );

                  final savedFilePath = await FlutterFileDialog.saveFile(
                    params: params,
                  );

                  if (savedFilePath != null) {
                    Get.snackbar("Completed", "File saved successfully");
                  } else {
                    Get.snackbar("Failed", "Save file unsuccessful");
                  }
                }
              },
              child: CustomSvg(asset: "assets/icons/save.svg"),
            ),
            const SizedBox(height: 10),
            Text(
              "save as image",
              style: TextStyle(fontSize: 13, color: Color(0xb81B1F26)),
            ),
            Spacer(),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }

  Widget generateImage() {
    return WidgetsToImage(
      controller: controller,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: -200,
            right: -250,
            child: Image.asset("assets/images/bg.png", fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 29),
                Text(
                  "MY WORLD SUMMARY",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Color(0xff0F9BE9),
                  ),
                ),
                Text(
                  "the countries I’ve visited",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Color(0xb81B1F26),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const SizedBox(width: 6),
                    ProfilePicture(
                      image: "https://thispersondoesnotexist.com",
                      borderWidth: 0,
                      size: 50,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Derek",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "@derektravels",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xb81B1F26),
                          ),
                        ),
                      ],
                    ),

                    Spacer(),
                    CustomSvg(asset: "assets/icons/logo.svg", height: 36),
                    const SizedBox(width: 6),
                  ],
                ),
                WorldMap(myCountries: ["ru", "cn", "br"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    progressCard("Countries", 9, 17),
                    progressCard("Continents", 2, 7),
                  ],
                ),
                const SizedBox(height: 15),
                CustomSvg(asset: "assets/icons/branding.svg"),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
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
}
