
import 'dart:js';

import 'package:first_flutterapp/pinCode.dart';
import 'package:first_flutterapp/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:first_flutterapp/profilePage.dart';
import 'package:first_flutterapp/verification.dart';
import 'package:first_flutterapp/singup.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'splash' : (context)=>Splash(),
      'signup' : (context) => SignUpPage(),
      'profile' : (context) => ProfilePage(),
      'verification' : (context)=> VerificationPage(),
      'pincode' : (context)=> PinCodePage(),
    },
  ));
}

