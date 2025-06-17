import 'package:wanderlink/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanderlink/utils/app_texts.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final String? errorText;
  final String? leading;
  final String? trailing;
  final TextInputType? textInputType;
  final bool isDisabled;
  final double radius;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final bool isPassword;
  final int lines;
  final void Function()? onTap;
  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.leading,
    this.trailing,
    this.isPassword = false,
    this.isDisabled = false,
    this.radius = 50,
    this.lines = 1,
    this.textInputType,
    this.controller,
    this.onTap,
    this.errorText,
    this.height = 50,
    this.width,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = false;
  bool isFocused = false;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isFocused = true;
        });
      } else {
        setState(() {
          isFocused = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(widget.title!, style: AppTexts.tsmr),
          ),
        GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            } else {
              if (!widget.isDisabled) {
                focusNode.requestFocus();
              }
            }
          },
          child: Container(
            height: widget.lines == 1 ? widget.height : null,
            width: widget.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: widget.lines == 1 ? 0 : 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((66 * 2.55).toInt()),
              borderRadius: BorderRadius.circular(widget.radius),
              border: isFocused
                  ? Border.all(color: Color(0xff0289F2), width: 2)
                  : Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  blurRadius: 24,
                  offset: Offset(0, 4),
                  color: Colors.black.withAlpha(18),
                ),
              ],
            ),
            child: Row(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.leading != null)
                  SvgPicture.asset(
                    widget.leading!,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      Color(0xff0F9BE9),
                      BlendMode.srcIn,
                    ),
                  ),
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: widget.controller,
                    maxLines: widget.lines,
                    cursorColor: Color(0xff1C73A3),
                    keyboardType: widget.textInputType,
                    obscureText: isObscured,
                    enabled: !widget.isDisabled && widget.onTap == null,
                    onTapOutside: (event) {
                      setState(() {
                        isFocused = false;
                        focusNode.unfocus();
                      });
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff98847C),
                      ),
                    ),
                  ),
                ),
                if (widget.trailing != null)
                  SvgPicture.asset(
                    widget.trailing!,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(50),
                      BlendMode.srcIn,
                    ),
                  ),
                if (widget.isPassword)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: SvgPicture.asset(
                      isObscured ? AppIcons.eyeOff : AppIcons.eye,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(50),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                fontVariations: [FontVariation("wght", 400)],
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
