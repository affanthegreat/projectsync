import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
BuildContext ?c;
class AuthHandler  {

    final FirebaseAuth auth = FirebaseAuth.instance;
     User? user;
     var e;

    Future<bool> register(String email,String password) async{
      try{
        user = (await auth.createUserWithEmailAndPassword(email:email , password: password)).user;
        if(user != null){
          return true;
        }
        return false;
      }
      catch(e){
        print(e.toString());
        this.e= e;
        return false;
      }

    }
    void signIn(String email,String password) async{

        user = (await auth.signInWithEmailAndPassword(email:email , password: password)).user;


    }
    void signout() async{
       await auth.signOut();
       user = null;

    }

}

AuthHandler Usr = AuthHandler();