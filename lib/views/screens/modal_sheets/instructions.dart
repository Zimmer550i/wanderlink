import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 63, right: 45, top: 36, bottom: 63),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How We Classify and Count Countries",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Color(0xff0289F2),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            "We use an inclusive list that reflects real-world travel and respects each place's validity and identity. That means we include:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Color(0xff676767),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            "\u2022 195 UN-recognised countries",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Text(
            "\u2022 Observer states and constituent countries (like Scotland or Aruba)",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Text(
            "\u2022 Autonomous regions and overseas territories (like Puerto Rico or Greenland)",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Text(
            "\u2022 Disputed or partially recognised states (like Kosovo or Taiwan)",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            "If a country has its own story, borders, or sense of nationhood - it earns a spot on the list!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Color(0xff676767),
            ),
          ),
        ],
      ),
    );
  }
}
