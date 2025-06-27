import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_app_bar.dart';
import 'package:wanderlink/views/base/custom_bottom_navbar.dart';

class CustomScaffold extends StatelessWidget {
  final bool hasAppbar;
  final bool hasNavbar;
  final List<Widget> children;
  final String? title;
  final bool hasLeading;
  final Widget? trailing;
  final double sidePadding;
  final int tabIndex;
  final bool isScrollable;
  final bool appbarPadding;
  const CustomScaffold({
    super.key,
    required this.children,
    this.title,
    this.trailing,
    this.hasAppbar = true,
    this.hasNavbar = true,
    this.hasLeading = true,
    this.isScrollable = true,
    this.appbarPadding = true,
    this.sidePadding = 24,
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
          Column(
            children: [
              if (hasAppbar)
                CustomAppBar(
                  title: title,
                  hasLeading: hasLeading,
                  trailing: trailing,
                  bottomPadding: appbarPadding,
                ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: sidePadding),
                child: isScrollable
                    ? SingleChildScrollView(child: Column(children: children))
                    : Column(children: children),
              ),
            ],
          ),
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
