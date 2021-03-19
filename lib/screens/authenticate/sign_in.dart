import 'package:flutter/material.dart';
import 'package:myapp/screens/home/findonor.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/shared/constants.dart';
import 'package:myapp/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();



  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              'Sign In as blood donor',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: (){
                widget.toggleView();
              },
            )
          ],

        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Container(
            //padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
               // mainAxisAlignment: MainAxisAlignment.center,


                children: <Widget>[

                  //Text("Passwordless Authentication", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Moblie number'),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 20.0),
                  RaisedButton(
                    //width: double.infinity,
                    color: Colors.red,
                    child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),

                    // padding: EdgeInsets.all(16),
                    onPressed: () async {
                      final phone = _phoneController.text.trim();

                      dynamic result = await _auth.loginUser(phone, context);

                      // loginUser(phone, context);
                    },


                  ),
                  SizedBox(height: 20.0),
                  Text(
                      '\nsearching for a blood donor?\n',
                    style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600 , fontSize: 16.0),


                  ),
                  RaisedButton(
                    //width: double.infinity,

                    color: Colors.red,
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                    ),
                    // padding: EdgeInsets.all(16),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Findonor()
                      ));
                    },


                  ),
                ],

              ),
            ),
          ),
        )
    );
  }
}
