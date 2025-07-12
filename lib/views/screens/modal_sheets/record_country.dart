import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/utils/custom_image_picker.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_networked_image.dart';
import 'package:wanderlink/views/base/simple_switch.dart';
import 'package:wanderlink/views/screens/explore/add_photo.dart';

class RecordCountry extends StatefulWidget {
  const RecordCountry({super.key});

  @override
  State<RecordCountry> createState() => _RecordCountryState();
}

class _RecordCountryState extends State<RecordCountry> {
  bool visited = false;
  bool bucket = false;
  bool fav = false;
  bool lived = false;

  final FocusNode _focusNode = FocusNode();

  List<File?> images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          height: 45,
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
                height: 19,
                width: 32,
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
          padding: const EdgeInsets.only(left: 7, right: 7, top: 2, bottom: 4),
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
                        style: TextStyle(
                          color: Color(0xff273430),
                          fontSize: 10,
                        ),
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
                          focusNode: _focusNode,
                          onTapOutside: (_) {
                            _focusNode.unfocus();
                          },
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
                          style: TextStyle(
                            color: Color(0xff273430),
                            fontSize: 10,
                          ),
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
          height: 45,
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
                height: 19,
                width: 32,
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
          height: 45,
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
                height: 19,
                width: 32,
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
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < images.length; i++)
                InkWell(
                  onTap: () async {
                    File? temp = await customImagePicker(
                      isCircular: false,
                      isSquared: false,
                    );

                    if (temp != null) {
                      setState(() {
                        Get.to(() => AddPhoto(image: temp));
                        images.removeAt(i);
                        images.insert(i, temp);
                      });
                    }
                  },
                  child: CustomNetworkedImage(
                    file: images[i],
                    width: 80,
                    height: 50,
                  ),
                ),
              for (int i = 0; i < 3 - images.length; i++)
                InkWell(
                  onTap: () async {
                    File? temp = await customImagePicker(
                      isCircular: false,
                      isSquared: false,
                    );

                    if (temp != null) {
                      Get.to(() => AddPhoto(image: temp));
                      setState(() {
                        images.add(temp);
                      });
                    }
                  },
                  child: Container(
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x4a3C3C43)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSvg(asset: "assets/icons/camera_outlined.svg"),
                        const SizedBox(height: 8),
                        Text(
                          "Add Photo",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff273430),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        CustomButton(text: "Update"),
      ],
    );
  }
}
