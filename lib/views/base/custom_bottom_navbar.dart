import 'package:flutter/material.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CustomBottomNavbar extends StatefulWidget {
  final int index;
  final Function(int) onClick;
  const CustomBottomNavbar({
    super.key,
    required this.index,
    required this.onClick,
  });

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  List<String> assets = ["world", "explore", "social", "profile"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: item(0)),
            Expanded(child: item(1)),
            Expanded(child: item(2)),
            Expanded(child: item(3)),
          ],
        ),
      ),
    );
  }

  Widget item(int pos) {
    bool isSelected = pos == widget.index;
    return GestureDetector(
      onTap: () {
        widget.onClick(pos);
      },
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomSvg(
                asset:
                    "assets/icons/${assets[pos]}${isSelected ? "_selected" : ""}.svg",
              ),
            ),
          ),
          SizedBox(
            height: 24,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: isSelected
                  ? CustomSvg(asset: "assets/icons/indicator.svg")
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
