import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_loading.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/guide_widget.dart';
import 'package:wanderlink/views/screens/onboarding/friend_suggestions.dart';

class AddCountries extends StatefulWidget {
  const AddCountries({super.key});

  @override
  State<AddCountries> createState() => _AddCountriesState();
}

class _AddCountriesState extends State<AddCountries> {
  Map<String, List<CountryWidget>> countries = {};
  List<String> selected = [];
  bool isLoading = false;
  final double swipeThreshold = 20.0;
  double _initialX = 0;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void onSwipeLeft() {
    Get.to(() => FriendSuggestions(), transition: Transition.rightToLeft);
  }

  void onSwipeRight() {
    Get.back();
  }

  void loadCountries() async {
    setState(() {
      isLoading = true;
    });

    getCountries("");

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _initialX = details.localPosition.dx;
      },
      onPanUpdate: (details) {
        final double deltaX = details.localPosition.dx - _initialX;

        if (deltaX > swipeThreshold) {
          onSwipeRight();
          _initialX = details.localPosition.dx;
        } else if (deltaX < -swipeThreshold) {
          onSwipeLeft();
          _initialX = details.localPosition.dx;
        }
      },
      child: CustomScaffold(
        hasAppbar: false,
        hasNavbar: false,
        children: [
          SafeArea(
            child: GuideWidget(text: "Click on the Countries to\nadd them!"),
          ),
          const SizedBox(height: 20),
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
          isLoading ? CustomLoading() : showCountries(),
        ],
      ),
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
            isVisited: selected.contains(i),
            onClick: () {
              if (selected.contains(i)) {
                selected.remove(i);
                setState(() {
                  getCountries(searchText);
                });
              } else {
                selected.add(i);
                setState(() {
                  getCountries(searchText);
                });
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
