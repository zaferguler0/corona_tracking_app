import 'dart:async';
import 'package:corona_tracking_app/models/user.dart';
import 'package:corona_tracking_app/screens/daily_tips.dart';
import 'package:corona_tracking_app/screens/history_Screen.dart';
import 'package:corona_tracking_app/screens/questons_Screen.dart';
import 'package:corona_tracking_app/screens/welcome_screen.dart';
import 'package:corona_tracking_app/utils/database_helper.dart';
import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:corona_tracking_app/widgets/question_1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  var mySharedPreferences;
  DatabaseHelper _databaseHelper;
  int _counter = 5;
  List<User> allUserList;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sf) => {
      mySharedPreferences = sf,
    });
    allUserList = List<User>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.allUsers().then((value){
      for(Map okunanUserMapi in value){
        allUserList.add(User.fromMap(okunanUserMapi));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }
  buildBody() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: -250,
              top: -300,
              child: ClipOval(
                child: Container(
                  color: kPrimaryColor,
                  height: 500.0,
                  width: 500.0,
                ),
              ),
            ),
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
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Container(
                  height: 310,
                  width: 320,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 20.0,
                                  ),
                                ],
                                color: kGreyBackground,
                                borderRadius: BorderRadius.circular(30)),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/calendar.png",width: 100,height: 100,),
                                  Text("History",style: TextStyle(fontSize: 20,color: Colors.white),)
                                ],
                              ),
                              minWidth: 150,
                              height: 150,
                              color: kPrimaryColor,
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen(liste: allUserList))),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 30.0,
                                  ),
                                ],
                                color: kGreyBackground,
                                borderRadius: BorderRadius.circular(30)),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/question_mark.png",width: 100,height: 100,),
                                  Text("Questions",style: TextStyle(fontSize: 20,color: Colors.white),)
                                ],
                              ),
                              minWidth: 150,
                              height: 150,
                              color: kPrimaryColor,
                              onPressed: () => {
                                resultIndex=0,
                                index=1,
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsScreen())),
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 20.0,
                                  ),
                                ],
                                color: kGreyBackground,
                                borderRadius: BorderRadius.circular(30)),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/idea.png",width: 95,height: 95,),
                                  Text("Daily Tip",style: TextStyle(fontSize: 20,color: Colors.white),)
                                ],
                              ),
                              minWidth: 150,
                              height: 150,
                              color: kPrimaryColor,
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DailyTips())),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 20.0,
                                  ),
                                ],
                                color: kGreyBackground,
                                borderRadius: BorderRadius.circular(30)),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),),
                              child: Column(
                                children: [
                                  Icon(Icons.exit_to_app,size: 80,color: Colors.white,),
                                  Text("Exit",style: TextStyle(fontSize: 20,color: Colors.white),)
                                ],
                              ),
                              minWidth: 150,
                              height: 150,
                              color: kPrimaryColor,
                              onPressed: () {
                                cikisyap();
                              },
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left:20.0,top: 20),
                child: Image.asset("assets/images/icon.png",height: 100),
              ),
            ),
          ],
        )
      ),
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("You can update your status after the"+" "+"${(_counter)}"+" "+"seconds.",style: TextStyle(fontSize: 18),),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: TextButton(
                child: Text('Okey',style: TextStyle(fontSize: 20,color: Colors.black54),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void cikisyap() async{
    (mySharedPreferences as SharedPreferences).remove("isLogin");
    var silinenelemansayi = await _databaseHelper.userDelete();
    print(silinenelemansayi);
    print("user silindi");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
