import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/donor.dart';
import 'package:myapp/screens/home/donor_tile.dart';
import 'package:provider/provider.dart';

class DonorList extends StatefulWidget {
  @override
  _DonorListState createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  @override
  Widget build(BuildContext context) {

    final donors = Provider.of<List<Donor>>(context) ?? [];
    //print(donors.documents);
    /*donors.forEach((donor) {

      print(donor.name);
      print(donor.bloodgrp);
      print(donor.city);
    });*/


    return ListView.builder(

      itemCount: donors.length,
      itemBuilder: (context,index){
        return DonorTile(donor: donors[index]);
      },

    );
  }
}
