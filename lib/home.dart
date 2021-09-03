// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ai_nutrition/routegen.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Home extends StatelessWidget{
  // GoogleSignInAccount userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  // Home({
  //   Key key,
  //   @required this.userObj,
  // }) : super(key: key);


  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Nutriverse"),
        actions: [
          IconButton(
            onPressed: (){
              _googleSignIn.signOut().then((value) {
                        }).catchError((e) {});
              Navigator.of(context).pushNamed('/');
            }, 
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/1st.PNG"), fit: BoxFit.cover))
              ,
              // margin: EdgeInsets.only(top: 40),
              child: Center(
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top: 440)),
              ButtonTheme(
                minWidth: 200,
                height: 80,
                              child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: Color(0xeee6a5c2),
                  onPressed: (){
                  Navigator.of(context).pushNamed('/regre');
                }, 
                child: Text('Generate your Report',
                style: TextStyle(
                   fontSize: 20.0,
                   color: Color(0xfff8f8f8)
                 ),),
                ),
              ),
              Container(margin: EdgeInsets.only(top:30)),
              ButtonTheme(
                minWidth: 200,
                height: 80,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: Color(0xeee6a5c2),

                  onPressed: (){
                  Navigator.of(context).pushNamed('/doctor');
                },
                 child: Text('See Doctors List',
                 style: TextStyle(
                   fontSize: 20.0,
                   color: Color(0xfff4f4f4)
                 ),),
                 ),
              ),
            ],)
        ),
      ),
    );
  }
}