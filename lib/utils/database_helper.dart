
import 'dart:io';
import 'package:corona_tracking_app/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  //tablo adları
  //ve sutun

  String _userTablosu = "user";
  String _columnID = "id";
  String _columnName = "name";
  String _columnSorubir = "sorubir";
  String _columnSoruiki = "soruiki";
  String _columnSoruuc = "soruuc";
  String _columnTarih = "tarih";

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    }else{
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database>_getDataBase()async{
    if(_database==null){
      _database = await _initializeDatabase();
      return _database;
    }else{
      return _database;
    }
  }

  _initializeDatabase() async{
    Directory klasor = await getApplicationDocumentsDirectory();
    String dpPath = join(klasor.path, "userDB");
    var userDB = openDatabase(dpPath, version: 1, onCreate: _createDB);
    return userDB;
  }


  Future<void> _createDB(Database db, int version) async{
    await db.execute("CREATE TABLE $_userTablosu ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT, $_columnSorubir TEXT, $_columnSoruiki TEXT, $_columnSoruuc TEXT, $_columnTarih TEXT)");
  }

  //--------------------------------------


  Future<int> userAdd(User user) async{
    var db = await _getDataBase();
    var sonuc = await db.insert(_userTablosu, user.toMap(), nullColumnHack: "$_columnID");
    return sonuc;
  }

  Future<List<Map<String, dynamic>>>allUsers() async{
    var db = await _getDataBase();
    var sonuc = await db.query(_userTablosu, orderBy: '$_columnID');
    return sonuc;
  }

  /*
  Future<int> userDelete(int id) async{
    var db = await _getDataBase();
    var sonuc = await db.delete(_userTablosu, where: '$_columnID = ?',whereArgs: [id]);
    return sonuc;
  }
   */

  Future<int> userDelete() async{
    var db = await _getDataBase();
    var sonuc = await db.delete(_userTablosu);
    return sonuc;
  }

}