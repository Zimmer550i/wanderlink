import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/onboarding/onboarding3.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final double swipeThreshold = 20.0;
  double _initialX = 0;

  void onSwipeLeft() {
    Get.to(() => Onboarding3(), transition: Transition.rightToLeft);
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
              "assets/images/onboarding2.png",
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
                  "Connect",
                  style: TextStyle(
                    fontFamily: "Krona One",
                    fontSize: 24,
                    color: Color(0xff020617),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Connect with friends and compare how your journeys around the world stack up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xff65758C)),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffADADAD),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFF5678),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffADADAD),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
