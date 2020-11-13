import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_two_login/model/product.dart';
import 'package:flutter_demo_two_login/repository/repository.dart';
import 'package:flutter_demo_two_login/view/GridViewScreen.dart';

import 'ListScreen.dart';
import 'future_builder_example.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeState createState()=> HomeState();

}

class HomeState extends State<HomeScreen>{

  ListScreen listScreen= ListScreen();

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('OMAZON'),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.message),text: 'List example'),
            Tab(icon: Icon(Icons.message),text: 'Grid example'),
            Tab(icon: Icon(Icons.message),text: 'Future builder')
          ],
        ),
      ),
      body: TabBarView(
       children: <Widget>[
         ListScreen(),
         GridViewScreen(),
         SampleFutureBuilder()
       ],

      )
    ));

  }




}



//Implement tabs

// 1. Tab controller
// 2. tabs
// 3. tab body view




//Material effect
/*
Container(
decoration: BoxDecoration(

),
width: double.infinity,
margin: EdgeInsets.all(20),
child: Material(
elevation: 5,
color: Colors.white,
child: Padding(
padding: EdgeInsets.all(10),
child: Text('TEST'),
)
,
),
),*/
