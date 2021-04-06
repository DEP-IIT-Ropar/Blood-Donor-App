import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/models/donor.dart';
import 'package:myapp/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection ref

  final CollectionReference donorCollection = Firestore.instance.collection('userInfo');


  Future updateUserData(String phone ,String name,String bloodgrp) async {

    return await donorCollection.document(uid).setData({
      'phone': phone,
      'name' : name,
      'bloodgrp' : bloodgrp,


    });

  }

  //brew list from snapshot
  List<Donor> _donorListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Donor(

        name: doc.data['name'] ,
        bloodgrp: doc.data['bloodgrp'],



        phone: doc.data['phone'],

      );
    }
    ).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      bloodgrp: snapshot.data['bloodgrp'],


    );
  }


Stream<List<Donor>> get donors{
    return donorCollection.snapshots()
    .map(_donorListFromSnapshot);
}

Stream<UserData> get userData{

    return donorCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
}

}
