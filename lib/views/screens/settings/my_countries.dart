import 'package:flutter/material.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';

class MyCountries extends StatefulWidget {
  const MyCountries({super.key});

  @override
  State<MyCountries> createState() => _MyCountriesState();
}

class _MyCountriesState extends State<MyCountries> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "My Countries",
      isScrollable: false,
      hasNavbar: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((90 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 24,
                  color: Colors.black.withAlpha((23 * 2.55).toInt()),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 0
                        ? CustomButton(
                            text: "Visited",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Visited",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 1
                        ? CustomButton(
                            text: "Bucket List",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Bucket List",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: index == 2
                        ? CustomButton(
                            text: "Favourites",
                            fontSize: 15,
                            height: 36,
                            padding: 0,
                          )
                        : Text(
                            "Favourites",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "nunito",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: SingleChildScrollView(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  for (
                    int i = 0;
                    i < (AppConstants.countryNames.keys.length / 3).ceil();
                    i++
                  )
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 24),
                          CountryWidget(
                            countryCode: AppConstants.countryNames.keys.elementAt(
                              (i * 3) + 0,
                            ),
                            isSelected: false,
                          ),
                          Spacer(),
                          if (AppConstants.countryNames.keys.length > (i * 3) + 1)
                            CountryWidget(
                              countryCode: AppConstants.countryNames.keys
                                  .elementAt((i * 3) + 1),
                              isSelected: false,
                            )
                          else
                            SizedBox(width: 90),
                          Spacer(),
                          if (AppConstants.countryNames.keys.length > (i * 3) + 2)
                            CountryWidget(
                              countryCode: AppConstants.countryNames.keys
                                  .elementAt((i * 3) + 2),
                              isSelected: false,
                            )
                          else
                            SizedBox(width: 90),
                          const SizedBox(width: 24),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
