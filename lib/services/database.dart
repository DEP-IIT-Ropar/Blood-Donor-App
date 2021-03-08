import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection ref

  final CollectionReference donorCollection = Firestore.instance.collection('userInfo');

  Future updateUserData(String phone ,String name,String bloodgrp, String country, String state, String city) async {

    return await donorCollection.document(uid).setData({
      'phone': phone
     'name' : name,
     'bloodgrp' : bloodgrp,
     'Country' : country,
      'State': state,
      'city': city,

    });

  }



}
