import 'package:flutter/material.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  const CustomSearchBar({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(230),
        borderRadius: BorderRadius.circular(99),
        boxShadow: [
          BoxShadow(blurRadius: 24,
            offset: Offset(0, 4),
            color: Colors.black.withAlpha(59)
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Color(0xffACACAC)),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          ),
          CustomSvg(asset: "assets/icons/search.svg", size: 24),
        ],
      ),
    );
  }
}
