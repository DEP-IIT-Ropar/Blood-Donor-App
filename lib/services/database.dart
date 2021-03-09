import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/models/donor.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection ref

  final CollectionReference donorCollection = Firestore.instance.collection('userInfo');


  Future updateUserData(String phone ,String name,String bloodgrp, String country, String state, String city) async {

    return await donorCollection.document(uid).setData({
      'phone': phone,
      'name' : name,
      'bloodgrp' : bloodgrp,
      'Country' : country,
      'State': state,
      'city': city,

    });

  }

  //brew list from snapshot
  List<Donor> _donorListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Donor(

        name: doc.data['name'] ,
        bloodgrp: doc.data['bloodgrp'],
        city: doc.data['city'],
        state: doc.data['state'],

      );
    }
    ).toList();
  }


Stream<List<Donor>> get donors{
    return donorCollection.snapshots()
    .map(_donorListFromSnapshot);
}


}
