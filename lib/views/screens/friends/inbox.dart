import 'package:flutter/material.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final _focus = FocusNode();
  List<Widget> messages = [];

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    getMessages();
    return CustomScaffold(
      title: "Lee Williamson",
      hasNavbar: false,
      isScrollable: false,
      navbarPadding: false,
      appbarPadding: false,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [...messages, const SizedBox(height: 14)],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8, left: 21, right: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                CustomSvg(
                  asset: "assets/icons/camera_blue.svg",
                  size: 22,
                  color: Color(0xff0584FE),
                ),
                const SizedBox(width: 11),
                CustomSvg(
                  asset: "assets/icons/gallery.svg",
                  size: 22,
                  color: Color(0xff0584FE),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 36,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((5 * 2.55).toInt()),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: TextField(
                        focusNode: _focus,
                        onTapOutside: (event) {
                          _focus.unfocus();
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          isCollapsed: true,
                          hintText: "Aa",
                        ),
                        cursorColor: Color(0xff0584FE),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                CustomSvg(
                  asset: "assets/icons/like.svg",
                  size: 25,
                  color: Color(0xff0584FE),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getMessages() {
    messages.clear();
    messages.addAll([
      recieveMessage("Hey, do you know what time is it where you are?"),
      sendMessage("t’s morning in Tokyo 😎"),
      recieveMessage("What does it look like in Japan?", hasNext: true),
      recieveMessage("Do you like it?", hasPrev: true),
      sendMessage("Absolutely loving it!", hasNext: true),
      sendMessage(null, img: "https://picsum.photos/221/121", hasPrev: true),
    ]);
  }

  Widget recieveMessage(
    String? messgae, {
    String? img,
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                hasNext
                    ? SizedBox(height: 28, width: 28)
                    : ProfilePicture(
                        image: "https://thispersondoesnotexist.com",
                        size: 28,
                        borderWidth: 0,
                      ),
                const SizedBox(width: 16),
                img == null
                    ? Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha((6 * 2.55).toInt()),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                              topLeft: Radius.circular(hasPrev ? 4 : 18),
                              bottomLeft: Radius.circular(hasNext ? 4 : 18),
                            ),
                          ),
                          child: Text(
                            messgae ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                          topLeft: Radius.circular(hasPrev ? 4 : 18),
                          bottomLeft: Radius.circular(hasNext ? 4 : 18),
                        ),
                        child: Image.network(
                          img,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            double? progress =
                                loadingProgress.expectedTotalBytes != null &&
                                    loadingProgress.expectedTotalBytes! > 0
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null;

                            if (progress == null || progress < 1) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return child;
                            }
                          },
                        ),
                      ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget sendMessage(
    String? messgae, {
    String? img,
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                img == null
                    ? Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff0584FE),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                              topRight: Radius.circular(hasPrev ? 4 : 18),
                              bottomRight: Radius.circular(hasNext ? 4 : 18),
                            ),
                          ),
                          child: Text(
                            messgae ?? "",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          topRight: Radius.circular(hasPrev ? 4 : 18),
                          bottomRight: Radius.circular(hasNext ? 4 : 18),
                        ),
                        child: Image.network(
                          img,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            double? progress =
                                loadingProgress.expectedTotalBytes != null &&
                                    loadingProgress.expectedTotalBytes! > 0
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null;

                            if (progress == null || progress < 1) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return child;
                            }
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
