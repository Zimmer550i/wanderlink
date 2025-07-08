import 'dart:ui';

import 'package:flutter/material.dart';
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
  final double sidePadding;
  final int tabIndex;
  final bool isScrollable;
  final bool appbarPadding;
  final bool navbarPadding;
  final bool enableBlur;
  const CustomScaffold({
    super.key,
    required this.children,
    this.title,
    this.trailing,
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          if (enableBlur)
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), child: Container(),),
          if (hasNavbar)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavbar(index: tabIndex),
            ),
        ],
      ),
    );
  }
}
