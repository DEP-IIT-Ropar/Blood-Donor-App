import 'package:flutter/material.dart';
import 'package:myapp/screens/authenticate/register.dart';
import 'package:myapp/screens/authenticate/sign_in.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/shared/constants.dart';
import 'package:myapp/shared/loading.dart';

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
 String location;

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white30,
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
                    decoration: textInputDecoration.copyWith(hintText: 'Blood Group'),
                  ),

                  SizedBox(height: 16,),

                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Location'),
                  ),

                  SizedBox(height: 20.0),

                  RaisedButton(
                    //width: double.infinity,

                      child: Text("Register"),
                      textColor: Colors.white,
                     // padding: EdgeInsets.all(16),
                      onPressed: () async {
                        final phone = _phoneController.text.trim();

                        dynamic result = await _auth.registerUser(phone, context);

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
