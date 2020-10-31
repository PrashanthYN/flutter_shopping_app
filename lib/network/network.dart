import 'dart:convert';

import 'package:flutter_demo_two_login/model/user.dart';
import 'package:flutter_demo_two_login/network/config.dart';
import 'package:http/http.dart' as http;

class NetworkDao {

  Future<bool> registerUser(User user) async {
    var response = await http.post(ApiURL.userRegistration,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //pass more oAuth tokens if required in header
        },
        body: jsonEncode(<String, String>{
          "user_name": user.user_name,
          "user_password": user.user_password,
          "email_id": user.email_id,
          "mobile_number": user.mobile_number
        }));

    //add this function to check status code of response, If less than or equal to 200 its a success
   /* if(response.statusCode==200){

    }*/

    print(response.statusCode);
    print(response.body);

    var responseJson= jsonDecode(response.body);
    var statusString=responseJson['status'];

    if(statusString=="success"){
      return true;
    }else{
      return false;
    }
  }
}
