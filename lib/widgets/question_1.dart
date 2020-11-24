import 'dart:ffi';

import 'package:corona_tracking_app/models/user.dart';
import 'package:corona_tracking_app/screens/question_result_Screen.dart';
import 'package:corona_tracking_app/utils/database_helper.dart';
import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int index = 1;
int resultIndex = 0;
String _soru1cevabi;
String _soru2cevabi;
String _soru3cevabi;
String _tarih;

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {


  var mySharedPreferences;
  DatabaseHelper _databaseHelper;
  List<User> allUserList;



  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sf) => {
      mySharedPreferences = sf,
    });
    tarih();
    allUserList = List<User>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.allUsers().then((value){
      for(Map okunanUserMapi in value){
        allUserList.add(User.fromMap(okunanUserMapi));
      }
    });
  }

  tarih() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
     final String formatted = formatter.format(now);
    _tarih = formatted;
  }


  @override
  Widget build(BuildContext context) {

    List soru1 = [
      "How are you feeling today?",
      "VERY GOOD",
      "GOOD BUT A LITTLE WEAK",
      "NOT GOOD",
      "WEAK AND SICK"
    ];
    List soru2 = [
      "Have you got a fever?",
      "36.1C - 37C",
      "37.1C - 38C",
      "38.1C - 39C",
      "39.1C >"
    ];
    List soru3 = [
      "Have you got a dry cough",
      "NO",
      "SOMETIMES",
      "OFTEN",
      "YES"
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            index == 1
                ? soru1[0]
                : index == 2
                    ? soru2[0]
                    : index == 3
                        ? soru3[0]
                        : soru3[0],
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            width: 290,
            child: RaisedButton(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: green)),
              onPressed: () {
                setState(() {
                  if(index==1){
                    _soru1cevabi = soru1[1];
                  }
                  if(index==2){
                    _soru2cevabi = soru2[1];
                  }
                  if(index==3){
                    _soru3cevabi = soru3[1];
                  }
                  resultIndex += 1;
                  index++;
                  if (index > 3) {
                    _userEkle(User("null", _soru1cevabi, _soru2cevabi, _soru3cevabi, _tarih));
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>
                            QuestionResultScreen(skor: resultIndex)));
                  }
                });
              },
              color: green,
              textColor: Colors.white,
              child: Text(
                  index == 1
                      ? soru1[1]
                      : index == 2
                          ? soru2[1]
                          : index == 3
                              ? soru3[1]
                              : soru3[0],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          ),
        ),
        SizedBox(
          width: 290,
          child: RaisedButton(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: green)),
            onPressed: () {
              setState(() {
                if(index==1){
                  _soru1cevabi = soru1[2];
                }
                if(index==2){
                  _soru2cevabi = soru2[2];
                }
                if(index==3){
                  _soru3cevabi = soru3[2];
                }
                resultIndex += 3;
                index++;
                if (index > 3) {
                  _userEkle(User("null", _soru1cevabi, _soru2cevabi, _soru3cevabi, _tarih));
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) =>
                          QuestionResultScreen(skor: resultIndex)));
                }
              });
            },
            color: green,
            textColor: Colors.white,
            child: Text(
                index == 1
                    ? soru1[2]
                    : index == 2
                        ? soru2[2]
                        : index == 3
                            ? soru3[2]
                            : soru3[0],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
          ),
        ),
        SizedBox(
          width: 290,
          child: RaisedButton(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: green)),
            onPressed: () {
              setState(() {
                if(index==1){
                  _soru1cevabi = soru1[3];
                }
                if(index==2){
                  _soru2cevabi = soru2[3];
                }
                if(index==3){
                  _soru3cevabi = soru3[3];
                }
                resultIndex += 5;
                index++;
                if (index > 3) {
                  _userEkle(User("null", _soru1cevabi, _soru2cevabi, _soru3cevabi,_tarih));
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) =>
                          QuestionResultScreen(skor: resultIndex)));
                }
              });
            },
            color: green,
            textColor: Colors.white,
            child: Text(
                index == 1
                    ? soru1[3]
                    : index == 2
                        ? soru2[3]
                        : index == 3
                            ? soru3[3]
                            : soru3[0],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
          ),
        ),
        SizedBox(
          width: 290,
          child: RaisedButton(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: green)),
              onPressed: () {
                setState(() {
                  if(index==1){
                    _soru1cevabi = soru1[4];
                  }
                  if(index==2){
                    _soru2cevabi = soru2[4];
                  }
                  if(index==3){
                    _soru3cevabi = soru3[4];
                  }
                  resultIndex += 7;
                  index++;
                  if (index > 3) {
                    _userEkle(User("null", _soru1cevabi, _soru2cevabi, _soru3cevabi,_tarih));
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>
                            QuestionResultScreen(skor: resultIndex)));
                  }
                });
              },
              color: green,
              textColor: Colors.white,
              child: Text(
                  index == 1
                      ? soru1[4]
                      : index == 2
                          ? soru2[4]
                          : index == 3
                              ? soru3[4]
                              : soru3[0],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300))),
        ),
      ],
    );
  }

  void _userEkle(User user) async{
    var eklenenYeniUser = await _databaseHelper.userAdd(user);
    print("sorular eklendi $eklenenYeniUser");
    user.id = eklenenYeniUser;
    if(eklenenYeniUser>0){
      setState(() {
        allUserList.insert(0, user);
      });
    }
  }

}