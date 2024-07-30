import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateOrderStatusPage extends StatefulWidget {
  @override
  _UpdateOrderStatusPageState createState() => _UpdateOrderStatusPageState();
}

class _UpdateOrderStatusPageState extends State<UpdateOrderStatusPage> {
  final TextEditingController _paymentIdController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _updateOrderStatus(String paymentId, String newStatus) async {
    try {
      // Update status in the 'orders' collection
      QuerySnapshot ordersSnapshot = await _firestore
          .collection('orders')
          .where('paymentId', isEqualTo: paymentId)
          .get();

      for (var doc in ordersSnapshot.docs) {
        await doc.reference.update({'status': newStatus});
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Order status has been updated successfully",
          style: TextStyle(fontSize: 16.0),
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error updating order status: $e",
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
        title: Text('Update Order Status'),
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
                    'Payment ID',
                    _paymentIdController,
                    'Enter payment ID',
                  ),
                  buildTextField(
                    'Status',
                    _statusController,
                    'Enter new status',
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
                      final paymentId = _paymentIdController.text.trim();
                      final newStatus = _statusController.text.trim();

                      if (paymentId.isNotEmpty && newStatus.isNotEmpty) {
                        _updateOrderStatus(paymentId, newStatus);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please enter a valid payment ID and status",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ));
                      }
                    },
                    child: Text('Update Status'),
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
