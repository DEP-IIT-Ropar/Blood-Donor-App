import 'package:flutter/material.dart';
import 'package:myapp/models/donor.dart';

class ReqTile extends StatelessWidget {

 // final Donor donor;
 // ReqTile({this.donor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0),

      child: Card(
       // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white,

            //backgroundImage: AssetImage(vamsi),
            backgroundImage: AssetImage('assets/O+.png'),
            //Text(donor.bloodgrp),

          ),
          title: Text(
              'Name: Vamsi',
            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 15.0),
          ),
          subtitle: Text(
              '\nBlood Type- O+\n\nMessage- Urgent blood required in Gandhi hospital\n\nDistance- 4 km',
            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 15.0),
          ),

        ),
      ),
    );
  }
}
