import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/apppreferences/apppreferences.dart';
import 'package:flutter_demo_two_login/view/home.dart';
import 'package:flutter_demo_two_login/view/login.dart';
import 'package:flutter_demo_two_login/view/registration.dart';

class WelcomeScreen extends StatelessWidget {

  AppPreferences appPreferences=AppPreferences();

  @override
  Widget build(BuildContext context) {

    appPreferences.isLoggedIn().then((value) => {
      if(value!=null && value){
       //replace this screen with new screen
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen()))
      }
    });

    var loginButton = Container(
        width: 150,
        child: RaisedButton(
            color: Colors.blue,
            child: Text("Login"),
            onPressed: () {
              // push new screen on top of existing screen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }));

    var registrationButton = Container(
        width: 150,
        child: RaisedButton(
            color: Colors.red,
            child: Text("Registration"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationScreen()));
            }));

    return Scaffold(
        body: Stack(
              children: [
                Image.asset("images/welcome_background.jpg"),
                Container(
                    padding: EdgeInsets.all(20),
                    color: Color.fromRGBO(10, 10, 10, 1.5),
                    child: Center(
                        child: Column(children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Text('Omazon',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                          fontSize: 28, fontWeight: FontWeight.bold)))),
                          Expanded(
                              flex: 4,
                              child: Container(
                                  child: Text(
                                      'Welcome, You can shop everything here with exclusive offers and best quality',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 24, fontWeight: FontWeight.w300)))),
                          Expanded(
                              flex: 1,
                              child:
                              Container(child: ButtonBar(mainAxisSize: MainAxisSize.min,
                                  //add multiple buttons horizontally
                                  children: <Widget>[loginButton, registrationButton])))
                        ])))
              ]
            )
     );
  }
}
