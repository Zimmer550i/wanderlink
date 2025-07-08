import 'package:flutter/material.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final double height;
  final double iconSize;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.height = 46,
    this.iconSize = 19,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(230),
        borderRadius: BorderRadius.circular(99),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            offset: Offset(0, 4),
            color: Colors.black.withAlpha(59),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: hintText ?? "Search Country . . .",
                hintStyle: TextStyle(fontSize: 11, color: Color(0xffACACAC)),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          CustomSvg(
            asset: AppIcons.search,
            size: iconSize,
            color: Color(0xff1C75BC),
          ),
        ],
      ),
    );
  }
}
