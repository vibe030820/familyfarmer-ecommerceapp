import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:ecommerce_app/pages/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// Import your ProfilePage

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final String address;
  final String phone;
  final double totalPrice;
  final String userId;

  PaymentPage({
    required this.cartItems,
    required this.address,
    required this.phone,
    required this.totalPrice,
    required this.userId,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // Directly open Razorpay checkout when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      openCheckout();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_f5bn7PCjRUkuOL',
      'amount': (widget.totalPrice * 100).toInt(), // Amount in paise
      'name': 'Peoples Farmer',
      'description': 'Order Payment',
      'prefill': {
        'contact': widget.phone,
        'email':
            'example@example.com', // You can get the user's email if you have it
      },
      'external': {
        'wallets': ['paytm']
      },
      'method': {
        'upi': true, // Enable UPI payment option
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Payment success, insert order details into the collection
    await insertOrderDetails(
        response.paymentId ?? '', response.signature ?? '');
    // Delete cart items after successful payment
    await deleteCartItems(widget.userId);
    // Show a snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Order placed successfully! Check status in your profile.')),
    );
    // Navigate to profile page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNav()),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment failed, show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Failed: ${response.message}')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // External wallet selected, handle it here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External Wallet Selected: ${response.walletName}')),
    );
  }

  Future<void> insertOrderDetails(String paymentId, String signature) async {
    // Your logic to insert order details into the collection
    // Example: Firestore or your backend API call
    // Here's an example using Firestore
    final orderData = {
      'userId': widget.userId,
      'cartItems': widget.cartItems,
      'address': widget.address,
      'phone': widget.phone,
      'totalPrice': widget.totalPrice,
      'paymentId': paymentId,
      'signature': signature,
      'status': "confirmed",
      'timestamp': DateTime.now(),
    };

    // Assuming you have a Firestore instance
    await FirebaseFirestore.instance.collection('orders').add(orderData);
  }

  Future<void> deleteCartItems(String userId) async {
    // Get the user's cart items
    final cartItems = await getCart(userId);

    // Assuming cart items are stored in Firestore under a 'cart' collection
    final cartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Cart');
    final batch = FirebaseFirestore.instance.batch();

    for (var item in cartItems) {
      batch.delete(cartCollection
          .doc(item['id'])); // Assuming each item has an 'id' field
    }

    await batch.commit();
  }

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
        .map((doc) => {
              ...doc.data() as Map<String, dynamic>,
              'id': doc.id, // Include the document ID
            })
        .toList();

    return cartItems;
  }

  @override
  Widget build(BuildContext context) {
    // Return an empty container since no UI is needed
    return Container();
  }
}
