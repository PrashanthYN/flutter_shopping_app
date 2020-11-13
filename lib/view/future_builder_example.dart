import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/model/product.dart';
import 'package:flutter_demo_two_login/network/network.dart';

class SampleFutureBuilder extends StatefulWidget{
  @override
  SampleFutureBuilderState createState() {
    return SampleFutureBuilderState();
  }

}

class SampleFutureBuilderState extends State<SampleFutureBuilder>{

 Future<List<Product>> productFuture;

 @override
  void initState() {
    // TODO: implement initState
    productFuture=NetworkDao().getProductList();
  }

 @override
  Widget build(BuildContext context) {



    return FutureBuilder(
        //Future function which returns some Future result
        future: productFuture,
        // future: NetworkDao().getProductList(),

        //build widget from obtainer Future snapshot(Data container)
        builder: (context,snapshot){
          return  (snapshot.hasData)? Center(child:Text(" Total products length:${((snapshot.data) as List).length}")): Center(child: CircularProgressIndicator());
        });
  }



  //What is FutureBuilder

//  its Future + Builder

// Future : This a time based operation that returns success or failure

//Builder : Flutter operation to return a widget
}