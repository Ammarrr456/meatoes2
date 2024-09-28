import 'package:flutter/material.dart';
import 'checkout.dart'; // Replace with your category page import.
import 'category.dart';

class WhoohooPage extends StatelessWidget {
  final String message;

  WhoohooPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whoohoo!'),
        centerTitle: true, // Center the title if you prefer
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0), // Add horizontal padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2), // Add some space at the top
            Text(
              'WHOohoo'.toUpperCase(), // Make the title uppercase
              style: TextStyle(
                color: Colors.orange, // Use your brand color
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2, // Space out the letters a little
              ),
            ),
            SizedBox(height: 16), // Add a small gap
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Spacer(), // Add a spacer to balance the layout
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder( // Rounded corners
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Navigate back to the category page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryDetailPage()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(flex: 2), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
