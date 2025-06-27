import 'dart:io';
import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/app_constants.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/utils/formatter.dart';
import 'package:wanderlink/views/base/country_widget.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/custom_search_bar.dart';
import 'package:wanderlink/views/base/custom_switch.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  File? _image;
  bool publicProfile = false;
  bool connectContacts = false;
  String? countryFrom;
  String? livesIn;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasNavbar: false,
      title: "Create your profile",
      children: [
        Row(
          children: [
            const SizedBox(width: 28),
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              imageFile: _image,
              size: 70,
              isEditable: true,
            ),
            Spacer(),
            InnerShadow(
              shadows: [
                BoxShadow(
                  offset: Offset(0, -4),
                  color: Color.fromARGB(33, 99, 190, 122),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 146,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 5),
                        color: Colors.black.withAlpha((13 * 2.55).toInt()),
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Connected to:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: Color(0xff273430),
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomSvg(asset: AppIcons.apple),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "wasiul0491@gmail.com",
                          style: TextStyle(
                            fontFamily: "roboto",
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff949494),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 28),
          ],
        ),
        const SizedBox(height: 50),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: "ROBOTO",
                      fontWeight: FontWeight.w500,
                      color: Color(0x4d000000),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff273430),
                      ),
                      cursorColor: Color(0xff273430),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "wasiul0491@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff273430),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    CountryCodePicker(
                      showFlag: false,
                      showFlagDialog: true,
                      headerText: "Pick a country",
                      padding: EdgeInsetsGeometry.only(),
                      pickerStyle: PickerStyle.bottomSheet,
                      dialogSize: Size(
                        double.infinity,
                        MediaQuery.of(context).size.height / 2,
                      ),
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withAlpha((8 * 2.55).toInt()),
                        ),
                      ),
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xff273430),
                        height: 1,
                      ),
                      dialogTextStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xff273430),
                        height: 1,
                      ),
                      searchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search a country",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xffACACAC),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-7, 0),
                      child: CustomSvg(
                        asset: AppIcons.arrowDown,
                        width: 10,
                        height: 4,
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      decoration: BoxDecoration(color: Color(0x80c4c4c4)),
                    ),
                    Expanded(
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff273430),
                        ),
                        cursorColor: Color(0xff273430),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Date of birth",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    Spacer(),
                    Text(
                      Formatter.dateFormatter(DateTime.now()),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff273430),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomSvg(asset: AppIcons.arrowDown),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              InkWell(
                onTap: () {
                  _showCountrySelectionSheet(context, countryFrom, (code) {
                    setState(() {
                      countryFrom = code;
                    });
                  });
                  // CustomModalSheet();
                },
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Text(
                        "Country from",
                        style: TextStyle(
                          fontFamily: "ROBOTO",
                          fontWeight: FontWeight.w500,
                          color: Color(0x4d000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        AppConstants.countryNames[countryFrom] ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff273430),
                        ),
                      ),
                      const SizedBox(width: 16),
                      CustomSvg(asset: AppIcons.arrowDown),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Lives in",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    Spacer(),
                    Text(
                      AppConstants.countryNames[livesIn] ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff273430),
                      ),
                    ),
                    const SizedBox(width: 16),
                    CustomSvg(asset: AppIcons.arrowDown),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Public profile",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    Spacer(),
                    CustomSwitch(
                      value: publicProfile,
                      onChange: () {
                        setState(() {
                          publicProfile = !publicProfile;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0x80c4c4c4)),
              ),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      "Connect your contacts",
                      style: TextStyle(
                        fontFamily: "ROBOTO",
                        fontWeight: FontWeight.w500,
                        color: Color(0x4d000000),
                      ),
                    ),
                    Spacer(),
                    CustomSwitch(
                      value: connectContacts,
                      onChange: () {
                        if (!connectContacts) {
                          setState(() {
                            connectContacts = true;
                          });
                        }
                        getContacts().then((val) async {
                          await Future.delayed(Duration(milliseconds: 200));
                          setState(() {
                            connectContacts = val;
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 56),
        CustomButton(text: "Save"),
      ],
    );
  }

  Future<bool> getContacts() async {
    var permission = await Permission.contacts.status;
    if (permission.isGranted) {
      return await fetchContacts();
    } else if (permission.isDenied) {
      var result = await Permission.contacts.request();
      if (result.isGranted) {
        return await fetchContacts();
      } else {
        Get.snackbar(
          "Error Occured",
          "Permission denied, cannot access contacts.",
        );
        return false;
      }
    }
    return false;
  }

  Future<bool> fetchContacts() async {
    try {
      if (await FlutterContacts.requestPermission()) {
        List<Contact> contacts = await FlutterContacts.getContacts();

        String names = "";
        for (var contact in contacts) {
          names = names + ("Contact: ${contact.displayName}; ");
        }

        Get.snackbar("Done fetching contacts", names.substring(0, 20));
        return true;
      } else {
        Get.snackbar(
          "Error Occured",
          "FlutterContacts couldn't get permission",
        );
        return false;
      }
    } catch (e) {
      Get.snackbar("Error Occured", "Error fetching contacts: $e");
      return false;
    }
  }

  void _showCountrySelectionSheet(
    BuildContext context,
    String? selected,
    void Function(String? code) onClick,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text("Country From", style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: CustomSearchBar(height: 50, iconSize: 20),
                  ),
                  const SizedBox(height: 36),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          const SizedBox(width: 360, height: 20),
                          for (var i in AppConstants.countryNames.keys)
                            CountryWidget(
                              countryCode: i,
                              isSelected: i == selected,
                              onClick: () {
                                onClick(i);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
