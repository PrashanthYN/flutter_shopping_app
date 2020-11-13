import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{

  //Reading back from shared preference memory
  Future<bool> isLoggedIn() async{
    SharedPreferences preference= await SharedPreferences.getInstance();
    preference.getBool("logged_in");
    return true;
  }

  Future<String> getUserName() async{
    SharedPreferences preference= await SharedPreferences.getInstance();
   var userName= preference.getString("user_name");
    return userName;
  }

  //writing values into shared preference memory
  Future<bool> setLoggedIn(String userName) async{
    SharedPreferences preference= await SharedPreferences.getInstance();
    preference.setBool("logged_in", true);
    preference.setString("user_name", userName);
    return true;
  }

}