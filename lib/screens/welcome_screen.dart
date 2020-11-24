import 'package:corona_tracking_app/models/user.dart';
import 'package:corona_tracking_app/screens/login_screen.dart';
import 'package:corona_tracking_app/utils/database_helper.dart';
import 'package:corona_tracking_app/widgets/clipper.dart';
import 'package:corona_tracking_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _validate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  DatabaseHelper _databaseHelper;
  List<User> allUserList;
  final FocusNode _olbegulum = FocusNode();


  @override
  void initState() {
    super.initState();
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

    var en = MediaQuery.of(context).size.width;
    var boy = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(elevation: 0,toolbarHeight: 40,automaticallyImplyLeading: false,),
      body: Container(
          width: en,
          height: boy,
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 250,
                  color: kPrimaryColor,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: en,
                    child: Image.asset("assets/images/icon.png",height: 100),
                  ),
                  Text(
                    "Welcome",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white,),
                  ),
                  SizedBox(height: 100,),
                  formAlani(en,boy)
                ],
              ),
              Positioned(
                bottom: -125,
                left: -125,
                child: ClipOval(
                  child: Container(
                    color: kPrimaryColor,
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
              ),
              Positioned(
                bottom: -200,
                right: -200,
                child: ClipOval(
                  child: Container(
                    color: kPrimaryColor,
                    height: 400.0,
                    width: 400.0,
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  formAlani(double en, double boy) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5,),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 10.0,
                    ),
                  ],
                  color: kGreyBackground,
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(
                focusNode: _olbegulum,
                onEditingComplete: (){
                  _olbegulum.unfocus();
                  sumbitButton();
                },
                textAlign: TextAlign.left,
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  hintText: 'Enter Your Name',
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
          SizedBox(height: 30,),
          ButtonTheme(
            minWidth: en-70,
            height: 50,
            child: RaisedButton(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),),
              onPressed: () => sumbitButton(),

              color: kPrimaryColor,
              textColor: Colors.white,
              child: Text("CONTİNUE",
                  style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  sumbitButton(){
    if(_name.text.isEmpty == true){
      setState(() {
        _validate=true;
      });
    }else{
      _userEkle(User(_name.text, "null", "null", "null", "null"));
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  void _userEkle(User user) async{
    var eklenenYeniUser = await _databaseHelper.userAdd(user);
    user.id = eklenenYeniUser;
    if(eklenenYeniUser>0){
      setState(() {
        allUserList.insert(0, user);
      });
    }
  }
}




