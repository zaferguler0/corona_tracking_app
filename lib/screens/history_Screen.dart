import 'package:corona_tracking_app/models/user.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final List liste;

  const HistoryScreen({Key key, this.liste}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<User> allUserList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
    );
  }
/*
ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title: Text(widget.liste[index].tarih, style: TextStyle(fontSize: 18)),
                    subtitle: Column(
                      children: [
                        Text(
                          "Mood:  " + widget.liste[index].sorubir,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Fever:  " + widget.liste[index].soruiki,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Cough:  " + widget.liste[index].soruuc,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.coronavirus,size: 50,),
                  ),
 */

  buildBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.liste.length,
      itemBuilder: (context, int index) {
        print(index);
        return index != 0
            ? Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20,top: 15,bottom: 15),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range_rounded,size: 40,),
                              SizedBox(width: 10,),
                              Text("Date: "+ widget.liste[index].tarih,style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.mood,size: 40,),
                              SizedBox(width: 10,),
                              Text("Mood: "+ widget.liste[index].sorubir,style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.local_fire_department_outlined,size: 40,),
                              SizedBox(width: 10,),
                              Text("Fever: "+ widget.liste[index].soruiki,style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.sick,size: 40,),
                              SizedBox(width: 10,),
                              Text("Cough: "+ widget.liste[index].soruuc,style: TextStyle(fontSize: 18),)
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Icon(Icons.history_rounded,size: 60,)
                  ),
                ],
              );
      },
    );
  }
}
