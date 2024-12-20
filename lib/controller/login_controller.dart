



import 'package:authorized_api/model/login_res_model.dart';
import 'package:authorized_api/utils/app_utils.dart';
import 'package:authorized_api/view/app_config.dart';
import 'package:authorized_api/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class LoginScreenController with ChangeNotifier{
  
  Future<void> getLogin(BuildContext context, {required String email,required String pass}) async {
    final url = Uri.parse(AppConfig.baseUrl+"/login");
    try{
    final response = await  http.post(url,body: {
    "email":email,
    "password":pass
});
  LoginModel resModel = loginModelFromJson(response.body);
  if(resModel.access != null && resModel.access!.isNotEmpty){

    await AppUtils.saveData(key: AppConfig.ACCESSTOKEN, value: resModel.access);

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false,);
    
        AppUtils.showOntimeSnackbar(context: context,message:'Login Successful',backgroundColor: Colors.green );
        
  }else{
   AppUtils.showOntimeSnackbar(context: context,message:'Login Failed' );
  }
    if(response.statusCode == 200){}
    }catch(e){

    }
  }
}