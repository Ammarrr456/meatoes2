import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'checkout.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  String _addressType = 'Home';
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://192.168.39.165:5000/api/addresses'), // Update with your server's IP or domain
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mobileNumber': _mobileNumberController.text,
          'emailAddress': _emailAddressController.text,
          'fullName': _fullNameController.text,
          'addressType': _addressType,
        }),
      );

      if (response.statusCode == 201) {
        // Successfully saved
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CheckoutPage()),
        );
      } else {
        // Handle error
        print('Failed to save address: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save address')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        backgroundColor: Colors.orange,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade700, Colors.orange.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                controller: _mobileNumberController,
                label: 'Mobile number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                controller: _emailAddressController,
                label: 'Email Address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildTextFormField(
                controller: _fullNameController,
                label: 'Full Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildAddressTypeSelector(),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Save & Proceed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: true,
        fillColor: Colors.orange.shade50,
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildAddressTypeSelector() {
    return ListTile(
      title: const Text(
        'Save As',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          ChoiceChip(
            label: const Text('Home'),
            selected: _addressType == 'Home',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Home';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Home' ? Colors.white : Colors.orange,
            ),
          ),
          ChoiceChip(
            label: const Text('Work'),
            selected: _addressType == 'Work',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Work';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Work' ? Colors.white : Colors.orange,
            ),
          ),
          ChoiceChip(
            label: const Text('Other'),
            selected: _addressType == 'Other',
            onSelected: (bool selected) {
              setState(() {
                _addressType = 'Other';
              });
            },
            selectedColor: Colors.orange,
            backgroundColor: Colors.orange.shade100,
            labelStyle: TextStyle(
              color: _addressType == 'Other' ? Colors.white : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
