import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/views/base/custom_networked_image.dart';
import 'package:wanderlink/views/base/custom_scaffold.dart';
import 'package:wanderlink/views/base/profile_picture.dart';
import 'package:wanderlink/views/screens/settings/report_form.dart';

class PostDetails extends StatefulWidget {
  final String url;
  const PostDetails({super.key, required this.url});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool enableBlur = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBlur: enableBlur,
      tabIndex: 2,
      trailing: actionButton(),
      children: [
        Row(
          spacing: 10,
          children: [
            const SizedBox(width: 10),
            ProfilePicture(
              image: "https://thispersondoesnotexist.com",
              borderWidth: 0,
              size: 40,
            ),
            Text(
              "Person Name",
              style: TextStyle(
                fontSize: 11,
                color: Colors.black.withAlpha((65 * 2.55).toInt()),
              ),
            ),
            Text(
              "|",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xffB3B3B3),
              ),
            ),
            Text(
              "Country",
              style: TextStyle(fontSize: 11, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomNetworkedImage(
          url: "https://picsum.photos/seed/${widget.url}/800/800",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
          radius: 0,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "martin Andorra is literally the most picturesque place I’ve ever been to 😍",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "May 2023",
              style: TextStyle(fontSize: 14, color: Color(0xB81B1F26)),
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuButton<dynamic> actionButton() {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          enableBlur = false;
        });
        if (value == 0) {
          Get.to(() => ReportForm(isPost: true));
        }
      },
      onCanceled: () {
        setState(() {
          enableBlur = false;
        });
      },
      onOpened: () {
        setState(() {
          enableBlur = true;
        });
      },
      color: Colors.white,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem<int>(
          value: 0,
          height: 25,
          child: Container(
            width: double.infinity,
            height: 25,
            padding: EdgeInsets.only(left: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
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
        child: Center(child: CustomSvg(asset: "assets/icons/three_dot.svg")),
      ),
    );
  }
}
