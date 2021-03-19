import 'package:flutter/material.dart';

import 'package:myapp/screens/authenticate/sign_in.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/shared/constants.dart';
import 'package:myapp/shared/loading.dart';
import 'package:restcountries/restcountries.dart';


class phoneverify extends StatefulWidget {

  final Function toggleView;
  phoneverify({this.toggleView});

  @override
  _phoneverifyState createState() => _phoneverifyState();
}

class _phoneverifyState extends State<phoneverify> {

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String bloodgrp;

  String phone;

  String name;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final List<String> bloodgrps = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text('Register as blood donor'),
    backgroundColor: Colors.red[400],
    elevation: 0.0,
    actions: <Widget>[
    FlatButton.icon(
    icon: Icon(Icons.person),
    label: Text('Sign In'),
    onPressed: (){
    widget.toggleView();
    },
    )
    ],

    ),
    body: SingleChildScrollView(
    child: Container(
    padding: EdgeInsets.all(32),
    child: Form(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,


    children: <Widget>[

    //Text("Passwordless Authentication", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

    SizedBox(height: 16,),

    TextFormField(
    decoration: textInputDecoration.copyWith(hintText: 'Moblie number'),
    controller: _phoneController,


    ),

    SizedBox(height: 16,),

    TextFormField(
    decoration: textInputDecoration.copyWith(hintText: 'Name'),
    validator: (val) => val.isEmpty ? 'Enter your Name' : null,
    onChanged: (val){
    setState(() => name =val);
    }
    ),


    SizedBox(height: 16,),

    DropdownButtonFormField(
      //value: _ ,
      decoration: textInputDecoration.copyWith(hintText: 'Blood Group'),
      items: bloodgrps.map((bloodgrp){
        return DropdownMenuItem(
         value: bloodgrp,
          child: Text('$bloodgrp'),
        );
      } ).toList(),
        validator: (val) => val.isEmpty ? 'Select your blood group' : null,
        onChanged: (val){
          setState(() => bloodgrp =val);
        }
    ),






    SizedBox(height: 20.0),

    RaisedButton(
    //width: double.infinity,

    child: Text(
      'Register',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),

    // padding: EdgeInsets.all(16),
    onPressed: () async {
    final phone = _phoneController.text.trim();

    dynamic result = await _auth.registerUser(phone,context,name,bloodgrp);

    // loginUser(phone, context);
    },
    color: Colors.red,


    )
    ],
    ),
    ),
    ),
    )
    );
    }

    }
