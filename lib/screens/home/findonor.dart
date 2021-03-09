import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/donor.dart';
import 'package:myapp/screens/home/donor_list.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Findonor extends StatefulWidget {

  final String uid;
  Findonor({this.uid});
  //collection ref

  final CollectionReference donorCollection = Firestore.instance.collection('userInfo');




  @override
  _FindonorState createState() => _FindonorState();
}

class _FindonorState extends State<Findonor> {

  String bloodgrp;
  String city;
  String state;

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Donor>>.value(
      value: DatabaseService().donors,
      child: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          title: Text('Find donor'),
          backgroundColor: Colors.red[400],
          elevation: 0.0,


        ),




        body: DonorList(),
      ),
    );
  }
}
