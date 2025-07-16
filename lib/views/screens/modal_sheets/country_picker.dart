import 'package:flutter/material.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';

class CountryPicker extends StatefulWidget {
  final String? current;
  final void Function(String?)? onSubmit;
  const CountryPicker({super.key, this.current, this.onSubmit});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String? searchText;
  String? current;

  @override
  void initState() {
    super.initState();
    current = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomSearchBar(
            height: 50,
            iconSize: 20,
            onChanged: (p0) {
              setState(() {
                searchText = p0;
              });
            },
          ),
        ),
        const SizedBox(height: 36),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      for (var i in AppConstants.countryNames.keys)
                        if (searchQuery(i))
                          CountryWidget(
                            countryCode: i,
                            isSelected: i == current,
                            onClick: () {
                              setState(() {
                                if (current == i) {
                                  current = null;
                                } else {
                                  current = i;
                                }
                              });
                            },
                          ),
                      const SizedBox(height: 40, width: double.infinity),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 60,
                right: 60,
                bottom: 0,
                child: CustomButton(
                  text: "Select",
                  width: double.infinity,
                  isDisabled: current == null,
                  onTap: () {
                    if (widget.onSubmit != null) {
                      widget.onSubmit!(current);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool searchQuery(String i) => AppConstants.countryNames[i]!
      .toLowerCase()
      .contains(searchText?.toLowerCase() ?? "");
}
