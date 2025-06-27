import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';
import 'package:wanderlink/views/screens/auth/login.dart';
import 'package:wanderlink/views/screens/auth/otp_verification.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final conPassCtrl = TextEditingController();

  void onClick() async {
    Get.to(() => OtpVerification(isResettingPass: false));
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
              SafeArea(child: Container()),
              Spacer(),
              Hero(
                tag: "logo",
                child: CustomSvg(asset: "assets/icons/logo.svg"),
              ),
              Spacer(flex: 3),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((70 * 2.55).toInt()),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 36),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Glad to have you join us!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Color(0xff0F9BE9),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      "Let‘s get started",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    const SizedBox(height: 56),
                    CustomTextField(
                      leading: "assets/icons/email.svg",
                      hintText: "Email...",
                      controller: emailCtrl,
                      darkerShadow: false,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      leading: "assets/icons/password.svg",
                      hintText: "Password...",
                      controller: passCtrl,
                      isPassword: true,
                      darkerShadow: false,
                    ),
                    const SizedBox(height: 18),
                    CustomTextField(
                      leading: "assets/icons/password.svg",
                      hintText: "Retype Password . . .",
                      controller: passCtrl,
                      isPassword: true,
                      darkerShadow: false,
                    ),
                    const SizedBox(height: 69),
                    CustomButton(
                      text: "Continue",
                      trailing: "assets/icons/arrow_right.svg",
                      onTap: onClick,
                    ),
                    const SizedBox(height: 56),
                    SafeArea(
                      top: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have An Account?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff20222C),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => Login());
                            },
                            child: Text(
                              " Sign In ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFC5C00),
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
          ),
        ],
      ),
    );
  }
}
