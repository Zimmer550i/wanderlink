import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_button.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/guide_widget.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/friends/user_profile.dart';
import 'package:wanderlink/views/screens/onboarding/demo_home.dart';

class FriendSuggestions extends StatefulWidget {
  const FriendSuggestions({super.key});

  @override
  State<FriendSuggestions> createState() => _FriendSuggestionsState();
}

class _FriendSuggestionsState extends State<FriendSuggestions> {
  final double swipeThreshold = 20.0;
  double _initialX = 0;
  List<int> selected = [];

  void onSwipeLeft() {
    Get.to(() => FriendSuggestions(), transition: Transition.rightToLeft);
  }

  void onSwipeRight() {
    Get.back();
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
        isScrollable: false,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GuideWidget(
                text:
                    "If you’ve connected your contacts, why dont you add a few suggested friends?",
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  for (int i = 0; i < 8; i++)
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: selected.contains(i)
                            ? Color(0xff34C759)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          ProfilePicture(
                            image: "https://thispersondoesnotexist.com",
                            borderWidth: 0,
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selected.contains(i)) {
                                    selected.remove(i);
                                  } else {
                                    selected.add(i);
                                  }
                                });
                              },
                              onLongPress: () {
                                Get.to(() => UserProfile());
                              },
                              behavior: HitTestBehavior.translucent,
                              child: Container(),
                            ),
                          ),
                          if (selected.contains(i))
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CustomSvg(asset: "assets/icons/tick.svg"),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GuideWidget(
              text:
                  "Long press to peek at the profile. Click their faces to add or request to follow them!",
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              left: 60,
              right: 60,
            ),
            child: CustomButton(
              text: "Next / Skip",
              onTap: () {
                Get.to(() => DemoHome());
              },
            ),
          ),
        ],
      ),
    );
  }
}
