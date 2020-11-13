import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/apppreferences/apppreferences.dart';
import 'package:flutter_demo_two_login/model/user.dart';
import 'package:flutter_demo_two_login/repository/repository.dart';

import 'home.dart';


class LoginScreen extends StatefulWidget{
  @override
  LoginState createState()=> LoginState();

}

class LoginState extends State<LoginScreen>{

   String userEmail;
   String userPassword;
   DataRepository dataRepository= new DataRepository();

   bool _process_busy=false;


  @override
  void initState() {
    super.initState();
    //call login validation observe method
    listenLoginValidationResponse();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //sample json string
    String jsonString="{\"id\": \"1\",\"user_name\": \"user_name 1\",\"user_password\": \"user_password 1\",\"email_id\": \"email_id 1\",\"mobile_number\": \"mobile_number 1\"}";

    //Convert json to user instance
    User user=User.fromJson(jsonDecode(jsonString));
    print(user.email_id);


    //1. Create a form with global key
    final _loginFormKey=GlobalKey<FormState>();

    //3. create a button to validate and submit the form
    var loginButton = Container(
        width: 150,
        child: RaisedButton(
            color: Colors.green, child: Text("Login", style: TextStyle(color: Colors.white),), onPressed: () {

        //if validation is correct , it returns true value
        if(_loginFormKey.currentState.validate()){
          print("form fields are validated");

          setState(() {
            _process_busy=true;
          });

          _loginFormKey.currentState.save();
          validateUserFromAPI(userEmail, userPassword);
          //jump to
        }
        }));

  //2.add a textform field in Form widget with validation logic
    return Form(
      key: _loginFormKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),

        body: _process_busy? Center(child: CircularProgressIndicator()) :
        Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              //email id textfield
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Id"
                ),
                validator: validateEmail,
                onSaved: (value){
                  userEmail=value;
                },
              ),

              SizedBox(height: 20),

              //email id textfield
              TextFormField(
                obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  validator: validatePassword,
                onSaved: (value){
                  userPassword=value;
                }
              ),
              SizedBox(height: 20),
              Container(
                child: loginButton,
              )

            ],
          )
        )

      )
    );
  }


  //validate password
  String validatePassword(String value){
    if(value.length <3){
      return "Password length must be more than 3";
    }else{
      return null;
    }
  }


  //validate email for a pattern
  String validateEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void validateUserFromAPI(String userEmail, String userPassword) {
    print("Validating user from API $userEmail $userPassword");
    /*bool status=dataRepository.validateUser(userEmail, userPassword);
    print (status)
    */

    //call validation. and validation response will be listening in stream observer function
    dataRepository.validateUser(userEmail, userPassword);
  }

  //listen to validation response
  void listenLoginValidationResponse() {
    StreamSubscription subscription= dataRepository.getLoginValidationStream().listen((event) {
      print("observer 1");
      print(event);

      setState(() {
        _process_busy=false;
      });

      //login event, true or false
      if(event){

       AppPreferences().setLoggedIn(userEmail).then((value) => {
         if(value){
           //navigating to home screen.
           Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => HomeScreen()))
         }

       });
      }

    });

    //add this line to cancel the subscrption
    //subscription.cancel();
  }



}


// view

// viewmodel

//model




//repository

// Local storage (SQLite) / Network (API)


//ObserverPattern :  Obsevable  - which emits data , events
//Observer is a class which will listen to emitted data.