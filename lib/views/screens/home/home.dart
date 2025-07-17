import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_modal_sheet.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/world_map.dart';
import 'package:wanderlink/views/screens/explore/explore.dart';
import 'package:wanderlink/views/screens/home/world_summery.dart';
import 'package:wanderlink/views/screens/modal_sheets/country_picker.dart';
import 'package:wanderlink/views/screens/modal_sheets/record_country.dart';

class Home extends StatefulWidget {
  final bool demo;
  const Home({super.key, this.demo = false});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return CustomModalSheet(
      overlay: overlay,
      showModal: overlay != null,
      onTapOutside: () {
        setState(() {
          overlay = null;
        });
      },
      child: CustomScaffold(
        isScrollable: false,
        hasLeading: false,
        hasNavbar: !widget.demo,
        showLogo: true,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => WorldSummery());
          },
          child: CustomSvg(asset: "assets/icons/share.svg"),
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              overlay = RecordACountry(
                onSubmit: (val) {
                  setState(() {
                    overlay = null;
                  });
                },
              );
            });
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(200),
              border: Border.all(color: Colors.white.withAlpha(50)),
              shape: BoxShape.circle,
            ),
            child: Center(child: CustomSvg(asset: AppIcons.addNew)),
          ),
        ),
        sidePadding: 0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: () {
                Get.off(() => Explore(autoFocus: true));
              },
              child: AbsorbPointer(child: CustomSearchBar()),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: progressBar(0.15),
          ),
          Expanded(child: WorldMap(myCountries: ["ru", "cn", "br"])),
          Column(
            children: [
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10,
                  children: [
                    progressCard("Countries", 9, 17),
                    progressCard("Continents", 2, 7),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                controller: ScrollController(
                  initialScrollOffset: MediaQuery.of(context).size.width / 5,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    progressCard("Asia", 1, 30),
                    progressCard("Europe", 18, 55),
                    progressCard("Africa", 5, 40),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          if (widget.demo) const SizedBox(height: 70),
        ],
      ),
    );
  }

  Container progressCard(String title, int value, int total) {
    double progress = (value / total) * 100;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 14,
            color: Colors.black.withAlpha((7 * 2.55).toInt()),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xffFC9300),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  height: 16 / 22,
                  color: Color(0xff273430),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "out of $total",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 16 / 14,
                  color: Color(0xffAEAEAE),
                ),
              ),
            ],
          ),
          const SizedBox(width: 7),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress / 100,
                strokeWidth: 5,
                color: Color(0xffFC9300),
                backgroundColor: Color(0xffd9d9d9),
                strokeCap: StrokeCap.round,
                constraints: BoxConstraints(
                  minHeight: 48,
                  maxHeight: 48,
                  minWidth: 48,
                  maxWidth: 48,
                ),
              ),
              SizedBox(
                height: 38,
                width: 38,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "${progress.toInt()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff273430),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack progressBar(double progress) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 22,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffFFE4D4),
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(99),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                color: Color(0xffFC9300),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
        ),

        Positioned(
          right: 0,
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(child: CustomSvg(asset: AppIcons.earth)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    height: 26,
                    width: 26,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Color(0xffFC9300)),
                    ),
                    child: FittedBox(
                      child: Text(
                        "${(progress * 100).toInt().toString()}%",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w900,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecordACountry extends StatefulWidget {
  final void Function(String) onSubmit;
  const RecordACountry({super.key, required this.onSubmit});

  @override
  State<RecordACountry> createState() => _RecordACountryState();
}

class _RecordACountryState extends State<RecordACountry> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
      child: Column(
        children: [
          Text(
            "RECORD A NEW COUNTRY",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Color(0xff0289F2),
            ),
          ),
          if (selectedCountry == null)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: CountryPicker(
                onSubmit: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              ),
            ),
          if (selectedCountry != null)
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: CountryWidget(
                countryCode: selectedCountry!,
                isSelected: false,
                showShadow: true,
              ),
            ),
          if (selectedCountry != null)
            RecordCountry(
              onSubmit: () {
                widget.onSubmit(selectedCountry!);
              },
            ),
        ],
      ),
    );
  }
}
