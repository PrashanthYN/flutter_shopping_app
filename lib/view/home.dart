import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/model/product.dart';
import 'package:flutter_demo_two_login/repository/repository.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeState createState()=> HomeState();

}

class HomeState extends State<HomeScreen>{

  List<Product> productList=List();

  DataRepository dataRepository=DataRepository();

  @override
  void initState() {
    // TODO: implement initState
   dataRepository.getProducts();
    dataRepository.getProductListStream().listen((event) {
      productList.addAll(event);
      print("product list length:${productList.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:Text('OMAZON', style: TextStyle(color: Colors.black)),
       centerTitle: true,
       backgroundColor: Colors.white,
     ),

     body: Container(

       child: ListView.builder(
           itemCount: productList.length,
           itemBuilder: (context,index){
             return Center(
               child: Container(
                 margin: EdgeInsets.all(17),
                 width: MediaQuery.of(context).size.width,
                 child: Material(
                   elevation: 2,
                   color: Colors.white,

                   child:Padding(
                       padding: EdgeInsets.all(10),
                       child:    Row(

                     children: [
                       Image.network('https://picsum.photos/200',width: 100,height: 100),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(productList[index].title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                           Text(productList[index].description),

                         ],
                       ),
                     ],
                   ) )

               



                 ),
               ),
             );

       })

       /*child: ListView(
         children: [
            Container(
              child: Column(
                children: [

                ],
              ),
              color: Colors.yellow,
              height: 300,
            ),
           Container(
             color: Colors.red,
             height: 300,
           ),
           Container(
             color: Colors.green,
             height: 300,
           ),
           Container(
             height: 300,
             color: Colors.red,
           ),
           Container(
             height: 300,
             color: Colors.blue,
           ),


         ],
       ),*/

     ),
   );


  }

}