import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/services/database.dart';
import 'package:myapp/shared/constants.dart';
import 'package:myapp/shared/loading.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> bloodgrps = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  final AuthService _auth = AuthService();

  String _currentName;
  String _currentBloodgrp;
  String _currentPhone;
  String _currentState;
  String _currentCountry;
  String _currentCity;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
         UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  Text(
                    'Update your profile settings\n',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),




                  SizedBox(height: 20.0),
                  Text(
                    'Name',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    initialValue: userData.name,
                      decoration: textInputDecoration.copyWith(hintText: 'Name'),
                      validator: (val) => val.isEmpty ? 'Enter your Name' : null,
                      onChanged: (val){
                        setState(() =>  _currentName =val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  Text(
                    'Blood Group',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField(
                    //value: _ ,
                      decoration: textInputDecoration.copyWith(hintText: 'Blood Group'),
                      value: _currentBloodgrp ?? userData.bloodgrp,
                      items: bloodgrps.map((bloodgrp){
                        return DropdownMenuItem(
                          value: bloodgrp,
                          child: Text('$bloodgrp'),
                        );
                      } ).toList(),
                      validator: (val) => val.isEmpty ? 'Select your blood group' : null,
                      onChanged: (val){
                        setState(() => _currentBloodgrp =val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  Text(
                    'Country',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                      initialValue: userData.country,
                      decoration: textInputDecoration.copyWith(hintText: 'country'),
                      validator: (val) => val.isEmpty ? 'Enter country' : null,
                      onChanged: (val){
                        setState(() => _currentCountry =val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  Text(
                    'State',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                      initialValue: userData.state,
                      decoration: textInputDecoration.copyWith(hintText: 'state'),
                      validator: (val) => val.isEmpty ? 'Enter state' : null,
                      onChanged: (val){
                        setState(() => _currentState=val);
                      }
                  ),

                  SizedBox(height: 20.0),
                  Text(
                    'City',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                      initialValue: userData.city,
                      decoration: textInputDecoration.copyWith(hintText: 'city'),
                      validator: (val) => val.isEmpty ? 'Enter city' : null,
                      onChanged: (val) {
                        setState(() => _currentCity = val);
                      }
                  ),

                  RaisedButton(

                    color: Colors.red,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentPhone ?? userData.phone,
                          _currentName ?? userData.name,
                          _currentBloodgrp ?? userData.bloodgrp,
                          _currentCountry ?? userData.country,
                          _currentState ?? userData.state,
                          _currentCity ?? userData.city
                        );
                        Navigator.pop(context);
                      }

                    } ,

                  ),

                ],
              ),
            ),
          );
        }else{
          return Loading();
        }


      }
    );
  }
}