import 'dart:async';

import 'package:first_flutterapp/verification.dart';
import 'package:first_flutterapp/profilePage.dart';
import 'package:first_flutterapp/singup.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //         () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,// use aligment
          color: Colors.black,
          child: Image.asset(
            'assets/splash.jpeg',
            fit: BoxFit.cover, // Use BoxFit.cover to fill the entire space without borders
            width: double.infinity, // Ensure the image takes the full width
            height: double.infinity, // Ensure the image takes the full height
          ),
        ),
          Positioned(
              bottom: 100,
              left: 70,
              right: 70,
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black, // Text color
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white, // Icon color
                    ),
                  ],
                ),
              )

          ),
          Positioned(
              bottom: 40,
              left: 70,
              right: 70,
              child:ElevatedButton(
                onPressed: () {
                  // Add your button press logic here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Border radius
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Test Drive',
                      style: TextStyle(
                        color: Colors.black, // Text color
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white, // Icon color
                    ),
                  ],
                ),
              )

          ),
        ],
      ),
    );
  }
}
