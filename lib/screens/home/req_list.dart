import 'package:flutter/material.dart';
import 'package:myapp/models/donor.dart';
import 'package:myapp/screens/home/req_tile.dart';
import 'package:provider/provider.dart';

class ReqList extends StatefulWidget {
  @override
  _ReqListState createState() => _ReqListState();
}

class _ReqListState extends State<ReqList> {
  @override
  Widget build(BuildContext context) {

 //   final donors = Provider.of<List<Donor>>(context) ?? [];

    return ListView.builder(

      itemCount: 5,
      itemBuilder: (context,index){
        return ReqTile();
      },

    );
  }
}
