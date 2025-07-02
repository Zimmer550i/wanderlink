import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_text_field.dart';
import 'package:wanderlink/views/screens/auth/forgot_password.dart';
import 'package:wanderlink/views/screens/auth/register.dart';
import 'package:wanderlink/views/screens/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void onClick() async {
    Get.to(() => Home());
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
                    Text(
                      "WELCOME!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Color(0xff0F9BE9),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    const SizedBox(height: 38),
                    CustomTextField(
                      leading: "assets/icons/email.svg",
                      hintText: "Email...",
                      controller: emailCtrl,
                      darkerShadow: false,
                    ),
                    const SizedBox(height: 21),
                    CustomTextField(
                      leading: "assets/icons/password.svg",
                      hintText: "Password...",
                      controller: passCtrl,
                      isPassword: true,
                      darkerShadow: false,
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xff0F9BE9)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 43),
                    CustomButton(
                      text: "Login",
                      trailing: "assets/icons/arrow_right.svg",
                      onTap: onClick,
                    ),
                    const SizedBox(height: 20),

                    Row(
                      spacing: 12,
                      children: [
                        Expanded(child: Divider()),
                        Text(
                          "or continue with",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff20222C),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomSvg(
                              asset: "assets/icons/facebook.svg",
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomSvg(asset: "assets/icons/google.svg"),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomSvg(asset: "assets/icons/apple.svg"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    SafeArea(
                      top: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have An Account?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff20222C),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => Register());
                            },
                            child: Text(
                              " Register Now ",
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
