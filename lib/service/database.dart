import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future addProduct(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProduct(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  // Future<Stream<QuerySnapshot>> getCart(String id) async {
  //   return await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(id)
  //       .collection("Cart")
  //       .snapshots();
  // }
  Future<List<Map<String, dynamic>>> getCart(String userId) async {
    // Get the collection reference for the user's cart
    final cartCollection = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("Cart");

    // Get a query snapshot of the cart items
    final querySnapshot = await cartCollection.get();

    // Convert the query snapshot to a list of maps
    final cartItems = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    return cartItems;
  }

  Future<Stream<QuerySnapshot>> getProducts() async {
    List<String> collections = [
      'Natural-Pesticides',
      'Growth-Enhancer',
      'Organic-Solution',
      'Bio-Fertilizer'
    ];

    // Create a StreamController to merge streams
    StreamController<QuerySnapshot> controller = StreamController();

    // Listen to snapshots from each collection and add them to the controller
    for (var collection in collections) {
      FirebaseFirestore.instance
          .collection(collection)
          .snapshots()
          .listen((snapshot) {
        controller.add(snapshot);
      });
    }

    // Return the stream from the controller
    return controller.stream;
  }

  Future<void> removeFromCart(String userId, String productId) async {
    try {
      // Reference to the user's cart document
      DocumentReference cartRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productId);

      // Delete the product from the cart
      await cartRef.delete();
    } catch (e) {
      print('Error removing product from cart: $e');
      // Handle error as per your app's requirements
    }
  }

  Future addToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Cart")
        .add(userInfoMap);
  }
}
