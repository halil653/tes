import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mob3_login_107_halil/ui/home.dart';


class Authservice {


Future<void> signup({
  required String email,
  required String password,
  required BuildContext context
}) async {

  try {

await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email:email,
  password:password 
  );
  await Future.delayed(const Duration(seconds: 1));
  Navigator.pushReplacement(
    context,
   MaterialPageRoute(
    builder:(BuildContext context)=> const HomePage()
  )
  );

  }on FirebaseAuthException catch(e){
    String message ='';
    if (e.code == 'password lemah'){
      message = 'password yang ada masukan terlalu lemah.';
    }else if (e.code == 'email sudah digunkan'){
      message = 'akun sudah terdaftar dengan email ini.';

    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black38,
      textColor: Colors.white38,
      fontSize: 14.0,
      
    );
  }
  catch(e){

  }
}

Future<void> signin({
  required String email,
  required String password,
  required BuildContext context
}) async {

  try {

await FirebaseAuth.instance.signInWithEmailAndPassword(
  email:email,
  password:password 
  );
  await Future.delayed(const Duration(seconds: 1));
  Navigator.pushReplacement(
    context,
   MaterialPageRoute(
    builder:(BuildContext context)=> const HomePage()
  )
  );

  }on FirebaseAuthException catch(e){
    String message ='';
    if (e.code == 'password lemah'){
      message = 'tidak ada akun yang di temukan dengan email tersebut.';
    }else if (e.code == 'password salah'){
      message = 'password salah untuk user maksud.';

    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black38,
      textColor: Colors.white38,
      fontSize: 14.0,
      
    );
  }
  catch(e){

  }
}
}