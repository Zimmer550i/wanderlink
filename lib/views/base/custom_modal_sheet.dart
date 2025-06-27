import 'package:flutter/material.dart';
import 'dart:ui'; // for BackdropFilter

class CustomModalSheet extends StatelessWidget {
  const CustomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Apply blur
      child: Container(
        color: Colors.black.withAlpha(128), // Semi-transparent black overlay
        child: Center(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Custom Modal Content', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the modal
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}