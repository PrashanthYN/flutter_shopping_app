import 'dart:convert';

class User{

  String id;
  String user_name;
  String user_password;
  String email_id;
  String mobile_number;

 /* User(this.id, this.user_name, this.user_password, this.email_id,
      this.mobile_number);
*/
  User({this.id, this.user_name, this.user_password, this.email_id,
      this.mobile_number});




  //Example function for json encoding decoding
  void convertUserStringToJson(){
    String jsonString="{\"id\": \"1\",\"user_name\": \"user_name 1\",\"user_password\": \"user_password 1\",\"email_id\": \"email_id 1\",\"mobile_number\": \"mobile_number 1\"}";

    //converting string to json object
    var userJsonObject=jsonDecode(jsonString);
    print(userJsonObject);

    //accessing json value
    var user_email=userJsonObject['email_id'];
    print(user_email);

    //convert json object into json string
    var newJsonString=jsonEncode(userJsonObject);
    print(newJsonString);

  }

}