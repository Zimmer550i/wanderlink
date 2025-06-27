import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final void Function() onChange;
  const CustomSwitch({super.key, required this.value, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChange,
      borderRadius: BorderRadius.circular(99),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 11,
            width: 33,
            decoration: BoxDecoration(
              color: value ? Color(0xff5CF198) : Color(0xff777777),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            right: value ? 0 : null,
            left: value ? null : 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 18,
              width: 22,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.elliptical(11, 9),
                  right: Radius.elliptical(11, 9),
                ),
                border: Border.all(
                  width: 2,
                  color: value ? Color(0xff5CF198) : Color(0xff777777),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
