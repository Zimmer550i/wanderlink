import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/views/base/custom_app_bar.dart';
import 'package:wanderlink/views/base/custom_bottom_navbar.dart';

class CustomScaffold extends StatelessWidget {
  final bool hasAppbar;
  final bool hasNavbar;
  final List<Widget> children;
  final String? title;
  final bool hasLeading;
  final bool showLogo;
  final Widget? trailing;
  final Widget? leading;
  final double sidePadding;
  final int tabIndex;
  final bool isScrollable;
  final bool appbarPadding;
  final bool navbarPadding;
  final bool enableBlur;
  final bool floatingBackButton;
  const CustomScaffold({
    super.key,
    required this.children,
    this.title,
    this.trailing,
    this.leading,
    this.hasAppbar = true,
    this.hasNavbar = true,
    this.enableBlur = false,
    this.showLogo = false,
    this.hasLeading = true,
    this.isScrollable = true,
    this.appbarPadding = true,
    this.navbarPadding = true,
    this.sidePadding = 0,
    this.tabIndex = 0,
    this.floatingBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: isScrollable,
      backgroundColor: Color(0xff0F9BE9),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Positioned.fill(
            child: Column(
              children: [
                if (hasAppbar)
                  CustomAppBar(
                    title: title,
                    showLogo: showLogo,
                    hasLeading: hasLeading,
                    trailing: trailing,
                    leading: leading,
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: sidePadding,
                    ),
                    child: isScrollable
                        ? SingleChildScrollView(
                            child: SafeArea(
                              top: false,
                              child: Column(
                                children: [
                                  if (appbarPadding && hasAppbar)
                                    const SizedBox(height: 30),
                                  ...children,
                                  if (hasNavbar && navbarPadding)
                                    SizedBox(height: 72),
                                ],
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              if (appbarPadding && hasAppbar)
                                const SizedBox(height: 30),
                              ...children,
                              if (hasNavbar && navbarPadding)
                                SafeArea(
                                  top: false,
                                  child: SizedBox(height: 72),
                                ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
          if (floatingBackButton)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: InkWell(
                  onTap: () => hasLeading ? Get.back() : null,
                  borderRadius: BorderRadius.circular(999),
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: hasLeading
                        ? Center(
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withAlpha(204),
                              ),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
          if (enableBlur)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(),
            ),
          if (hasNavbar)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 0 : -100,
              left: 0,
              right: 0,
              child: CustomBottomNavbar(index: tabIndex),
            ),
        ],
      ),
    );
  }
}
