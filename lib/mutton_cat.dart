import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'cart_page.dart';

class MuttonProduct {
  final String name;
  final String imagePath;
  final String description;
  final double price;

  MuttonProduct({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

class MuttonCategoryPage extends StatelessWidget {
  final List<MuttonProduct> products = [
    MuttonProduct(
      name: 'Goat Curry Cut - Small Pieces',
      imagePath: 'assets/images/mutton_curry.png',
      description: 'Perfectly cut small pieces of goat for curry',
      price: 200.0,
    ),
    MuttonProduct(
      name: 'Pure Goat Mince',
      imagePath: 'assets/images/mince.png',
      description: 'Finely ground goat mince for curries, kebabs & more',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Goat Boneless',
      imagePath: 'assets/images/boneless.png',
      description: 'Bite-sized fat-trimmed cuts for pan-fried delicacies',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Liver - Chunks',
      imagePath: 'assets/images/liver1.png',
      description: 'Cut & cleaned Mutton Liver for pan-fried dishes',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Paya/Trotters (Whole): Pack of 4',
      imagePath: 'assets/images/paya.png',
      description: 'Finely goat payas for curries & more',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Brain (Bheja)',
      imagePath: 'assets/images/bheja.png',
      description: 'Premium Mutton Brain for rich, creamy dishes',
      price: 350.0,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutton Products'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade50,
              Colors.orange.shade100,
              Colors.orange.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65, // Adjusted aspect ratio for better fit
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              shadowColor: Colors.orangeAccent.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Padding to reduce image size
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '₹${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false).addProduct(
                              product.name,
                              product.price,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
