import 'package:flutter/material.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CountryWidget extends StatelessWidget {
  final String countryCode;
  final bool isSelected;
  final bool isVisited;
  final bool showShadow;
  final void Function()? onClick;
  const CountryWidget({
    super.key,
    required this.countryCode,
    required this.isSelected,
    this.onClick,
    this.isVisited = false,
    this.showShadow = false,
  });

  get countryName => AppConstants.countryNames[countryCode] ?? countryCode;
  get height => 90;
  get width => 90;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isVisited
                  ? Color(0xffD1FEDD)
                  : isSelected
                  ? Color(0xffF5F5F5)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.black.withAlpha((10 * 2.55).toInt()),
                    blurRadius: 4,
                  ),
              ],
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
                      child: CustomSvg(asset: "assets/flags/$countryCode.svg"),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  AppConstants.countryNames[countryCode] ?? countryCode,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff273430),
                    fontSize: 12,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          if (isVisited)
            Positioned(
              top: -4,
              right: -9,
              child: CustomSvg(asset: "assets/icons/tick.svg"),
            ),
        ],
      ),
    );
  }
}
