// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:ecommerce_app/pages/details.dart";
// import "package:ecommerce_app/service/database.dart";
// import "package:flutter/material.dart";

// import "../widget/widget_support.dart";

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool biofertilizer = false,
//       growthenhancer = false,
//       naturalpesticide = false,
//       organicsolution = false;

//   Stream? productsStream;
//   ontheLoad() async {
//     productsStream = await DatabaseMethods().getProduct("Bio-Fertilizer");
//   }

//   @override
//   void initState() {
//     ontheLoad();
//     super.initState();
//   }

//   Widget allItemsVertically() {
//     return StreamBuilder(
//         stream: productsStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           return snapshot.hasData
//               ? ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: snapshot.data.docs.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.docs[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Details(
//                                       detail: ds["Detail"],
//                                       image: ds["Image"],
//                                       name: ds["Name"],
//                                       price: ds["Price"],
//                                       shortDescription: ds["ShortDescription"],
//                                       features: ds["Features"],
//                                       howToUse: ds["HowToUse"],
//                                       packaging: ds["Packaging"],
//                                       ytLink: ds["YouTubeLink"],
//                                       category: ds["Category"],
//                                     )));
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(right: 20, bottom: 20),
//                         child: Material(
//                           elevation: 5.0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: EdgeInsets.all(5),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image.network(
//                                     ds["Image"],
//                                     height: 120,
//                                     width: 120,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 20.0,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Container(
//                                       width:
//                                           MediaQuery.of(context).size.width / 2,
//                                       child: Text(
//                                         ds["Name"],
//                                         style: AppWidget.semiStyle(),
//                                       ),
//                                     ),
//                                     SizedBox(height: 5.0),
//                                     Container(
//                                       width:
//                                           MediaQuery.of(context).size.width / 2,
//                                       child: Text(
//                                         ds["ShortDescription"],
//                                         style: AppWidget.LightTextFieldStyle(),
//                                       ),
//                                     ),
//                                     SizedBox(height: 5.0),
//                                     Container(
//                                       width:
//                                           MediaQuery.of(context).size.width / 2,
//                                       child: Text(
//                                         "\₹" + ds["Price"],
//                                         style:
//                                             AppWidget.semiBoldTextFieldStyle(),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   })
//               : CircularProgressIndicator();
//         });
//   }

//   Widget allItems() {
//     return StreamBuilder(
//         stream: productsStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           return snapshot.hasData
//               ? ListView.builder(
//                   padding: EdgeInsets.zero,
//                   itemCount: snapshot.data.docs.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot ds = snapshot.data.docs[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Details(
//                                       detail: ds["Detail"],
//                                       image: ds["Image"],
//                                       name: ds["Name"],
//                                       price: ds["Price"],
//                                       shortDescription: ds["ShortDescription"],
//                                       features: ds["Features"],
//                                       howToUse: ds["HowToUse"],
//                                       packaging: ds["Packaging"],
//                                       ytLink: ds["YouTubeLink"],
//                                       category: ds["Category"],
//                                     )));
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(4),
//                         child: Material(
//                           elevation: 5.0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: EdgeInsets.all(14),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Image.network(
//                                     ds["Image"],
//                                     height: 150,
//                                     width: 150,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Text(
//                                   ds["Name"],
//                                   style: AppWidget.semiStyle(),
//                                 ),
//                                 SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text(
//                                   ds["ShortDescription"],
//                                   style: AppWidget.LightTextFieldStyle(),
//                                 ),
//                                 SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text(
//                                   "\₹" + ds["Price"],
//                                   style: AppWidget.semiBoldTextFieldStyle(),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   })
//               : CircularProgressIndicator();
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 50.0, left: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Hello Viswesh,", style: AppWidget.boldTextFieldStyle()),
//                 Container(
//                   margin: EdgeInsets.only(right: 20.0),
//                   padding: EdgeInsets.all(3),
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 2, 46, 15),
//                       borderRadius: BorderRadius.circular(8)),
//                   child:
//                       Icon(Icons.notifications_outlined, color: Colors.white),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Text("Nurture Naturally",
//                 style: AppWidget.HeadLineTextFieldStyle()),
//             Text("Empowering Agriculture with Organic Solutions",
//                 style: AppWidget.LightTextFieldStyle()),
//             SizedBox(
//               height: 30.0,
//             ),
//             Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
//             SizedBox(
//               height: 20.0,
//             ),
//             Container(height: 270, child: allItems()),
//             SizedBox(
//               height: 15.0,
//             ),
//             SingleChildScrollView(
//               child: Container(height: 230, child: allItemsVertically()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget showItem() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () async {
//             biofertilizer = true;
//             organicsolution = false;
//             growthenhancer = false;
//             naturalpesticide = false;
//             productsStream =
//                 await DatabaseMethods().getProduct("Bio-Fertilizer");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: biofertilizer
//                       ? Color.fromARGB(255, 2, 46, 15)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(8)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/biofertilizer.png",
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//                 //color: biofertilizer ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             biofertilizer = false;
//             organicsolution = true;
//             growthenhancer = false;
//             naturalpesticide = false;
//             productsStream =
//                 await DatabaseMethods().getProduct("Organic-Solution");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: organicsolution
//                       ? Color.fromARGB(255, 2, 46, 15)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(8)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/organicsolution.png",
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//                 //color: biofertilizer ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             biofertilizer = false;
//             organicsolution = false;
//             growthenhancer = true;
//             naturalpesticide = false;
//             productsStream =
//                 await DatabaseMethods().getProduct("Growth-Enhancer");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: growthenhancer
//                       ? Color.fromARGB(255, 2, 46, 15)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(8)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/growthenhancer.png",
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//                 //color: biofertilizer ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             biofertilizer = false;
//             organicsolution = false;
//             growthenhancer = false;
//             naturalpesticide = true;
//             productsStream =
//                 await DatabaseMethods().getProduct("Natural-Pesticides");
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: naturalpesticide
//                       ? Color.fromARGB(255, 2, 46, 15)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(8)),
//               padding: EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/naturalpesticide.png",
//                 height: 60,
//                 width: 60,
//                 fit: BoxFit.cover,
//                 //color: biofertilizer ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import "package:cloud_firestore/cloud_firestore.dart";
import "package:ecommerce_app/pages/details.dart";
import "package:ecommerce_app/pages/search_page.dart";
import "package:ecommerce_app/service/database.dart";
import "package:ecommerce_app/service/shared_pref.dart";
import "package:flutter/material.dart";

import "../widget/widget_support.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool biofertilizer = false,
      growthenhancer = false,
      naturalpesticide = false,
      organicsolution = false;
  String? profile, name, email;

  Stream? productsStream;
  getthesharedpref() async {
    profile = await SharedPreferenceHelper().getUserProfile();
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  onthisload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    onLoad();
    onthisload();
    super.initState();
  }

  onLoad() async {
    productsStream = await DatabaseMethods().getProduct("allproducts");
    setState(() {});
  }

  Widget allItemsVertically() {
    return StreamBuilder(
      stream: productsStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<DocumentSnapshot> documents = snapshot.data.docs;

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: documents.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = documents[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      detail: ds["Detail"],
                      image: ds["Image"],
                      name: ds["Name"],
                      price: ds["Price"],
                      shortDescription: ds["ShortDescription"],
                      features: ds["Features"],
                      howToUse: ds["HowToUse"],
                      packaging: ds["Packaging"],
                      ytLink: ds["YouTubeLink"],
                      category: ds["Category"],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 20, bottom: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            ds["Image"],
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                ds["Name"],
                                style: AppWidget.semiStyle(),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                ds["ShortDescription"],
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "\₹${ds["Price"]}",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget allItems() {
    return StreamBuilder(
      stream: productsStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<DocumentSnapshot> documents = snapshot.data.docs;

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: documents.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = documents[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      detail: ds["Detail"],
                      image: ds["Image"],
                      name: ds["Name"],
                      price: ds["Price"],
                      shortDescription: ds["ShortDescription"],
                      features: ds["Features"],
                      howToUse: ds["HowToUse"],
                      packaging: ds["Packaging"],
                      ytLink: ds["YouTubeLink"],
                      category: ds["Category"],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(4),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            ds["Image"],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          ds["Name"],
                          style: AppWidget.semiStyle(),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          ds["ShortDescription"],
                          style: AppWidget.LightTextFieldStyle(),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "\₹${ds["Price"]}",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello $name!", style: AppWidget.boldTextFieldStyle()),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ),
                    ),
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 46, 15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text("Nurture Naturally",
                style: AppWidget.HeadLineTextFieldStyle()),
            Text(
              "Empowering Agriculture with Organic Solutions",
              style: AppWidget.LightTextFieldStyle(),
            ),
            SizedBox(height: 30.0),
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(height: 20.0),
            Container(height: 270, child: allItems()),
            SizedBox(height: 15.0),
            SingleChildScrollView(
              child: Container(height: 220, child: allItemsVertically()),
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            biofertilizer = true;
            organicsolution = false;
            growthenhancer = false;
            naturalpesticide = false;
            productsStream =
                await DatabaseMethods().getProduct("Bio-Fertilizer");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: biofertilizer
                        ? Color.fromARGB(255, 2, 46, 15)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "images/biofertilizer.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Bio-Fertilizer",
                  style: TextStyle(fontSize: 6), // Small text style
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            biofertilizer = false;
            organicsolution = true;
            growthenhancer = false;
            naturalpesticide = false;
            productsStream =
                await DatabaseMethods().getProduct("Organic-Solution");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: organicsolution
                        ? Color.fromARGB(255, 2, 46, 15)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "images/organicsolution.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Organic Solution",
                  style: TextStyle(fontSize: 6), // Small text style
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            biofertilizer = false;
            organicsolution = false;
            growthenhancer = true;
            naturalpesticide = false;
            productsStream =
                await DatabaseMethods().getProduct("Growth-Enhancer");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: growthenhancer
                        ? Color.fromARGB(255, 2, 46, 15)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "images/growthenhancer.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Growth Enhancer",
                  style: TextStyle(fontSize: 6), // Small text style
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            biofertilizer = false;
            organicsolution = false;
            growthenhancer = false;
            naturalpesticide = true;
            productsStream =
                await DatabaseMethods().getProduct("Natural-Pesticides");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: naturalpesticide
                        ? Color.fromARGB(255, 2, 46, 15)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "images/naturalpesticide.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Natural Pesticide",
                  style: TextStyle(fontSize: 6), // Small text style
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
