import 'package:ecommerce_app/pages/add_product.dart';
import 'package:ecommerce_app/pages/delete_product.dart';
import 'package:ecommerce_app/pages/login.dart'; // Adjust the import based on your project structure
import 'package:ecommerce_app/pages/price_update.dart';
import 'package:ecommerce_app/pages/status_change.dart';
import 'package:ecommerce_app/pages/vieworders.dart';
import 'package:ecommerce_app/service/shared_pref.dart'; // Adjust the import based on your project structure
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  void logout() async {
    await SharedPreferenceHelper()
        .clearPreferences(); // Clear shared preferences

    // Navigate to login screen after logout
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LogIn()));
    // Replace '/login' with your login route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Home Admin",
                    style: AppWidget.HeadLineTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddProduct()));
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 120, 38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.add, // Replace with the desired icon
                                size: 100, // Adjust size as needed
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "Add Products",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewOrders()));
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 120, 38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.list, // Replace with the desired icon
                                size: 100, // Adjust size as needed
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "View Orders",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeleteProductPage()));
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 120, 38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.delete, // Replace with the desired icon
                                size: 100, // Adjust size as needed
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "Delete Product",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PriceUpdatePage()));
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 120, 38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons
                                    .price_change, // Replace with the desired icon
                                size: 100, // Adjust size as needed
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "Price Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateOrderStatusPage()));
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 120, 38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.update, // Replace with the desired icon
                                size: 100, // Adjust size as needed
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              "Order Status Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(Icons.logout,
                  color: Color.fromARGB(255, 0, 0, 0), size: 30),
              onPressed: logout,
            ),
          ),
        ],
      ),
    );
  }
}
