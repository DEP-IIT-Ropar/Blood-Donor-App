import 'package:flutter/material.dart';
import 'package:myapp/screens/authenticate/phoneverify.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/shared/constants.dart';
import 'package:myapp/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading =false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  String confirm_pass = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Register to Blood Donor'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() => email =val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ characters long' : null,
                  onChanged: (val){
                    setState(() => password =val);
                  }
              ),

              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Confirm password'),
                  obscureText: true,
                  validator: (val) => val!=password  ? 'Password do not match' : null,
                  onChanged: (val){
                    setState(() => confirm_pass =val);
                  }
              ),


              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(()=>loading=true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                    //return phoneverify();

                    if(result==null){
                      setState(()  {
                        error = ' Not a valid email\n '
                            '\t\t\t\t\t\t\t\t\t\tor\n'
                            ' Already registered with this email';
                        loading = false;
                      });
                    }


                     // Navigator.push(context, MaterialPageRoute(
                      //    builder: (context) => phoneverify()
                     // ));


                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),



    ),
    );
  }
}
