import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:corona_tracking_app/widgets/question_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
        children: [
          Positioned(
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child:  Question1(),
            ),
          )
        ],
      )
    );
  }
}

