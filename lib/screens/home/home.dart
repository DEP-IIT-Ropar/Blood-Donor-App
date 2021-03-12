
import 'package:flutter/material.dart';
import 'package:myapp/screens/home/user_form.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/screens/home/findonor.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showUserPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
       padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 60.0),
       child: UserForm(),
        );
      });
    }

    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: Text(
            'HOME',
          style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600 , fontSize: 10.0),
        ),

        backgroundColor: Colors.red[400],
        elevation: 0.0,
        actions:<Widget> [

          FlatButton.icon(

            icon: Icon(Icons.person),
            label: Text('User'),
            onPressed: () => _showUserPanel(),

          ),

          FlatButton.icon(
            icon: Icon(Icons.search),
            label: Text('Search'),
            onPressed: () async{
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Findonor()
              ));
            },
          ),


          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          ),


        ],

      ),
    );
  }
}
