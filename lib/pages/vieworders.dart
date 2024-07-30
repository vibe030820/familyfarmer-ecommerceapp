// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/service/shared_pref.dart';
// import 'package:flutter/material.dart';

// class ViewOrders extends StatefulWidget {
//   @override
//   _ViewOrdersState createState() => _ViewOrdersState();
// }

// class Order {
//   final String address;
//   final List<CartItem> cartItems; // List of cart items
//   final String paymentId;
//   final String phone;
//   final String status;
//   final DateTime timestamp;
//   final String totalPrice;
//   final String userId;

//   Order({
//     required this.address,
//     required this.cartItems,
//     required this.paymentId,
//     required this.phone,
//     required this.status,
//     required this.timestamp,
//     required this.totalPrice,
//     required this.userId,
//   });

//   factory Order.fromMap(Map<String, dynamic> data) {
//     final List<CartItem> cartItems = (data['cartItems'] as List)
//         .map((cartItemData) => CartItem.fromMap(cartItemData))
//         .toList();
//     final timestamp =
//         (data['timestamp'] as Timestamp)?.toDate() ?? DateTime.now();

//     return Order(
//       address: data['address'] ?? 'Unknown',
//       cartItems: cartItems,
//       paymentId: data['paymentId'] ?? 'Unknown',
//       phone: data['phone'] ?? 'Unknown',
//       status: data['status'] ?? 'Unknown',
//       timestamp: timestamp,
//       totalPrice: data['totalPrice']?.toString() ?? 'Unknown',
//       userId: data['userId'] ?? 'Unknown',
//     );
//   }
// }

// class CartItem {
//   final String name;
//   final String? image; // Optional image URL
//   final int quantity;
//   final double price;

//   CartItem({
//     required this.name,
//     this.image,
//     required this.quantity,
//     required this.price,
//   });

//   factory CartItem.fromMap(Map<String, dynamic> data) {
//     return CartItem(
//       name: data['name'] ?? 'Unknown',
//       image: data['image'],
//       quantity: data['quantity'] ?? 0,
//       price: data['price']?.toDouble() ?? 0.0,
//     );
//   }
// }

// class _ViewOrdersState extends State<ViewOrders> {
//   late Future<List<Order>> _ordersFuture;
//   String? userId;

//   @override
//   void initState() {
//     super.initState();
//     _ordersFuture = _loadUserIdAndFetchOrders();
//   }

//   Future<List<Order>> _loadUserIdAndFetchOrders() async {
//     userId = await SharedPreferenceHelper().getUserId();
//     if (userId != null) {
//       return _fetchOrders();
//     } else {
//       return [];
//     }
//   }

//   Future<List<Order>> _fetchOrders() async {
//     final querySnapshot = await FirebaseFirestore.instance
//         .collection('orders') // Replace with your collection name
//         .where('status', isNotEqualTo: 'completed') // Filter orders here
//         .get();

//     return querySnapshot.docs.map((doc) {
//       final data = doc.data();
//       return Order.fromMap(data);
//     }).toList();
//   }

//   // Color _getStatusColor(String status) {
//   //   // ... your color logic for order status
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Orders'),
//       ),
//       body: FutureBuilder<List<Order>>(
//         future: _ordersFuture,
//         builder: (context, snapshot) {
//           // ... your error handling and loading indicator logic

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No orders found.'));
//           }

//           final orders = snapshot.data!;

//           return ListView.builder(
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 4.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'orders',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
// // Address
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Address:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               order.address,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
// // Cart Items
//                         Text(
//                           'Cart Items:',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         ListView.builder(
//                           shrinkWrap:
//                               true, // Avoid list view overflowing the container
//                           physics:
//                               NeverScrollableScrollPhysics(), // Disable scrolling for nested list view
//                           itemCount: order.cartItems.length,
//                           itemBuilder: (context, cartItemIndex) {
//                             final cartItem = order.cartItems[cartItemIndex];
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   " $cartItem.name - ${cartItem.quantity}",
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       cartItem.image != null ? '(Image)' : '',
//                                       style: TextStyle(
//                                           fontSize: 12, color: Colors.grey),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       '${cartItem.price.toString()}',
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Other order details
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Payment ID:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               order.paymentId,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Phone:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               order.phone,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Status:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 12,
//                                 vertical: 5,
//                               ),
//                               decoration: BoxDecoration(
//                                 // color: _getStatusColor(order.status),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Text(
//                                 order.status,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Timestamp:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               order.timestamp.toString(),
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Total Price:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Text(
//                                   order.totalPrice,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[700],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/service/shared_pref.dart';
import 'package:flutter/material.dart';

class ViewOrders extends StatefulWidget {
  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class Order {
  final String address;
  final List<CartItem> cartItems; // List of cart items
  final String paymentId;
  final String phone;
  final String status;
  final DateTime timestamp;
  final String totalPrice;
  final String userId;

  Order({
    required this.address,
    required this.cartItems,
    required this.paymentId,
    required this.phone,
    required this.status,
    required this.timestamp,
    required this.totalPrice,
    required this.userId,
  });

  factory Order.fromMap(Map<String, dynamic> data) {
    final List<CartItem> cartItems = (data['cartItems'] as List)
        .map((cartItemData) => CartItem.fromMap(cartItemData))
        .toList();
    final timestamp =
        (data['timestamp'] as Timestamp)?.toDate() ?? DateTime.now();

    return Order(
      address: data['address'] ?? 'Unknown',
      cartItems: cartItems,
      paymentId: data['paymentId'] ?? 'Unknown',
      phone: data['phone'] ?? 'Unknown',
      status: data['status'] ?? 'Unknown',
      timestamp: timestamp,
      totalPrice: data['totalPrice']?.toString() ?? 'Unknown',
      userId: data['userId'] ?? 'Unknown',
    );
  }
}

class CartItem {
  final String name;
  final String? image; // Optional image URL
  final int quantity;
  final double price;

  CartItem({
    required this.name,
    this.image,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromMap(Map<String, dynamic> data) {
    return CartItem(
      name: data['name'] ?? 'Unknown',
      image: data['image'],
      quantity: data['quantity'] ?? 0,
      price: data['price']?.toDouble() ?? 0.0,
    );
  }
}

class _ViewOrdersState extends State<ViewOrders> {
  late Future<List<Order>> _ordersFuture;
  String? userId;

  @override
  void initState() {
    super.initState();
    _ordersFuture = _loadUserIdAndFetchOrders();
  }

  Future<List<Order>> _loadUserIdAndFetchOrders() async {
    userId = await SharedPreferenceHelper().getUserId();
    if (userId != null) {
      return _fetchOrders();
    } else {
      return [];
    }
  }

  Future<List<Order>> _fetchOrders() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders') // Replace with your collection name
        .where('status', isNotEqualTo: 'completed') // Filter orders here
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Order.fromMap(data);
    }).toList();
  }

  Color _getStatusColor(String status) {
    // Implement your logic to assign color based on status
    switch (status) {
      case 'pending':
        return Colors.yellow;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          // Handle errors and loading indicator
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching orders.'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found.'));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order details section
                      Text(
                        'Order Details', // Replace with your desired title
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status:'),
                          Text(
                            order.status,
                            style:
                                TextStyle(color: _getStatusColor(order.status)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Price:'),
                          Text('\$${order.totalPrice}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Address:'),
                          Text('${order.address}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Contact:'),
                          Text('${order.phone}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Id:'),
                          Text('${order.paymentId}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('UserId:'),
                          Text('${order.userId}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date:'),
                          Text('${order.timestamp.toIso8601String()}'),
                        ],
                      ),
                      // Order items list (optional)
                      if (order.cartItems.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.0),
                            Text(
                              'Order Items',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: order.cartItems.length,
                              itemBuilder: (context, itemIndex) {
                                final cartItem = order.cartItems[itemIndex];
                                return ListTile(
                                  title: Text(cartItem.name),
                                  subtitle:
                                      Text('Quantity: ${cartItem.quantity}'),
                                  trailing: Text(
                                      '\$${cartItem.price * cartItem.quantity}'),
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
