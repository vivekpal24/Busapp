import 'package:flutter/material.dart';
import 'package:busapp/home_screen.dart';
import 'package:busapp/login.dart';
class MyHomePage extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color iconBackgroundColor; // Unique background color for each icon
  final String customText;

  MyHomePage({
    required this.text,
    required this.icon,
    required this.iconBackgroundColor,
    required this.customText,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double cardHeight = 60.0; // Initial card height, matching icon width
  final cardWidth = 300.0; // Constant card width
  final iconSize = 60.0; // Constant icon size

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.text,
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                widget.customText,
                style: TextStyle(fontSize: 14),
              ),
              leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.iconBackgroundColor, // Set the unique background color
                ),
                child: Icon(
                  widget.icon,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
            expanded
                ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is additional information that appears when the card is expanded. You can put any content here.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the next activity here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextActivity(),
                      ),
                    );
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.blue, // Customize the text color
                      decoration: TextDecoration.underline, // Add underline style
                    ),
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}


