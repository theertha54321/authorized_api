import 'package:authorized_api/view/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static showOntimeSnackbar({required BuildContext context,required String message, Color? backgroundColor=Colors.red}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        
        backgroundColor: backgroundColor,
        
        content: Text(message))
    );
  }

  static Future<void> saveData({required String key,required String? value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await  pref.setString(key,value ?? "");
  }
  static Future<String?> getToken() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     final String? accessToken = pref.getString(AppConfig.ACCESSTOKEN);
     return accessToken;
  }
}