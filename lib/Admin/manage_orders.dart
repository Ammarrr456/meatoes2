import 'package:flutter/material.dart';

class ManageOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Orders'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Order #1234'),
            subtitle: Text('Status: Pending'),
            trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Handle order completion logic here
              },
            ),
            onTap: () {
              // Handle order detail view here
            },
          ),
          // Add more order tiles here
        ],
      ),
    );
  }
}
