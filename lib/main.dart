library animate_gradient;

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:busapp/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('your_custom_background_image.png'), // Replace with your image file path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  MyHomePage(
                    text: 'Individual',
                    icon: Icons.person,
                    iconBackgroundColor: Colors.blueGrey, // Set your desired icon background color
                    customText: 'Join and build\nreal-time community',
                  ),
                  SizedBox(height: 16),
                  MyHomePage(
                    text: 'Merchant',
                    icon: Icons.directions_bus,
                    iconBackgroundColor: Colors.blueGrey, // Set your desired icon background color
                    customText: 'Join and build\nreal-time community',
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
