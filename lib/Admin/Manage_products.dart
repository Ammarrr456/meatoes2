import 'package:flutter/material.dart';

class ManageProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Product 1'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle delete logic here
              },
            ),
            onTap: () {
              // Handle edit logic here
            },
          ),
          // Add more product tiles here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen for adding a new product
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
