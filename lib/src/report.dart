import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Report extends StatelessWidget{
  ScreenshotController screenshotController = ScreenshotController();
  final double kcal;
  final double iron;
  final double calcium;
  final double vitd;
  final double carbo;
  final double fat;
  final double pro;
  final double bmi;
  final double wat;
  final double sle;
  final String diet;

  Report({ Key key,
    @required this.kcal,
    @required this.iron,
    @required this.calcium,
    @required this.vitd,
    @required this.carbo,
    @required this.fat,
    @required this.pro,
    @required this.bmi,
    @required this.wat,
    @required this.sle,
    @required this.diet,
  }) : super(key: key);

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Health Report"),
      ),
      body: Container(
          margin: EdgeInsets.all(25.0),
          child: ListView(children: <Widget>[ 
          Center(  
          child: Text(  
            'Health-Chart',  
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
          )),  
          DataTable(  
        columns: [  
            DataColumn(label: Text(  
                'feature',  
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
            )),  
            DataColumn(label: Text(  
                'value',  
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
            )),  
        ],  
        rows: [  
            DataRow(cells: [  
              DataCell(Text('BMI')),  
              DataCell(Text('$bmi kg/m2')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Kcal')),  
              DataCell(Text('You need $kcal kcal')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Carbohydrates')),  
              DataCell(Text('You need $carbo grams')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Protein')),  
              DataCell(Text('You need $pro grams')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Fats')),  
              DataCell(Text('You need $fat grams')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Iron')),  
              DataCell(Text('You need $iron milligrams')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Calcium')),  
              DataCell(Text('You need $calcium milligrams')),  
            ]),
            DataRow(cells: [  
              DataCell(Text('Vitamin - D')),  
              DataCell(Text('You need $vitd milligrams')),  
            ]),
        ]), 
        Container(margin: EdgeInsets.only(bottom: 25.0)),
        Screenshot(
          controller: screenshotController,
          child: Card(child: Image.asset("images/$diet.png"))),
        Center(child: ElevatedButton(
          child: Text("Back To Home Page !"),
          onPressed: () { Navigator.of(context).pushNamed('/home');
          }
        )),
        Center(child: ElevatedButton(
          child: Text("Save this Chart"),
          onPressed: _takeScreenshot,
        )),
        ])
    ));
  }

  void _takeScreenshot() async{
    final imageFile = await screenshotController.capture();
    final result = await ImageGallerySaver.saveImage(imageFile);
    Fluttertoast.showToast(msg: "Chart saved in pictures folder of your Device's Memory",fontSize: 20.0, toastLength: Toast.LENGTH_LONG);
    // Share.shareFiles([imageFile.path]);

  }


}