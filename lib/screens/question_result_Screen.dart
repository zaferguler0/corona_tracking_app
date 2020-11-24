import 'package:corona_tracking_app/screens/home_screen.dart';
import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class QuestionResultScreen extends StatefulWidget {
  final int skor;

  const QuestionResultScreen({Key key, this.skor}) : super(key: key);

  @override
  _QuestionResultScreenState createState() => _QuestionResultScreenState();
}

class _QuestionResultScreenState extends State<QuestionResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: green,
      ),
      body: Stack(
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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: widget.skor <= 5
                  ? Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: green,
                          size: 50,
                        ),
                        Text("You are Good",
                            style: TextStyle(
                                fontSize: 40,
                                color: green,
                                fontWeight: FontWeight.w300)),
                        goToHomePage(),
                      ],
                    )
                  : (widget.skor > 6 && widget.skor < 10)
                      ? Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Icon(
                              Icons.warning,
                              color: Colors.amber,
                              size: 50,
                            ),
                            Text("You Should",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w300)),
                            Text("Take Care of Yourself",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w300)),
                            goToHomePage(),
                          ],
                        )
                      : widget.skor >= 10
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Icon(
                                  Icons.coronavirus,
                                  color: Colors.red,
                                  size: 100,
                                ),
                                Text("You Must to Go to Doctor",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w300)),
                                goToHomePage(),
                              ],
                            )
                          : Text("asd"),
            ),
          ),
        ],
      ),
    );
  }

  goToHomePage() {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: green)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      color: green,
      textColor: Colors.white,
      child: Text("Go To Home Page",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300)),
    );
  }
}
