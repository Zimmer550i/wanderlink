import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class GuideWidget extends StatelessWidget {
  final String text;
  const GuideWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [Shadow(offset: Offset(0, -4), color: Color(0x2163BE79))],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(top: 14, bottom: 14, left: 12, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 5),
                color: Colors.black.withAlpha((15 * 2.55).toInt()),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Color(0xff65758C)),
          ),
        ),
      ),
    );
  }
}
