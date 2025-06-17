import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final bool bottomPadding;
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasLeading = true,
    this.bottomPadding = true,
  });

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ? 30.0 : 0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(width: 24),
            InkWell(
              onTap: () => hasLeading ? Get.back() : null,
              borderRadius: BorderRadius.circular(8),
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
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            Spacer(),
            const SizedBox(width: 48),
            const SizedBox(width: 24),
          ],
        ),
        // bottom: PreferredSize(preferredSize: Size(0, 30), child: Container()),
      ),
    );
  }
}
