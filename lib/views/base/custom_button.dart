import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final bool isSecondary;
  final bool isDisabled;
  final double? height;
  final double? width;
  final bool isLoading;
  final String? leading;
  final String? trailing;
  final double padding;
  final double radius;
  final double fontSize;
  final double iconSize;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.leading,
    this.trailing,
    this.padding = 40,
    this.radius = 99,
    this.isSecondary = false,
    this.isLoading = false,
    this.isDisabled = false,
    this.fontSize = 16,
    this.iconSize = 24,
    this.height = 40,
    this.width = double.infinity,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(widget.radius),
      onTap: widget.isLoading ? null : widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.isDisabled ? Color(0xff999999) : null,
          gradient: widget.isSecondary || widget.isDisabled
              ? null
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6DC3F2), Color(0xFF0289F2)],
                ),
        ),
        child: widget.isLoading
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 4,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  if (widget.leading != null)
                    SvgPicture.asset(
                      widget.leading!,
                      height: widget.iconSize,
                      width: widget.iconSize,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  if (widget.trailing != null)
                    SvgPicture.asset(
                      widget.trailing!,
                      height: widget.iconSize,
                      width: widget.iconSize,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
