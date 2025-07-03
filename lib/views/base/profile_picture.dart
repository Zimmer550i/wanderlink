import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wanderlink/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanderlink/utils/custom_image_picker.dart';
import 'package:wanderlink/utils/custom_svg.dart';

class ProfilePicture extends StatelessWidget {
  final double size;
  final String? image;
  final File? imageFile;
  final bool showLoading;
  final bool isEditable;
  final bool whiteBorder;
  final double borderWidth;
  final Function(File)? imagePickerCallback;

  const ProfilePicture({
    super.key,
    this.image,
    this.size = 100,
    this.showLoading = true,
    this.whiteBorder = false,
    this.isEditable = false,
    this.imagePickerCallback,
    this.borderWidth = 3.75,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        if (!isEditable) {
          return;
        }

        File? image = await customImagePicker();

        if (image != null && imagePickerCallback != null) {
          imagePickerCallback!(image);
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(borderWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              gradient: whiteBorder
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF6DC3F2), Color(0xFF0289F2)],
                    ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size),
              child: imageFile != null
                  ? Image.file(
                      imageFile!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : image != null
                  ? CachedNetworkImage(
                      imageUrl: image!,
                      progressIndicatorBuilder: (context, url, progress) {
                        return SizedBox(
                          width: size,
                          height: size,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              strokeWidth: 2,
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Container(
                          width: size,
                          height: size,
                          color: Colors.white,
                          child: Icon(Icons.error, color: Colors.blue),
                        );
                      },
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: size,
                      height: size,
                      padding: EdgeInsets.all(size * 0.17),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.profile,
                          colorFilter: ColorFilter.mode(
                            Colors.blue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          if (isEditable)
            Positioned(
              right: -13,
              top: 0,
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff6DC3F2),
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Center(
                    child: CustomSvg(asset: AppIcons.camera, size: 20),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
