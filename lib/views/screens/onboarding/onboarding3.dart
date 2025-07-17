import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/screens/onboarding/onboarding4.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  final double swipeThreshold = 0.0;
  double _initialX = 0;

  void onSwipeLeft() {
    Get.to(() => Onboarding4(), transition: Transition.rightToLeft);
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
                  "Discover",
                  style: TextStyle(
                    fontFamily: "Krona One",
                    fontSize: 24,
                    color: Color(0xff020617),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Explore what the world has to offer- search any country for insights and inspiration",
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
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
