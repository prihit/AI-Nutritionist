import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  final formKey = GlobalKey<FormState>();
  double age;
  double height;
  double weight;
  double gender = 1.0;
  double sleep;
  double af = 1.2;
  double lifestyle = 1.0;
  double hd = 0.0;
  double bp;
  double sugar;
  double alcohol = 0.0;
  double smok = 0.0;
  double water_intake;
  double kcal;
  double iron;
  double calcium;
  double vitamind;
  double carbohydrates;
  double protein;
  double fat;
  double bmi;
  String diet;

@override
  void initState(){
    super.initState();
    loadModel();
  }

  Widget build(context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Health Details"),
        ),
    body:   SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ageField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              heightField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              weightField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              genderField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              sleepField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              actiField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              lfField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              hdField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              bpField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              sugarField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              watField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              smokField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              alcoField(),
              Container(margin: EdgeInsets.only(bottom: 25.0)),
              submitButton(), 
            ],
          )
        ),
      ),
    )
    );
  }

  Widget ageField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your Age",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        age = double.parse(value);
      },
    );
  }

  Widget heightField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your Height in cms.",
        hintText: "180",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        height = double.parse(value);
      },
    );
  }

  Widget weightField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your Weight in kgs.",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        weight = double.parse(value);
      },
    );
  }

  Widget genderField(){
    return DropDownFormField(
      titleText: 'Gender',
      hintText: 'Please Choose one',
      value: gender,
      onSaved: (value){
        setState((){
          gender = value;
        });
      },
      onChanged: (value){
        setState((){
          gender = value;
        });
      },
      dataSource: [
        {
          "display" : "Male",
          "value" : 0.0
        },
        {
          "display" : "Female",
          "value" : 1.0
        },
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget sleepField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter Sleeping Hours",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        sleep = double.parse(value);
      },
    );
  }

  // Widget actiField(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Enter Activity Factor ( 1.2 or 1.5 or 1.8 )",
  //       hintText: "1.2 for Little or No Exercise | 1.5 for light Exercise or sports 1-3 days a week | 1.8 for sports 3-5 days a week",
  //     ),
  //     keyboardType: TextInputType.number,
  //     onSaved: (String value){
  //       af = double.parse(value);
  //     },
  //   );
  // }

  // Widget lfField(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Enter LifeStyle Index: 0 or 1 or 2",
  //     ),
  //     keyboardType: TextInputType.number,
  //     onSaved: (String value){
  //       lifestyle = double.parse(value);
  //     },
  //   );
  // }

  Widget actiField(){
    return DropDownFormField(
      titleText: 'Activity',
      hintText: 'Please Choose one',
      value: af,
      onSaved: (value){
        setState((){
          af = value;
        });
      },
      onChanged: (value){
        setState((){
          af = value;
        });
      },
      dataSource: [
        {
          "display" : "Little or no exercise",
          "value" : 1.2
        },
        {
          "display" : "light exercise/sports 1-3 days a week",
          "value" : 1.5
        },
        {
          "display" : "moderate exercise/sports 3-5 days a week",
          "value" : 1.8
        }
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget lfField(){
    return DropDownFormField(
      titleText: 'Life Style',
      hintText: 'Please Choose one',
      value: lifestyle,
      onSaved: (value){
        setState((){
          lifestyle = value;
        });
      },
      onChanged: (value){
        setState((){
          lifestyle = value;
        });
      },
      dataSource: [
        {
          "display" : "Desk Job: Very less physical activity",
          "value" : 0.0
        },
        {
          "display" : "Semi-Active Job: Moderate physical activity ",
          "value" : 1.0
        },
        {
          "display" : "Active Job: Continous physical work",
          "value" : 2.0
        }
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget hdField(){
    return DropDownFormField(
      titleText: 'Do you have a Heart Disease ?',
      hintText: 'Please Choose one',
      value: hd,
      onSaved: (value){
        setState((){
          hd = value;
        });
      },
      onChanged: (value){
        setState((){
          hd = value;
        });
      },
      dataSource: [
        {
          "display" : "Yes",
          "value" : 1.0
        },
        {
          "display" : "No",
          "value" : 0.0
        },
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget bpField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your Systolic Blood Pressure.",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        bp = double.parse(value);
      },
    );
  }

  Widget sugarField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your Sugar Level",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        sugar = double.parse(value);
      },
    );
  }
  
  Widget alcoField(){
    return DropDownFormField(
      titleText: 'Do you consume alcohol ?',
      hintText: 'Please Choose one',
      value: alcohol,
      onSaved: (value){
        setState((){
          alcohol = value;
        });
      },
      onChanged: (value){
        setState((){
          alcohol = value;
        });
      },
      dataSource: [
        {
          "display" : "Yes",
          "value" : 1.0
        },
        {
          "display" : "No",
          "value" : 0.0
        },
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget smokField(){
    return DropDownFormField(
      titleText: 'Do you Smoke ?',
      hintText: 'Please Choose one',
      value: smok,
      onSaved: (value){
        setState((){
          smok = value;
        });
      },
      onChanged: (value){
        setState((){
          smok = value;
        });
      },
      dataSource: [
        {
          "display" : "Yes",
          "value" : 1.0
        },
        {
          "display" : "No",
          "value" : 0.0
        },
      ],
      textField: 'display',
      valueField: "value",
    );
  }

  Widget watField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Enter your daily Consumption of Water (in lts)",
      ),
      keyboardType: TextInputType.number,
      onSaved: (String value){
        water_intake = double.parse(value);
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text("Submit"),
      color: Colors.green,
      textColor: Colors.white,
      onPressed: () {
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          setState(() {
            performOp();
          });
        };
      },
      );
  }

  Interpreter interpreter;
  loadModel() async{
    interpreter = await Interpreter.fromAsset('ainutri.tflite');
  }

  performOp(){
    // For ex: if input tensor shape [1,5] and type is float32
  var input = [age, gender, weight, height, sleep, af, lifestyle, hd, bp, sugar, alcohol, smok, water_intake];

  // if output tensor shape [1,2] and type is float32
  var output = List(1*7).reshape([1,7]);

  // inference
  interpreter.run(input, output);
  print(output);

  // print the output
  setState(() { 
    kcal = double.parse(output[0][0].toStringAsFixed(2));
    iron = double.parse(output[0][1].toStringAsFixed(2));
    calcium = double.parse(output[0][2].toStringAsFixed(2));
    vitamind = double.parse(output[0][3].toStringAsFixed(2));
    carbohydrates = double.parse(output[0][4].toStringAsFixed(2));
    protein = double.parse(output[0][5].toStringAsFixed(2));
    fat = double.parse(output[0][6].toStringAsFixed(2));
    bmi = (weight)*(10000.00)/(height*height);
    bmi = double.parse(bmi.toStringAsFixed(2));
    if(kcal > 2100.00 && kcal < 2900.00){
      diet = 'diet2';
    }
    else if(kcal < 2100){
      diet = 'diet1';
    }
    else{
      diet = 'diet3';
    }
    Navigator.of(context).pushNamed('/report', arguments: data(kcal, iron, calcium, vitamind, carbohydrates, fat, protein, bmi, water_intake, sleep, diet));
   });
  }
}

class data{
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

  data(this.kcal,this.iron,this.calcium,this.vitd,this.carbo,this.fat,this.pro,this.bmi,this.wat,this.sle,this.diet);
}