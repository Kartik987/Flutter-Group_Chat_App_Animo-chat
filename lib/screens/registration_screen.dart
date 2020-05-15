import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/roundedbutton.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
   static const String id='registeration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth= FirebaseAuth.instance;
 String email;
 String password;
 
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
                keyboardType: TextInputType.emailAddress,   // to change keyboard type so that it opensspecial keyboard for email
                onChanged: (value) {
        //Do something with the user input.
       if(value!=null){ email=value;}            // getting user input into email variable
        
                },
                decoration: kTextfieldDecoration.copyWith(
        hintText: ' Email'
                
                )
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                 textAlign: TextAlign.center,
                 obscureText: true,
                onChanged: (value) {
        //Do something with the user input.
         if(value!=null){ password=value;}         // getting user input into a password variable
                },
                decoration:kTextfieldDecoration.copyWith(
        hintText:' Password'
                )
              ),
              SizedBox(
                height: 24.0,
              ),
              Roundedbutton(
                title: 'Register',
                color:Colors.blueAccent,
                onPressed: () async{
        try{
               final newUser=  await _auth.createUserWithEmailAndPassword(email: email, password: password); // this statement can take any amount of time to authenticate a user and returns future.
        if(newUser!=null){
          Navigator.pushNamed(context, ChatScreen.id);
        }
        }catch(e){
          print(e);
        }
                },
              )
            ],
          ),
      ),
    );
  }
}
