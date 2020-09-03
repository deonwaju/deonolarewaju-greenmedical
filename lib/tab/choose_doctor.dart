import 'package:deon_greenmed/screens/doctors/GpDocListScreen.dart';
import 'package:flutter/material.dart';

class SelectDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    final tabController = new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          toolbarHeight: 238,
          automaticallyImplyLeading: false,
          leading: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,

          title: SafeArea(
            minimum: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: new Text("Choose \n a doctor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
              ),
            ),

          ),
          bottom: new TabBar(
              labelColor: Colors.black ,
              indicatorColor: Colors.green,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),

              tabs: [
                new Tab(text: "GP"),
                new Tab(text: "Specialist"),
                new Tab(text: "Dentist",),
                new Tab(text: "Therapist",)
              ]),
        ),
        body: new TabBarView(
            children: [
              new GpDocListScreen(),
              new GpDocListScreen(),
              new GpDocListScreen(),
              new GpDocListScreen(),
            ]
        ),
      ),
    );
    return new MaterialApp(
        home: tabController
    );
  }
}

