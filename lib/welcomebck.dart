import 'package:flutter/material.dart';
import 'category.dart';


class WelcomeBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meatoes'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.orange, // Choose a background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enjoy Your Cooking!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('Proceed'),
              onPressed: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CategoryDetailPage()),
                );
              },

              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}