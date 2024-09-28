import 'package:flutter/material.dart';
import 'Add_users_screen.dart';
import 'Manage_products.dart';
import 'manage_orders.dart';
import 'View_users.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
            AdminPanelTile(
              title: 'Add User',
              icon: Icons.person_add,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddUserScreen()),
                );
              },
            ),
            AdminPanelTile(
              title: 'Manage Products',
              icon: Icons.store,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ManageProductsScreen()),
                );
              },
            ),
            AdminPanelTile(
              title: 'Manage Orders',
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ManageOrdersScreen()),
                );
              },
            ),
            AdminPanelTile(
              title: 'View Users',
              icon: Icons.people,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewUsersScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPanelTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const AdminPanelTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 50.0),
              SizedBox(height: 10.0),
              Text(title, style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
