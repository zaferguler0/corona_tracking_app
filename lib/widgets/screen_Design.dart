import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class ScreenDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Positioned(
        left: -45,
        bottom: -310,
        child: ClipOval(
          child: Container(
            color: kPrimaryColor,
            height: 400.0,
            width: 500.0,
          ),
        ),
      ),
    );
  }
}
