import 'package:flutter/material.dart';
import 'dart:ui'; // for BackdropFilter

class CustomModalSheet extends StatefulWidget {
  final Widget? overlay;
  final bool showModal;
  final void Function() onTapOutside;
  final Widget child;
  const CustomModalSheet({
    super.key,
    this.overlay,
    required this.onTapOutside,
    required this.child,
    required this.showModal,
  });

  @override
  CustomModalSheetState createState() => CustomModalSheetState();
}

class CustomModalSheetState extends State<CustomModalSheet>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _blurController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _blurController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    _blurAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: _blurController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(CustomModalSheet oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showModal) {
      _slideController.forward();
      _blurController.forward();
    } else {
      _slideController.reverse();
      _blurController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

        if (widget.showModal)
          AnimatedBuilder(
            animation: _blurController,
            builder: (context, child) {
              return BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _blurAnimation.value,
                  sigmaY: _blurAnimation.value,
                ),
                child: Container(color: Colors.transparent),
              );
            },
          ),

        if (widget.showModal)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _slideController.reverse();
                _blurController.reverse();
                Future.delayed(
                  Duration(milliseconds: 300),
                  widget.onTapOutside,
                );
              },
            ),
          ),

        if (widget.showModal)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  constraints: BoxConstraints(
                    // maxHeight: MediaQuery.of(context).size.height / 1.77,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    border: Border.all(
                      color: Colors.black.withAlpha((8 * 2.55).toInt()),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: widget.overlay ?? Container()),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _blurController.dispose();
    super.dispose();
  }
}
