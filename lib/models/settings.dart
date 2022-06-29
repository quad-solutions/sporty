import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporty_mc_sportface/main.dart';

class Settings extends ChangeNotifier{

  Settings(String? userName){
    this.userName = userName ?? "Mr X";
  }

  String userName = "";

  void setUserName(String name){
    userName = name;
    notifyListeners();
    save();
  }

  void save() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("userName", userName);
  }
}