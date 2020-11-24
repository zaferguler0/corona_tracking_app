import 'file:///C:/Users/zafer/AndroidStudioProjects/corona_tracking_app/lib/widgets/constants.dart';
import 'package:corona_tracking_app/models/user.dart';
import 'package:corona_tracking_app/screens/home_screen.dart';
import 'package:corona_tracking_app/utils/database_helper.dart';
import 'package:corona_tracking_app/widgets/clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mySharedPreferences;

  String _cinsiyet;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _boy = TextEditingController();
  final TextEditingController _kilo = TextEditingController();

  DatabaseHelper _databaseHelper;
  List<User> allUserList;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sf) => {
          mySharedPreferences = sf,
        });
    allUserList = List<User>();
    _databaseHelper = DatabaseHelper();
    _databaseHelper.allUsers().then((value) {
      for (Map okunanUserMapi in value) {
        allUserList.add(User.fromMap(okunanUserMapi));
      }
    });
    print(allUserList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 250,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: textiCagir(),
                ),
              ],
            ),
            dropDownsList(),
          ],
        ),
      ),
    );
  }
  textiCagir() {
    try{
      var gelenveri = allUserList[0].name;
      return Text(
        gelenveri,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 45,
          color: Colors.white,
        ),
      );
    }catch(e){
      print("hata yok");
    }
  }

  dropDownsList() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ], color: kGreyBackground, borderRadius: BorderRadius.circular(25)),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: EdgeInsets.only(left: 20, right: 20)),
                value: _cinsiyet,
                items: ['Male', 'Female']
                    .map((label) => DropdownMenuItem(
                  child: Text(label.toString()),
                  value: label,
                ))
                    .toList(),
                hint: Text('Gender'),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 5.0,
                          ),
                        ],
                        color: kGreyBackground,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      controller: _boy,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Height',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: kGreyBackground,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 5.0,
                          ),
                        ],
                        color: kGreyBackground,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      controller: _kilo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Weight',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: kGreyBackground,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 5.0,
                          ),
                        ],
                        color: kGreyBackground,
                        borderRadius: BorderRadius.circular(25)),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 45,
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        onPressed: () => _selectDate(context),
                        textColor: Colors.grey.shade600,
                        color: kGreyBackground,
                        child: Container(
                          padding: EdgeInsets.only(left: 4),
                          alignment: Alignment.centerLeft,
                          child: Text("${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: sumbitButton(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: kPrimaryColor,
            ),
          ),
          child: child,
        );
      },
      context: context,
      initialDate: selectedDate,
      // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  sumbitButton() {
    return ButtonTheme(
      minWidth: 80,
      height: 80,
      child: RaisedButton(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: kPrimaryColor,
        onPressed: () async {
          await (mySharedPreferences as SharedPreferences)
              .setBool("isLogin", true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    );
  }
}
