import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteProductPage extends StatefulWidget {
  @override
  _DeleteProductPageState createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedCategory;

  Future<void> _deleteProduct(String name, String category) async {
    try {
      // Delete from the specified category collection
      QuerySnapshot categorySnapshot = await _firestore
          .collection(category)
          .where('Name', isEqualTo: name)
          .get();

      for (var doc in categorySnapshot.docs) {
        await doc.reference.delete();
      }

      // Also delete from 'allproducts' collection
      QuerySnapshot allProductsSnapshot = await _firestore
          .collection('allproducts')
          .where('Name', isEqualTo: name)
          .get();

      for (var doc in allProductsSnapshot.docs) {
        await doc.reference.delete();
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Product has been deleted successfully",
          style: TextStyle(fontSize: 16.0),
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error deleting product: $e",
          style: TextStyle(fontSize: 16.0),
        ),
      ));
    }
  }

  Widget buildTextField(
      String label, TextEditingController controller, String hint,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: Color(0xFFececf8),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16.0)),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTextField(
                    'Product Name',
                    _nameController,
                    'Enter product name',
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    hint: Text('Select Category'),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: <String>[
                      'Bio-Fertilizer',
                      'Growth-Enhancer',
                      'Natural-Pesticides',
                      'Organic-Solution'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      filled: true,
                      fillColor: Color(0xFFececf8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      final productName = _nameController.text.trim();
                      if (productName.isNotEmpty && selectedCategory != null) {
                        _deleteProduct(productName, selectedCategory!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please enter a product name and select a category",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ));
                      }
                    },
                    child: Text('Delete Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
