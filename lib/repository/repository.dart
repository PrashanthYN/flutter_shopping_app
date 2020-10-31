import 'dart:async';

import 'package:flutter_demo_two_login/model/user.dart';
import 'package:flutter_demo_two_login/network/network.dart';

class DataRepository{

  NetworkDao networkDao=NetworkDao();

  var streamController=StreamController<bool>.broadcast();

  var resgistrationStreamController=StreamController<bool>.broadcast();


/*  bool validateUser(String userId,String password){
    print("inside validation");
    if(userId=="a@b.com" && password=="12345"){
      return true;
    }else{
      return false;
    }
  }*/

  void validateUser(String userId,String password){
    print("inside validation");
    if(userId=="a@b.com" && password=="12345"){
      streamController.add(true);
    }else{
      streamController.add(false);

    }
  }

  Stream<bool> getLoginValidationStream(){
    return streamController.stream;
  }

  Stream<bool> getRegistrationStream(){
    return resgistrationStreamController.stream;
  }


  void registerUser(User user){
    networkDao.registerUser(user).then((value) => {
      //handle return value of future function
      resgistrationStreamController.add(value)
    });
  }


}

// 1 observable
//multiple observers