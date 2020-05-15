import 'package:flashchat/screens/roundedbutton.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  bool iswaiting=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                              child: Hero(
                  tag:'logo',
                    child: Container(
        height: 150.0,
        child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress, 
                onChanged: (value) {
        //Do something with the user input.
        if(value!=null){email=value;}
        
                },
                decoration: kTextfieldDecoration.copyWith(
        hintText: ' Email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                 obscureText: true,
                onChanged: (value) {
        //Do something with the user input.
        if(value!=null){  password=value;}
      
                },
                decoration: kTextfieldDecoration.copyWith(
        hintText: ' Password'
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Roundedbutton(
                title: 'Log In',
                color:Colors.lightBlueAccent,
                onPressed: () async{
        try{  
          
             final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
             
             if(user!=null){
              
               Navigator.pushNamed(context, ChatScreen.id);
             }
        }catch(e){

        }
                },
                
              ), 

            ],
          ),
      ),
    );
  }
}
