import 'package:flutter/material.dart';

class Doctor extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's List"),
      ),
      body: SingleChildScrollView(
              child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset('images/doctor1.jpeg'),
              Container(margin: EdgeInsets.only(bottom: 10.0)),
              Image.asset('images/doctor2.jpeg'),
            ],),
        ),
      )
      ,
    );
  }
}
