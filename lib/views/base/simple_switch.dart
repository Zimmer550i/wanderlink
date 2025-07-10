import 'package:flutter/material.dart';

class SimpleSwitch extends StatelessWidget {
  final bool value;
  final void Function() onChanged;
  final double width;
  final double height;
  const SimpleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.height = 14,
    this.width = 26,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: value ? Colors.white : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0x8C808080)),
            ),
          ),
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            left: value ? width - height : 4,
            duration: Duration(milliseconds: 100),
            child: Container(
              height: height - 4,
              width: height - 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff101426),
                border: Border.all(color: Color(0x8C808080)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
