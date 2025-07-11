import 'package:flutter/material.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';

class DesignSystem extends StatefulWidget {
  const DesignSystem({super.key});

  @override
  State<DesignSystem> createState() => _DesignSystemState();
}

class _DesignSystemState extends State<DesignSystem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Design System",
      hasLeading: true,
      hasAppbar: true,
      hasNavbar: true,
      tabIndex: 1,
      isScrollable: false,
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(index.toString());
            },
          ),
        ),
      ],
    );
  }
}
