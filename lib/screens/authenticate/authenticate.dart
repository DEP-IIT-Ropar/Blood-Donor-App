import 'package:flutter/material.dart';
import 'package:myapp/screens/authenticate/phoneverify.dart';
import 'package:myapp/screens/authenticate/register.dart';
import 'package:myapp/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    //return phoneverify();

    if (showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
    return phoneverify(toggleView: toggleView);
    }
  }
}
