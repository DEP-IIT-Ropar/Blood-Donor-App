
import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/screens/home/findonor.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        actions:<Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.search),
            label: Text('Search'),
            onPressed: () async{
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Findonor()
              ));
            },
          )
        ],

      ),
    );
  }
}
