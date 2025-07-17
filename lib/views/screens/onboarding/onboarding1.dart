import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/onboarding/onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final double swipeThreshold = 20.0;
  double _initialX = 0;

  void onSwipeLeft() {
    Get.to(() => Onboarding2(), transition: Transition.rightToLeft);
  }

  void onSwipeRight() {}

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
              "assets/images/onboarding1.png",
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
                  "Record",
                  style: TextStyle(
                    fontFamily: "Krona One",
                    fontSize: 24,
                    color: Color(0xff020617),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Consider this app your personal travel journal. Keep track of everywhere you’ve been",
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
