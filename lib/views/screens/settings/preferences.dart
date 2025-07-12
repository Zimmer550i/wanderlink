import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_switch.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  List<bool> values = [false, true, true, false];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      title: "Preferences",
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  color: Colors.black.withAlpha((12 * 2.55).toInt()),
                ),
              ],
            ),
            child: Column(
              children: [
                options("Push notifications", values[0], (val) {
                  setState(() {
                    values[0] = val;
                  });
                }),
                options("Email alerts", values[1], (val) {
                  setState(() {
                    values[1] = val;
                  });
                }),
                options("Connect your contacts", values[2], (val) {
                  setState(() {
                    values[2] = val;
                  });
                }),
                options("In-app notifications", values[3], (val) {
                  setState(() {
                    values[3] = val;
                  });
                }, hasBorder: false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container options(
    String title,
    bool value,
    void Function(bool) onChange, {
    bool hasBorder = true,
  }) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: !hasBorder
            ? null
            : Border(bottom: BorderSide(color: Color(0x80C4C4C4))),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "roboto",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999),
            ),
          ),
          Spacer(),
          CustomSwitch(
            value: value,
            onChange: () {
              onChange(!value);
            },
            isOval: false,
          ),
        ],
      ),
    );
  }
}
