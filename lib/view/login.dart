import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  LoginState createState()=> LoginState();

}

class LoginState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {


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

        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[

              //email id textfield
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Id"
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Please enter email id';
                  }
                  /*if(value.length!=10){
                    return "PLease enter minimum 10 characters";
                  }*/
                  return null;
                }
              ),


              //email id textfield
              TextFormField(
                obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please enter password';
                    }
                    return null;
                  }
              ),

              Container(
                child: loginButton,
              )

            ],
          )
        )

      )
    );



  }


}