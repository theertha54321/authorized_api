import 'dart:developer';

import 'package:authorized_api/utils/app_utils.dart';
import 'package:authorized_api/view/app_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class HomeController with ChangeNotifier{
  fetchAllProducts(BuildContext context) async {
  final url = Uri.parse(AppConfig.baseUrl+"/products-all/");
  try{
    final response= await http.get(url,headers: {"Authorization":"Bearer ${await AppUtils.getToken()}"});
    log(response.body.toString());
    if(response.statusCode==200){
      AppUtils.showOntimeSnackbar(context: context, message: "Success.......",backgroundColor: Colors.green);
    }
    else{
      AppUtils.showOntimeSnackbar(context: context, message: "Failed.......");
    }
    }
  
  catch(e){

  }
  }
}
