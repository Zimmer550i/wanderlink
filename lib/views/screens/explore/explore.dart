import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/screens/explore/country_details.dart';

class Explore extends StatefulWidget {
  final bool autoFocus;
  const Explore({super.key, this.autoFocus = false});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int sort = 2;
  bool blurEnabled = false;
  Map<String, List<CountryWidget>> countries = {};

  @override
  void initState() {
    super.initState();
    getCountries("");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBlur: blurEnabled,
      hasLeading: false,
      sidePadding: 0,
      tabIndex: 1,
      title: "Explore",
      trailing: sortButton(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomSearchBar(
            autoFocus: widget.autoFocus,
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
              Get.to(() => CountryDetails());
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

  PopupMenuButton<dynamic> sortButton() {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          sort = value;
          blurEnabled = false;
        });
      },
      onOpened: () {
        setState(() {
          blurEnabled = true;
        });
      },
      onCanceled: () {
        setState(() {
          blurEnabled = false;
        });
      },
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem<int>(
          value: 1,
          height: 25,
          enabled: false,
          child: Text(
            "Sort",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xB80078BC),
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          height: 25,
          child: Container(
            width: double.infinity,
            height: 25,
            padding: EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              color: sort == 2 ? Color(0xff2F80ED).withAlpha(25) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'A-Z',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xB81B1F26),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          height: 7,
          enabled: false,
          child: Container(
            width: double.infinity,
            height: 1,
            color: Color(0xffc4c4c4),
          ),
        ),
        PopupMenuItem<int>(
          value: 3,
          height: 25,
          child: Container(
            width: double.infinity,
            height: 25,
            padding: EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              color: sort == 3 ? Color(0xff2F80ED).withAlpha(25) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'By Continent',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xB81B1F26),
                ),
              ),
            ),
          ),
        ),
      ],
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: CustomSvg(asset: "assets/icons/filter.svg")),
      ),
    );
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
