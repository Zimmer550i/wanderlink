import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';

class AddCountries extends StatefulWidget {
  const AddCountries({super.key});

  @override
  State<AddCountries> createState() => _AddCountriesState();
}

class _AddCountriesState extends State<AddCountries> {
  Map<String, List<CountryWidget>> countries = {};
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    getCountries("");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasAppbar: false,
      hasNavbar: false,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InnerShadow(
              shadows: [
                Shadow(offset: Offset(0, -4), color: Color(0x2163BE79)),
              ],
              child: Container(
                padding: EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                  left: 12,
                  right: 20,
                ),
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
                  "Click on the Countries to\nadd them!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Color(0xff65758C)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomSearchBar(
            height: 60,
            iconSize: 24,
            onChanged: (val) => setState(() {
              getCountries(val);
            }),
          ),
        ),
        showCountries(),
      ],
    );
  }

  void getCountries(String? searchText) {
    List<CountryWidget> temp = [];
    temp.clear();
    temp.addAll([
      for (var i in AppConstants.countryNames.keys)
        if (AppConstants.countryNames[i]!.toLowerCase().contains(
          searchText?.toLowerCase() ?? "",
        ))
          CountryWidget(
            countryCode: i,
            isSelected: false,
            onClick: () {
              if (selected.contains(i)) {
                selected.remove(i);
              } else {
                selected.add(i);
              }
            },
          ),
    ]);
    temp.sort((a, b) {
      String first = a.countryName.toLowerCase();
      String second = b.countryName.toLowerCase();

      return first.compareTo(second);
    });

    String? start;
    countries.clear();
    for (int i = 0; i < temp.length; i++) {
      if (temp[i].countryName[0].toLowerCase() != start) {
        start = temp[i].countryName[0].toLowerCase();
        countries[start!] = [temp[i]];
      } else {
        countries[start!]!.add(temp[i]);
      }
    }
  }

  Widget showCountries() {
    return Column(
      children: [
        for (String start in countries.keys)
          Column(
            children: [
              if (countries[start]!.isNotEmpty)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      "#${start.toUpperCase()}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xff1C75BC),
                      ),
                    ),
                  ),
                ),
              for (int i = 0; i < (countries[start]!.length / 3).ceil(); i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 24),
                      countries[start]![(i * 3) + 0],
                      Spacer(),
                      if (countries[start]!.length > (i * 3) + 1)
                        countries[start]![(i * 3) + 1]
                      else
                        SizedBox(width: 90),
                      Spacer(),
                      if (countries[start]!.length > (i * 3) + 2)
                        countries[start]![(i * 3) + 2]
                      else
                        SizedBox(width: 90),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
