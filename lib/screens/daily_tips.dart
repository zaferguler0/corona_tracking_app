import 'package:flutter/material.dart';

class DailyTips extends StatefulWidget {
  @override
  _DailyTipsState createState() => _DailyTipsState();
}

class _DailyTipsState extends State<DailyTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title:Text("Wear a mask.",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im1.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title:Text("Don't touch face with unwashed hands.",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im2.png"),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Wash your hands",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im3.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Practice social distancing",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im4.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Avoid travelling",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im5.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Cover your mouth with elbow",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im6.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Cook well.",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im7.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Avoid contacts with animals..",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im8.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Put tissues in the trash..",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im9.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text("Avoid handshacking.",style: TextStyle(fontSize: 20),),
                  leading: Image.asset("assets/images/im10.png"),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}