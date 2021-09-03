import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ai_nutrition/routegen.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  // @override
  // void initState() {
  //   // super.initState();

  //   _requestPermission();
  // }

  // _requestPermission() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //   ].request();

  //   final info = statuses[Permission.storage].toString();
  //   print(info);
  //   // _toastInfo(info);
  // }

}


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool _isLoggedIn = false;
//   GoogleSignInAccount _userObj;
//   GoogleSignIn _googleSignIn = GoogleSignIn();
//   Uint8List _imageFile;

//   ScreenshotController screenshotController = ScreenshotController();
  
//   @override
//   void initState() {
//     super.initState();

//     _requestPermission();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Screenshot(
//         controller: screenshotController,
//         child: Text("Codesundar"))),
//       body: Container(
//         child: _isLoggedIn
//             ? Column(
//                 children: [
//                   // Image.network(_userObj.photoUrl),
//                   Text(_userObj.displayName),
//                   Text(_userObj.email),
//                   TextButton(
//                       onPressed: () {
//                         _googleSignIn.signOut().then((value) {
//                           setState(() {
//                             _isLoggedIn = false;
//                           });
//                         }).catchError((e) {});
//                       },
//                       child: Text("Logout"))
//                 ],
//               )
//             : Center(
//                 child: ElevatedButton(
//                   child: Text("Login with Google"),
//                   onPressed: () {
//                     screenshotController.capture(delay: Duration(milliseconds: 50)).then((Uint8List image) async{
//                       print("screenshot taken and saved");
//                       setState(() {
//                         _imageFile = image;                        
//                       });
//                       final result = await ImageGallerySaver.saveImage(image);
//                       print("screenshot taken and saved"+ "$result[0]");
//                     }).catchError((onError) {
//                       print(onError);
//                     });
//                     _googleSignIn.signIn().then((userData) {
//                       setState(() {
//                         _isLoggedIn = true;
//                         _userObj = userData;
//                       });
//                     }).catchError((e) {
//                       print(e);
//                     });
//                   },
//                 ),
//               ),
//       ),
//     );
//   }
//   _requestPermission() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();

//     final info = statuses[Permission.storage].toString();
//     print(info);
//     // _toastInfo(info);
//   }
// }