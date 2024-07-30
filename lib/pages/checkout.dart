// // import 'package:flutter/material.dart';

// // class CheckoutPage extends StatefulWidget {
// //   @override
// //   _CheckoutPageState createState() => _CheckoutPageState();
// // }

// // class _CheckoutPageState extends State<CheckoutPage> {
// //   final TextEditingController addressController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController couponController = TextEditingController();
// //   double totalAmount = 100.0; // Example total amount
// //   double discount = 0.0;

// //   void applyCoupon() {
// //     setState(() {
// //       if (couponController.text == 'DISCOUNT10') {
// //         discount = 10.0; // Example discount for coupon code 'DISCOUNT10'
// //       } else {
// //         discount = 0.0;
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Checkout'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: ListView(
// //                 children: [
// //                   // Example list of cart products
// //                   ListTile(
// //                     title: Text('Product 1'),
// //                     subtitle: Text('\$50.0'),
// //                   ),
// //                   ListTile(
// //                     title: Text('Product 2'),
// //                     subtitle: Text('\$50.0'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             TextField(
// //               controller: addressController,
// //               decoration: InputDecoration(labelText: 'Address'),
// //             ),
// //             TextField(
// //               controller: phoneController,
// //               decoration: InputDecoration(labelText: 'Phone Number'),
// //               keyboardType: TextInputType.phone,
// //             ),
// //             TextField(
// //               controller: couponController,
// //               decoration: InputDecoration(labelText: 'Coupon Code'),
// //             ),
// //             ElevatedButton(
// //               onPressed: applyCoupon,
// //               child: Text('Apply Coupon'),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Total: \$${(totalAmount - discount).toStringAsFixed(2)}',
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Proceed to payment logic
// //               },
// //               child: Text('Proceed to Payment'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class CheckoutPage extends StatefulWidget {
//   final List<Map<String, dynamic>> cartItems;

//   CheckoutPage({required this.cartItems});

//   @override
//   _CheckoutPageState createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController couponController = TextEditingController();
//   double totalAmount = 0.0; // Initialize total amount
//   double discount = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     calculateTotal();
//   }

//   void calculateTotal() {
//     totalAmount = 0.0;
//     widget.cartItems.forEach((item) {
//       totalAmount += double.parse(item['Total'].toString());
//     });
//     setState(() {});
//   }

//   void applyCoupon() {
//     setState(() {
//       if (couponController.text == 'DISCOUNT10') {
//         discount = 10.0; // Example discount for coupon code 'DISCOUNT10'
//       } else {
//         discount = 0.0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.cartItems.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(widget.cartItems[index]['Name'].toString()),
//                     subtitle: Text('\$${widget.cartItems[index]['Total']}'),
//                   );
//                 },
//               ),
//             ),
//             TextField(
//               controller: addressController,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               keyboardType: TextInputType.phone,
//             ),
//             TextField(
//               controller: couponController,
//               decoration: InputDecoration(labelText: 'Coupon Code'),
//             ),
//             ElevatedButton(
//               onPressed: applyCoupon,
//               child: Text('Apply Coupon'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Total: \$${(totalAmount - discount).toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Proceed to payment logic
//                 // Example: navigate to payment page or process payment
//               },
//               child: Text('Proceed to Payment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce_app/pages/payment_page.dart';
import 'package:ecommerce_app/service/shared_pref.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // Commented out coupon related variables
  // final TextEditingController couponController = TextEditingController();
  // double discount = 0.0;

  double totalAmount = 0.0; // Initialize total amount

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount = 0.0;
    widget.cartItems.forEach((item) {
      totalAmount += double.parse(item['Total'].toString());
    });
    setState(() {});
  }

  // Commented out applyCoupon method
  // void applyCoupon() {
  //   setState(() {
  //     if (couponController.text == 'DISCOUNT10') {
  //       discount = 10.0; // Example discount for coupon code 'DISCOUNT10'
  //     } else {
  //       discount = 0.0;
  //     }
  //   });
  // }

  void proceedToPayment() async {
    String? userId = await SharedPreferenceHelper().getUserId();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          cartItems: widget.cartItems,
          address: addressController.text,
          phone: phoneController.text,
          totalPrice: totalAmount,
          userId: userId!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.cartItems[index]['Name'].toString()),
                    subtitle: Row(
                      children: [
                        Text('\$${widget.cartItems[index]['Total']}'),
                        SizedBox(width: 10),
                        Text(
                          'Qty: ${widget.cartItems[index]['Quantity']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            // Commented out coupon code section
            // TextField(
            //   controller: couponController,
            //   decoration: InputDecoration(labelText: 'Coupon Code'),
            // ),
            // ElevatedButton(
            //   onPressed: applyCoupon, // Commented out
            //   child: Text('Apply Coupon'),
            // ),
            SizedBox(height: 20),
            Text(
              'Total: \₹${(totalAmount).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: proceedToPayment,
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
