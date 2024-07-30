import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PriceUpdatePage extends StatefulWidget {
  @override
  _PriceUpdatePageState createState() => _PriceUpdatePageState();
}

class _PriceUpdatePageState extends State<PriceUpdatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _updatePrice(String name, String newPrice) async {
    try {
      // Update price in the specified category collection
      var collections = [
        'Bio-Fertilizer',
        'Growth-Enhancer',
        'Natural-Pesticides',
        'Organic-Solution'
      ];

      for (var category in collections) {
        QuerySnapshot categorySnapshot = await _firestore
            .collection(category)
            .where('Name', isEqualTo: name)
            .get();

        for (var doc in categorySnapshot.docs) {
          await doc.reference.update({'Price': newPrice});
        }
      }

      // Also update price in 'allproducts' collection
      QuerySnapshot allProductsSnapshot = await _firestore
          .collection('allproducts')
          .where('Name', isEqualTo: name)
          .get();

      for (var doc in allProductsSnapshot.docs) {
        await doc.reference.update({'Price': newPrice});
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Price has been updated successfully",
          style: TextStyle(fontSize: 16.0),
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error updating price: $e",
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
            keyboardType:
                label == 'Price' ? TextInputType.number : TextInputType.text,
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
        title: Text('Update Product Price'),
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
                  buildTextField(
                    'Price',
                    _priceController,
                    'Enter new price',
                    maxLines: 1,
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
                      final priceText = _priceController.text.trim();
                      final newPrice = priceText;

                      if (productName.isNotEmpty && newPrice != null) {
                        _updatePrice(productName, newPrice);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please enter a valid product name and price",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ));
                      }
                    },
                    child: Text('Update Price'),
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
