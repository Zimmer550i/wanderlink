import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/onboarding/add_countries.dart';

class Onboarding4 extends StatefulWidget {
  const Onboarding4({super.key});

  @override
  State<Onboarding4> createState() => _Onboarding4State();
}

class _Onboarding4State extends State<Onboarding4> {
  final double swipeThreshold = 20.0;
  double _initialX = 0;

  void onSwipeLeft() {
    Get.to(() => AddCountries(), transition: Transition.rightToLeft);
  }

  void onSwipeRight() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _initialX = details.localPosition.dx;
      },
      onPanUpdate: (details) {
        final double deltaX = details.localPosition.dx - _initialX;

        if (deltaX > swipeThreshold) {
          onSwipeRight();
          _initialX = details.localPosition.dx;
        } else if (deltaX < -swipeThreshold) {
          onSwipeLeft();
          _initialX = details.localPosition.dx;
        }
      },
      child: CustomScaffold(
        hasAppbar: false,
        hasNavbar: false,
        isScrollable: false,
        children: [
          MediaQuery.removeViewPadding(
            context: context,
            removeTop: true,
            child: Image.asset(
              "assets/images/onboarding3.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: Column(
              children: [
                Text(
                  "Let’s start by recording the countries you’ve been to!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xff65758C)),
                ),
                const SizedBox(height: 20),
                Text(
                  "Click on the countries to add them to your world map!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xff65758C)),
                ),
              ],
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
