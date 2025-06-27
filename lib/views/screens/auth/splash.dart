import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/screens/auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final duration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: duration);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
        if (_animation.isCompleted) {
          Get.to(() => Login(), transition: Transition.fadeIn);
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg2.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              Spacer(flex: 2),
              Hero(
                tag: "logo",
                child: CustomSvg(asset: "assets/icons/logo.svg"),
              ),
              Spacer(flex: 3),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: LinearProgressIndicator(
                      value: _animation.value,
                      color: Color(0xffFC9300),
                      backgroundColor: Color(
                        0xffFC9300,
                      ).withAlpha((17 * 2.55).toInt()),
                      borderRadius: BorderRadius.circular(99),
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
