import 'dart:async';

class DataRepository{

  var streamController=StreamController<bool>.broadcast();

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

}

// 1 observable
//multiple observers