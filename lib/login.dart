// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ai_nutrition/routegen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';


class Login extends StatefulWidget{
  @override
  LoginState createState() => LoginState(); 
}

class LoginState extends State<Login>{
  GoogleSignInAccount userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();

    _requestPermission();
  }

  @override
  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
    // _toastInfo(info);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff92e512),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40.0),
              child: Container(
                margin: EdgeInsets.only(top: 80.0),
                child: Image.asset('images/logonew2.png'))),
            ButtonTheme(
              minWidth: 200,
              height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: Color(0xffffffff),
                onPressed: (){
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      userObj = userData;
                      Navigator.of(context).pushNamed('/home');
                  });
              }).catchError((e) {
                 print(e);
               });
                },
                 child: Text("Sign in with Google",
                 style: TextStyle(
                   fontSize: 20.0,
                   color: Color(0xff92e512)
                 ),),
                 ),
            ),
          ]
        ),
      ),
    );
  }
}