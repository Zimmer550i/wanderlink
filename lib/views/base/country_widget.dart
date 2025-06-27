import 'package:flutter/material.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CountryWidget extends StatelessWidget {
  final String countryCode;
  final bool isSelected;
  final void Function()? onClick;
  const CountryWidget({
    super.key,
    required this.countryCode,
    required this.isSelected,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 90,
        width: 90,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffF5F5F5) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4),
              child: SizedBox(
                height: 29,
                width: 45,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CustomSvg(
                    asset: "assets/flags/$countryCode.svg",
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              AppConstants.countryNames[countryCode] ?? countryCode,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff273430), fontSize: 12, height: 1),
            ),
            // Text(
            //    countryCode,
            //   maxLines: 2,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Color(0xff273430), fontSize: 8),
            // ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
