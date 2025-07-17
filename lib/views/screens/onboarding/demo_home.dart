import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_modal_sheet.dart';
import 'package:wanderlink/views/base/guide_widget.dart';
import 'package:wanderlink/views/screens/home/home.dart';
import 'package:wanderlink/views/screens/modal_sheets/instructions.dart';

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  List<String> instructions = [
    "Welcome to your home screen. Your world map is already filling out well! But there still is plenty to tick off!",
    "As you travel, you can add more Countries by clicking the plus sign in the top right corner.",
    "You can also put countries on your bucket list and mark them as favourites there!",
    "Anyway,  I’m sure you can find your own way around the app from here. 😉",
  ];
  int index = 0;
  Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          setState(() {
            overlay = Instructions();
          });
        } else {
          setState(() {
            index = index + 1;
          });
        }
      },
      child: CustomModalSheet(
        overlay: overlay,
        showModal: overlay != null,
        onTapOutside: () {
          setState(() {
            overlay = null;
          });
          Get.off(() => Home());
        },
        child: Stack(
          children: [
            Home(demo: true),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withAlpha(80)],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              left: 20,
              right: 20,
              child: Material(
                type: MaterialType.transparency,
                child: GuideWidget(text: instructions[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
