import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';

class WorldMap extends StatelessWidget {
  final List<String>? myCountries;
  final List<String>? otherCountries;
  const WorldMap({super.key, this.myCountries, this.otherCountries});

  final Color myColor = const Color(0xffFC9300);
  final Color otherColor = const Color(0xff6DA544);
  final Color commonColor = const Color(0xffFF73C7);

  @override
  Widget build(BuildContext context) {
    Map<String, Color> data = {};

    for (var i in myCountries ?? []) {
      if (otherCountries == null || !otherCountries!.contains(i)) {
        data[i] = myColor;
      } else {
        data[i] = commonColor;
      }
    }

    for (var i in otherCountries ?? []) {
      if (myCountries == null || !myCountries!.contains(i)) {
        data[i] = otherColor;
      }
    }

    return InteractiveViewer(
      maxScale: 4,
      minScale: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: SimpleMap(
          instructions: SMapWorld.instructions,
          defaultColor: Color(0xffA6A6A6),
          countryBorder: CountryBorder(color: Colors.white, width: 0.5),
          colors: data,
        ),
      ),
    );
  }
}
