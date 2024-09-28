import 'package:flutter/material.dart';
import 'chicken_cat.dart'; // Ensure this path is correct
import 'mutton_cat.dart'; // Ensure this path is correct

class Category {
  final String title;
  final String imagePath;
  final String description;

  Category({required this.title, required this.imagePath, required this.description});
}

class CategoryDetailPage extends StatelessWidget {
  final List<Category> categories = [
    Category(
      title: "Chicken",
      imagePath: "assets/images/Naya1.png",
      description: "Raised on biosecure farms",
    ),
    Category(
      title: "Mutton",
      imagePath: "assets/images/mutton.jpeg",
      description: "Pasture raised lamb & goats",
    ),
    Category(
      title: 'Liver & More',
      imagePath: 'assets/images/liver2.jpeg',
      description: 'Rich & flavorful cuts of liver, kidney, Paya & more.',
    ),
    Category(
      title: 'Ready to Cook',
      imagePath: 'assets/images/ready_to_cook.jpeg',
      description: 'Freshly marinated meats',
    ),
    Category(
      title: 'Freshwater Fish',
      imagePath: 'assets/images/freshwater_fish.jpeg',
      description: 'Tender, fresh catch for curries & more',
    ),
    Category(
      title: 'Prawns and Crabs',
      imagePath: 'assets/images/prawns.jpeg',
      description: 'Freshly marinated meats',
    ),
    Category(
      title: 'Seawater Fish',
      imagePath: 'assets/images/seawater.jpeg',
      description: 'Tender, fresh catch for curries & more',
    ),
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade100,
              Colors.orange.shade200,
              Colors.orange.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(categories[index].imagePath),
                  radius: 30,
                ),
                title: Text(
                  categories[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange,
                  ),
                ),
                subtitle: Text(
                  categories[index].description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.orange,
                ),
                onTap: () {
                  if (categories[index].title == "Chicken") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChickenCategoryPage()),
                    );
                  } else if (categories[index].title == "Mutton") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MuttonCategoryPage()),
                    );
                  } else {
                    // Handle other categories if necessary
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
