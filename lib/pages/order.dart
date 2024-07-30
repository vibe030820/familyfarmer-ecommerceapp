// // import 'dart:async';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:ecommerce_app/pages/checkout.dart';
// // import 'package:ecommerce_app/service/database.dart';
// // import 'package:ecommerce_app/service/shared_pref.dart';
// // import 'package:ecommerce_app/widget/widget_support.dart';
// // import 'package:flutter/material.dart';

// // class Order extends StatefulWidget {
// //   const Order({super.key});

// //   @override
// //   State<Order> createState() => _OrderState();
// // }

// // class _OrderState extends State<Order> {
// //   String? id, wallet;
// //   int total = 0, amount2 = 0;

// //   void startTimer() {
// //     Timer(Duration(seconds: 3), () {
// //       if (mounted) {
// //         amount2 = total;
// //         setState(() {});
// //       }
// //     });
// //   }

// //   getthesharedpref() async {
// //     id = await SharedPreferenceHelper().getUserId();
// // // wallet= await SharedPreferenceHelper().getUserWallet();
// //     setState(() {});
// //   }

// //   ontheload() async {
// //     await getthesharedpref();
// //     productStream = await DatabaseMethods().getCart(id!);
// //     setState(() {});
// //   }

// //   @override
// //   void initState() {
// //     ontheload();
// //     startTimer();
// //     super.initState();
// //   }

// //   Stream? productStream;

// //   Widget productCart() {
// //     return StreamBuilder(
// //         stream: productStream,
// //         builder: (context, AsyncSnapshot snapshot) {
// //           return snapshot.hasData
// //               ? ListView.builder(
// //                   padding: EdgeInsets.zero,
// //                   itemCount: snapshot.data.docs.length,
// //                   shrinkWrap: true,
// //                   scrollDirection: Axis.vertical,
// //                   itemBuilder: (context, index) {
// //                     DocumentSnapshot ds = snapshot.data.docs[index];
// //                     total = total + int.parse(ds["Total"]);
// //                     return Container(
// //                       margin: EdgeInsets.only(
// //                           left: 20.0, right: 20.0, bottom: 10.0),
// //                       child: Material(
// //                         elevation: 5.0,
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10)),
// //                           padding: EdgeInsets.all(10),
// //                           child: Row(
// //                             children: [
// //                               Container(
// //                                 height: 90,
// //                                 width: 40,
// //                                 decoration: BoxDecoration(
// //                                     border: Border.all(),
// //                                     borderRadius: BorderRadius.circular(10)),
// //                                 child: Center(child: Text(ds["Quantity"])),
// //                               ),
// //                               SizedBox(
// //                                 width: 10.0,
// //                               ),
// //                               ClipRRect(
// //                                   borderRadius: BorderRadius.circular(60),
// //                                   child: Image.network(
// //                                     ds["Image"],
// //                                     height: 90,
// //                                     width: 90,
// //                                     fit: BoxFit.cover,
// //                                   )),
// //                               SizedBox(
// //                                 width: 10.0,
// //                               ),
// //                               Column(
// //                                 children: [
// //                                   Text(
// //                                     ds["Name"],
// //                                     style: AppWidget.TextFieldStyle(),
// //                                   ),
// //                                   Text(
// //                                     "\₹" + ds["Total"],
// //                                     style: AppWidget.TextFieldStyle(),
// //                                   )
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   })
// //               : CircularProgressIndicator();
// //         });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         padding: EdgeInsets.only(top: 60.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Material(
// //                 elevation: 2.0,
// //                 child: Container(
// //                     padding: EdgeInsets.only(bottom: 10.0),
// //                     child: Center(
// //                         child: Text(
// //                       "Cart",
// //                       style: AppWidget.HeadLineTextFieldStyle(),
// //                     )))),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             Container(
// //                 height: MediaQuery.of(context).size.height / 2,
// //                 child: productCart()),
// //             Spacer(),
// //             Divider(),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     "Total Price",
// //                     style: AppWidget.semiBoldTextFieldStyle(),
// //                   ),
// //                   Text(
// //                     "\₹" + total.toString(),
// //                     style: AppWidget.semiBoldTextFieldStyle(),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             GestureDetector(
// //               onTap: () async {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => CheckoutPage(
// //                               cartItems: [],
// //                             )));
// //               },
// //               child: Container(
// //                 padding: EdgeInsets.symmetric(vertical: 10.0),
// //                 width: MediaQuery.of(context).size.width,
// //                 decoration: BoxDecoration(
// //                     color: Colors.black,
// //                     borderRadius: BorderRadius.circular(10)),
// //                 margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
// //                 child: Center(
// //                     child: Text(
// //                   "CheckOut",
// //                   style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 20.0,
// //                       fontWeight: FontWeight.bold),
// //                 )),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/pages/checkout.dart';
// import 'package:ecommerce_app/service/database.dart';
// import 'package:ecommerce_app/service/shared_pref.dart';
// import 'package:ecommerce_app/widget/widget_support.dart';
// import 'package:flutter/material.dart';

// class Order extends StatefulWidget {
//   const Order({Key? key}) : super(key: key);

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   String? id;
//   int total = 0;

//   void startTimer() {
//     Timer(Duration(seconds: 3), () {
//       if (mounted) {
//         setState(() {
//           // Perform any actions after the timer completes, if needed
//         });
//       }
//     });
//   }

//   Future<void> getSharedPref() async {
//     id = await SharedPreferenceHelper().getUserId();
//     setState(() {});
//   }

//   Future<List<Map<String, dynamic>>> loadCartItems() async {
//     DatabaseMethods databaseMethods = DatabaseMethods();
//     await getSharedPref();
//     // Assuming DatabaseMethods.getCart can be modified to return a list
//     List<Map<String, dynamic>> cartItems = (await databaseMethods.getCart(id!));
//     return cartItems;
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadCartItems().then((items) {
//       setState(() {
//         total = items.fold(
//             0, (sum, item) => sum + int.parse(item["Total"].toString()));
//       });
//     });
//     startTimer();
//   }
// //   Future<void> loadCartItems() async {
// //     await getSharedPref();
// //     productStream = (await DatabaseMethods().getCart(id!))
// //         as Stream<QuerySnapshot<Map<String, dynamic>>>?;

// // //     setState(() {});
// //     setState(() {});
// //   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   loadCartItems();
//   //   startTimer();
//   // }

//   Stream<QuerySnapshot<Map<String, dynamic>>>? productStream;

//   Widget productCart() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: productStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No items in cart'));
//         }

//         // Initialize total inside the builder to accumulate correctly
//         total = 0;

//         return ListView.builder(
//           padding: EdgeInsets.zero,
//           itemCount: snapshot.data!.docs.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             DocumentSnapshot<Map<String, dynamic>> ds =
//                 snapshot.data!.docs[index];
//             int itemTotal = int.parse(ds["Total"].toString());
//             total += itemTotal;

//             return Container(
//               margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
//               child: Material(
//                 elevation: 5.0,
//                 borderRadius: BorderRadius.circular(10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding: EdgeInsets.all(10),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 90,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(child: Text(ds["Quantity"].toString())),
//                       ),
//                       SizedBox(width: 10.0),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(60),
//                         child: Image.network(
//                           ds["Image"].toString(),
//                           height: 90,
//                           width: 90,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(width: 10.0),
//                       Column(
//                         children: [
//                           Text(
//                             ds["Name"].toString(),
//                             style: AppWidget.TextFieldStyle(),
//                           ),
//                           Text(
//                             "\₹" + ds["Total"].toString(),
//                             style: AppWidget.TextFieldStyle(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(top: 60.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Material(
//               elevation: 2.0,
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 10.0),
//                 child: Center(
//                   child: Text(
//                     "Cart",
//                     style: AppWidget.HeadLineTextFieldStyle(),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Expanded(
//               child: productCart(),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Total Price",
//                     style: AppWidget.semiBoldTextFieldStyle(),
//                   ),
//                   Text(
//                     "\₹" + total.toString(),
//                     style: AppWidget.semiBoldTextFieldStyle(),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0),
//             GestureDetector(
//               onTap: () async {
//                 List<Map<String, dynamic>> cartItems = await loadCartItems();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CheckoutPage(cartItems: cartItems),
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 10.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                 child: Center(
//                   child: Text(
//                     "CheckOut",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:async';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:ecommerce_app/service/database.dart';
// // import 'package:ecommerce_app/service/shared_pref.dart';
// // import 'package:ecommerce_app/widget/widget_support.dart';
// // import 'package:flutter/material.dart';

// // import 'payment_page.dart';

// // class Order extends StatefulWidget {
// //   const Order({super.key});

// //   @override
// //   State<Order> createState() => _OrderState();
// // }

// // class _OrderState extends State<Order> {
// //   String? id, wallet;
// //   int total = 0, amount2 = 0;
// //   List<String> productNames = [];

// //   void startTimer() {
// //     Timer(Duration(seconds: 3), () {
// //       if (mounted) {
// //         amount2 = total;
// //         setState(() {});
// //       }
// //     });
// //   }

// //   getthesharedpref() async {
// //     id = await SharedPreferenceHelper().getUserId();
// //     setState(() {});
// //   }

// //   ontheload() async {
// //     await getthesharedpref();
// //     productStream = await DatabaseMethods().getCart(id!);
// //     setState(() {});
// //   }

// //   @override
// //   void initState() {
// //     ontheload();
// //     startTimer();
// //     super.initState();
// //   }

// //   Stream? productStream;

// //   Widget productCart() {
// //     return StreamBuilder(
// //         stream: productStream,
// //         builder: (context, AsyncSnapshot snapshot) {
// //           return snapshot.hasData
// //               ? ListView.builder(
// //                   padding: EdgeInsets.zero,
// //                   itemCount: snapshot.data.docs.length,
// //                   shrinkWrap: true,
// //                   scrollDirection: Axis.vertical,
// //                   itemBuilder: (context, index) {
// //                     DocumentSnapshot ds = snapshot.data.docs[index];
// //                     total = total + int.parse(ds["Total"]);
// //                     productNames.add(ds["Name"]);
// //                     return Container(
// //                       margin: EdgeInsets.only(
// //                           left: 20.0, right: 20.0, bottom: 10.0),
// //                       child: Material(
// //                         elevation: 5.0,
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10)),
// //                           padding: EdgeInsets.all(10),
// //                           child: Row(
// //                             children: [
// //                               Container(
// //                                 height: 90,
// //                                 width: 40,
// //                                 decoration: BoxDecoration(
// //                                     border: Border.all(),
// //                                     borderRadius: BorderRadius.circular(10)),
// //                                 child: Center(child: Text(ds["Quantity"])),
// //                               ),
// //                               SizedBox(
// //                                 width: 20.0,
// //                               ),
// //                               ClipRRect(
// //                                   borderRadius: BorderRadius.circular(60),
// //                                   child: Image.network(
// //                                     ds["Image"],
// //                                     height: 90,
// //                                     width: 90,
// //                                     fit: BoxFit.cover,
// //                                   )),
// //                               SizedBox(
// //                                 width: 20.0,
// //                               ),
// //                               Column(
// //                                 children: [
// //                                   Text(
// //                                     ds["Name"],
// //                                     style: AppWidget.semiBoldTextFieldStyle(),
// //                                   ),
// //                                   Text(
// //                                     "\₹" + ds["Total"],
// //                                     style: AppWidget.semiBoldTextFieldStyle(),
// //                                   )
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   })
// //               : CircularProgressIndicator();
// //         });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         padding: EdgeInsets.only(top: 60.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Material(
// //                 elevation: 2.0,
// //                 child: Container(
// //                     padding: EdgeInsets.only(bottom: 10.0),
// //                     child: Center(
// //                         child: Text(
// //                       "Cart",
// //                       style: AppWidget.HeadLineTextFieldStyle(),
// //                     )))),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             Container(
// //                 height: MediaQuery.of(context).size.height / 2,
// //                 child: productCart()),
// //             Spacer(),
// //             Divider(),
// //             Padding(
// //               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     "Total Price",
// //                     style: AppWidget.semiBoldTextFieldStyle(),
// //                   ),
// //                   Text(
// //                     "\₹" + total.toString(),
// //                     style: AppWidget.semiBoldTextFieldStyle(),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             GestureDetector(
// //               onTap: () async {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => PaymentPage(
// //                       total: total,
// //                       userId: id!,
// //                       productNames: productNames,
// //                     ),
// //                   ),
// //                 );
// //               },
// //               child: Container(
// //                 padding: EdgeInsets.symmetric(vertical: 10.0),
// //                 width: MediaQuery.of(context).size.width,
// //                 decoration: BoxDecoration(
// //                     color: Colors.black,
// //                     borderRadius: BorderRadius.circular(10)),
// //                 margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
// //                 child: Center(
// //                     child: Text(
// //                   "CheckOut",
// //                   style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 20.0,
// //                       fontWeight: FontWeight.bold),
// //                 )),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'dart:async';

import 'package:ecommerce_app/pages/checkout.dart';
import 'package:ecommerce_app/service/database.dart';
import 'package:ecommerce_app/service/shared_pref.dart';
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id;
  int total = 0;
  List<Map<String, dynamic>> cartItems = []; // List to store fetched cart items

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          // Perform any actions after the timer completes, if needed
        });
      }
    });
  }

  Future<void> getSharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  Future<void> loadCartItems() async {
    DatabaseMethods databaseMethods = DatabaseMethods();
    await getSharedPref();
    // Assuming DatabaseMethods.getCart can be modified to return a list
    cartItems = await databaseMethods.getCart(id!);
    calculateTotal();
  }

  void calculateTotal() {
    total = cartItems.fold(
      0,
      (sum, item) => sum + int.parse(item["Total"].toString()),
    );
    setState(() {}); // Update total after calculation
  }

  @override
  void initState() {
    super.initState();
    loadCartItems().then((_) {
      startTimer();
    });
  }

  Widget productCart() {
    if (cartItems.isEmpty) {
      return Center(child: Text('No items in cart'));
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cartItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        int itemTotal = int.parse(item["Total"].toString());

        return Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(item["Quantity"].toString())),
                  ),
                  SizedBox(width: 10.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      item["Image"].toString(),
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text(
                        item["Name"].toString(),
                        style: AppWidget.TextFieldStyle(),
                      ),
                      Text(
                        "\₹" + item["Total"].toString(),
                        style: AppWidget.TextFieldStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Cart",
                    style: AppWidget.HeadLineTextFieldStyle(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: productCart(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                  Text(
                    "\₹" + total.toString(),
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(cartItems: cartItems),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Center(
                  child: Text(
                    "CheckOut",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
