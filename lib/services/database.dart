import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('userInfo');

  Future<void> updateUserData(String phone, String group) async {
    return await brewCollection.document(uid).setData({
      'phone': phone,
      'group': group,

    });
  }

}