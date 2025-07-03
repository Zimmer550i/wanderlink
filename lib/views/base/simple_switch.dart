import 'package:flutter/material.dart';

class SimpleSwitch extends StatelessWidget {
  final bool value;
  final void Function() onChanged;
  const SimpleSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Stack(
        children: [
          Container(
            height: 25,
            width: 43,
            decoration: BoxDecoration(
              color: value
                  ? Colors.white
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0x8C808080)),
            ),
          ),
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            left: value ? 43-16-4 : 4,
            duration: Duration(milliseconds: 100),
            child: Container(
              height: 16,
              width: 16,
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
