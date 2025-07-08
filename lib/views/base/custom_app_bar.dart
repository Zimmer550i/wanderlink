import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasLeading;
  final Widget? trailing;
  final bool bottomPadding;
  final bool showLogo;
  const CustomAppBar({
    super.key,
    this.title,
    this.hasLeading = true,
    this.bottomPadding = false,
    this.showLogo = false,
    this.trailing,
  });

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ? 30.0 : 0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(width: 24),
            InkWell(
              onTap: () => hasLeading ? Get.back() : null,
              borderRadius: BorderRadius.circular(999),
              child: SizedBox(
                height: 48,
                width: 48,
                child: hasLeading
                    ? Center(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withAlpha(204),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xff1C73A3),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Spacer(),
            showLogo
                ? CustomSvg(asset: AppIcons.logo, height: 37)
                : Text(
                    title ?? "",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
            Spacer(),
            trailing ?? SizedBox(
              height: 48,
              width: 48,
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
