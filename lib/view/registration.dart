import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  RegistrationState createState() => RegistrationState();
}

class RegistrationState extends State<RegistrationScreen> {

 TextEditingController userNameTextController=TextEditingController();
 TextEditingController emailController=TextEditingController();
 TextEditingController phoneNumController=TextEditingController();
 TextEditingController passwordController=TextEditingController();

 void validateFormFields() {
    if(userNameTextController.text.isEmpty){

    }
 }

 @override
  void dispose() {
    userNameTextController.dispose();
    emailController.dispose();
    phoneNumController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    var registrationButton = Container(
        width: 150,
        child: RaisedButton(
            color: Colors.red, child: Text("Registration", style: TextStyle(color: Colors.white),), onPressed: () {
            validateFormFields();
        }));

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Container(

          color: Colors.white,
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //user name

                TextField(
                  controller: userNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      labelText:"User name"
                  ),
                ),

                //email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),

                //phone number
                TextField(
                    controller: phoneNumController,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                  ),
                ),

                //password
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: registrationButton)
              ],
            ),
          )),
    );
  }
}

