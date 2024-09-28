import 'package:flutter/material.dart';

class ViewUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Users'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('User 1'),
            subtitle: Text('Email: user1@example.com'),
            onTap: () {
              // Handle user detail view here
            },
          ),
          // Add more user tiles here
        ],
      ),
    );
  }
}
