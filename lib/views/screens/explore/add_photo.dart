import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_networked_image.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';

class AddPhoto extends StatelessWidget {
  final File image;
  const AddPhoto({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      appbarPadding: false,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Text(
            "To make this photo even more of a memory, you can add a caption and even a date and/ year",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff65758C),
              height: 26 / 13,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.width,
          ),
          child: CustomNetworkedImage(file: image, radius: 0),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 42),
          child: Container(
            constraints: BoxConstraints(minHeight: 70),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((70 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Add a caption...",
                  hintStyle: TextStyle(fontSize: 10, color: Color(0xb81B1F26)),
                  border: InputBorder.none,
                ),
                maxLines: 3,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 78),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((70 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Month",
                  style: TextStyle(fontSize: 10, color: Color(0x4a3C3C43)),
                ),
                CustomSvg(
                  asset: "assets/icons/arrow_down.svg",
                  color: Color(0xB2AEAEAE),
                ),
                Text(
                  "|",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withAlpha((8 * 2.55).toInt()),
                  ),
                ),
                Text(
                  "Year",
                  style: TextStyle(fontSize: 10, color: Color(0x4a3C3C43)),
                ),
                CustomSvg(
                  asset: "assets/icons/arrow_down.svg",
                  color: Color(0xB2AEAEAE),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Spacer(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: CustomButton(
              text: "Save",
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
      ],
    );
  }
}
