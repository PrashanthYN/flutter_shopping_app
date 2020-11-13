import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/model/product.dart';
import 'package:flutter_demo_two_login/repository/repository.dart';

class GridViewScreen extends StatefulWidget{
  @override
   GridViewState createState() => GridViewState();
}

class GridViewState extends State<GridViewScreen>{

  List<Product> productList=List();

  DataRepository dataRepository=DataRepository();

  bool listLoaded=false;

  @override
  void initState() {
    // TODO: implement initState
    dataRepository.getProducts();
    dataRepository.getProductListStream().listen((event) {
      productList.addAll(event);
      setState(() {
        listLoaded=true;
      });
      print("product list length:${productList.length}");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: listLoaded? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
             mainAxisSpacing: 8,
            childAspectRatio:100/150,
            children: List.generate(productList.length, (index){

              //return a grid view child
              return Center(
                child: Container(
                  width: double.infinity,
                  child: Material(
                      elevation: 2,
                      color: Colors.white,
                      child:Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Image.network('https://picsum.photos/200',width: 150,height: 150),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(productList[index].title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 5),
                                      Text(productList[index].description),
                                      SizedBox(height: 20),
                                      Text("${productList[index].price}. ${productList[index].price_type}"),
                                    ],
                                  ),
                                ],
                              ),

                              Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(icon: Icon(Icons.add_box),iconSize: 40 ,color: Colors.deepOrange,onPressed:(


                                  ){
                                }
                              )
                              )
                            ],
                          )


                       )
                  ),
                ),
              );

            }
            )

          ) : Center(
              child: CircularProgressIndicator()
          )

      ),
    );
  }

}