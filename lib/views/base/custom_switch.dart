import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final void Function() onChange;
  final Color color;
  final bool isOval;
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChange,
    this.color = const Color(0xff5CF198),
    this.isOval = true,
  });

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
              color: value ? color : Color(0xff777777),
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
              width: isOval ? 22 : 18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: isOval
                    ? BorderRadius.horizontal(
                        left: Radius.elliptical(11, 9),
                        right: Radius.elliptical(11, 9),
                      )
                    : BorderRadius.circular(99),
                border: Border.all(
                  width: 2,
                  color: value ? color : Color(0xff777777),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
