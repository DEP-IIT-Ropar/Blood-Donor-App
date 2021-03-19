import 'package:flutter/material.dart';
import 'package:myapp/models/donor.dart';

class DonorTile extends StatelessWidget {

  final Donor donor;
  DonorTile({this.donor});

 // String vamsi = 'assets/O+.png' ;

  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: EdgeInsets.only(top: 8.0),

      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(

          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white,

           //backgroundImage: AssetImage(vamsi),
            backgroundImage: AssetImage('assets/O+.png'),
            //Text(donor.bloodgrp),

          ),
          title: Text(donor.name),
          subtitle: Text('Blood group-${donor.bloodgrp}'),

        ),
      ),
    );
  }


}
