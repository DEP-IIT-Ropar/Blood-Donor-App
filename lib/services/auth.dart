import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/screens/authenticate/phoneverify.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/services/database.dart';

class AuthService{


  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user){

    return user != null ? User(uid: user.uid) : null;

  }

  //auth change user streaam

  Stream<User> get user{
    return _auth.onAuthStateChanged

        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async{

    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    } catch(e){

      print(e.toString());
      return null;

    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }




  //Register in with email and password
  /*Future registerWithEmailAndPassword(String email, String password) async{
    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      FirebaseUser user = result.user;
//create a new document for the user with this uid
      await DatabaseService(uid: user.uid).updateUserData('name', 'bloodgrp', 'location');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }*/


  //register with moblie number

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> registerUser(String phone, BuildContext context,String name, String bloodgrp, String country,String state, String city) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          return _userFromFirebaseUser(user);

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },

        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter your OTP-"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: () async {
                        try {
                          final code = _codeController.text.trim();
                          AuthCredential credential = PhoneAuthProvider
                              .getCredential(
                              verificationId: verificationId, smsCode: code);

                          AuthResult result = await _auth.signInWithCredential(
                              credential);

                          FirebaseUser user = result.user;
                          await DatabaseService(uid: user.uid).updateUserData(phone, name, bloodgrp, country, state, city);

                          return _userFromFirebaseUser(user);
                          //   }
                        } catch(e){
                          print(e.toString());
                          return null;
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }


// login with moblie number

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          return _userFromFirebaseUser(user);

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },

        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter your OTP-"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider
                            .getCredential(
                            verificationId: verificationId, smsCode: code);

                        AuthResult result = await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;
                        return _userFromFirebaseUser(user);

                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }




  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }


}
