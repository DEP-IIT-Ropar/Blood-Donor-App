import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection ref

  final CollectionReference donorCollection = Firestore.instance.collection('donors');

  Future updateUserData(String name ,String bloodgrp, String location) async {

    return await donorCollection.document(uid).setData({
     'name' : name,
     'bloodgrp' : bloodgrp,
     'location' : location,

    });

  }



}