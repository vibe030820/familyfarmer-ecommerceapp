// // import 'package:ecommerce_app/service/database.dart';
// // import 'package:ecommerce_app/service/shared_pref.dart';
// // import 'package:ecommerce_app/widget/widget_support.dart';
// // import 'package:flutter/material.dart';

// // class Details extends StatefulWidget {
// //   String image, name, detail, price;
// //   final String shortDescription,
// //       features,
// //       howToUse,
// //       packaging,
// //       ytLink,
// //       category;
// //   Details({
// //     required this.detail,
// //     required this.image,
// //     required this.name,
// //     required this.price,
// //     required this.shortDescription,
// //     required this.features,
// //     required this.howToUse,
// //     required this.packaging,
// //     required this.ytLink,
// //     required this.category,
// //   });
// //   @override
// //   State<Details> createState() => _DetailsState();
// // }

// // class _DetailsState extends State<Details> {
// //   int a = 1, total = 0;
// //   String? id;

// //   getthesharedpref() async {
// //     id = await SharedPreferenceHelper().getUserId();
// //     setState(() {});
// //   }

// //   ontheload() async {
// //     await getthesharedpref();
// //     setState(() {});
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     ontheload();
// //     total = int.parse(widget.price);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             GestureDetector(
// //                 onTap: () {
// //                   Navigator.pop(context);
// //                 },
// //                 child: Icon(
// //                   Icons.arrow_back_ios_new_outlined,
// //                   color: Colors.black,
// //                 )),
// //             Image.network(
// //               widget.image,
// //               width: MediaQuery.of(context).size.width,
// //               height: MediaQuery.of(context).size.height / 2.5,
// //               fit: BoxFit.fill,
// //             ),
// //             SizedBox(
// //               height: 15.0,
// //             ),
// //             Row(
// //               children: [
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       widget.name,
// //                       style: AppWidget.semiBoldTextFieldStyle(),
// //                     ),
// //                   ],
// //                 ),
// //                 Spacer(),
// //                 GestureDetector(
// //                   onTap: () {
// //                     if (a > 1) {
// //                       --a;
// //                       total = total - int.parse(widget.price);
// //                     }
// //                     setState(() {});
// //                   },
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                         color: Colors.black,
// //                         borderRadius: BorderRadius.circular(8)),
// //                     child: Icon(
// //                       Icons.remove,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(
// //                   width: 20.0,
// //                 ),
// //                 Text(
// //                   a.toString(),
// //                   style: AppWidget.semiBoldTextFieldStyle(),
// //                 ),
// //                 SizedBox(
// //                   width: 20.0,
// //                 ),
// //                 GestureDetector(
// //                   onTap: () {
// //                     ++a;
// //                     total = total + int.parse(widget.price);
// //                     setState(() {});
// //                   },
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                         color: Colors.black,
// //                         borderRadius: BorderRadius.circular(8)),
// //                     child: Icon(
// //                       Icons.add,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 )
// //               ],
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             Text(
// //               widget.detail,
// //               maxLines: 10,
// //               style: AppWidget.LightTextFieldStyle(),
// //             ),
// //             SizedBox(
// //               height: 30.0,
// //             ),
// //             Row(
// //               children: [
// //                 Text(
// //                   "Delivery Time",
// //                   style: AppWidget.semiBoldTextFieldStyle(),
// //                 ),
// //                 SizedBox(
// //                   width: 25.0,
// //                 ),
// //                 Icon(
// //                   Icons.alarm,
// //                   color: Colors.black54,
// //                 ),
// //                 SizedBox(
// //                   width: 5.0,
// //                 ),
// //                 Text(
// //                   "5-7 Days",
// //                   style: AppWidget.semiBoldTextFieldStyle(),
// //                 )
// //               ],
// //             ),
// //             Spacer(),
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 40.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         "Total Price",
// //                         style: AppWidget.semiBoldTextFieldStyle(),
// //                       ),
// //                       Text(
// //                         "\₹" + total.toString(),
// //                         style: AppWidget.HeadLineTextFieldStyle(),
// //                       )
// //                     ],
// //                   ),
// //                   GestureDetector(
// //                     onTap: () async {
// //                       Map<String, dynamic> addtoCart = {
// //                         "Name": widget.name,
// //                         "Quantity": a.toString(),
// //                         "Total": total.toString(),
// //                         "Image": widget.image
// //                       };
// //                       await DatabaseMethods().addToCart(addtoCart, id!);
// //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                           backgroundColor: Colors.orangeAccent,
// //                           content: Text(
// //                             "Product Added to Cart",
// //                             style: TextStyle(fontSize: 18.0),
// //                           )));
// //                     },
// //                     child: Container(
// //                       width: MediaQuery.of(context).size.width / 2,
// //                       padding: EdgeInsets.all(8),
// //                       decoration: BoxDecoration(
// //                           color: Colors.black,
// //                           borderRadius: BorderRadius.circular(10)),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         children: [
// //                           Text(
// //                             "Add to cart",
// //                             style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 16.0,
// //                                 fontFamily: 'Poppins'),
// //                           ),
// //                           SizedBox(
// //                             width: 20.0,
// //                           ),
// //                           Container(
// //                             padding: EdgeInsets.all(3),
// //                             decoration: BoxDecoration(
// //                                 color: Colors.grey,
// //                                 borderRadius: BorderRadius.circular(8)),
// //                             child: Icon(
// //                               Icons.shopping_cart_outlined,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             width: 10.0,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:ecommerce_app/service/database.dart';
// import 'package:ecommerce_app/service/shared_pref.dart';
// import 'package:ecommerce_app/widget/widget_support.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class Details extends StatefulWidget {
//   final String image, name, detail, price;
//   final String shortDescription,
//       features,
//       howToUse,
//       packaging,
//       ytLink,
//       category;

//   Details({
//     required this.detail,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.shortDescription,
//     required this.features,
//     required this.howToUse,
//     required this.packaging,
//     required this.ytLink,
//     required this.category,
//   });

//   @override
//   State<Details> createState() => _DetailsState();
// }

// class _DetailsState extends State<Details> {
//   int quantity = 1;
//   int total = 0;
//   String? id;
//   String? userId;
//   bool _featuresExpanded = false;
//   bool _howToUseExpanded = false;
//   bool _packagingExpanded = false;
//   bool _youtubeExpanded = false;

//   getthesharedpref() async {
//     id = await SharedPreferenceHelper().getUserId();
//     setState(() {});
//   }

//   ontheload() async {
//     await getthesharedpref();
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     ontheload();
//     total = int.parse(widget.price);
//     print(id);
//     // Load userId from SharedPreference if needed
//   }

//   void _toggleExpansion(String section) {
//     setState(() {
//       switch (section) {
//         case 'features':
//           _featuresExpanded = !_featuresExpanded;
//           break;
//         case 'howToUse':
//           _howToUseExpanded = !_howToUseExpanded;
//           break;
//         case 'packaging':
//           _packagingExpanded = !_packagingExpanded;
//           break;
//         case 'youtube':
//           _youtubeExpanded = !_youtubeExpanded;
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: Icon(
//                   Icons.arrow_back_ios_new_outlined,
//                   color: Colors.black,
//                 ),
//               ),
//               Image.network(
//                 widget.image,
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.0,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(height: 15.0),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(widget.name,
//                           style: AppWidget.semiBoldTextFieldStyle()),
//                     ],
//                   ),
//                   Spacer(),
//                   GestureDetector(
//                     onTap: () {
//                       if (quantity > 1) {
//                         setState(() {
//                           quantity--;
//                           total -= int.parse(widget.price);
//                         });
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.remove,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20.0),
//                   Text(
//                     quantity.toString(),
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 20.0),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         quantity++;
//                         total += int.parse(widget.price);
//                       });
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 widget.detail,
//                 maxLines: 10,
//                 style: AppWidget.LightTextFieldStyle(),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 children: [
//                   Text(
//                     "Delivery Time",
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(width: 25.0),
//                   Icon(
//                     Icons.alarm,
//                     color: Colors.black54,
//                   ),
//                   SizedBox(width: 5.0),
//                   Text(
//                     "5-7 Days",
//                     style: AppWidget.semiBoldTextFieldStyle(),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               _buildDropdownSection(
//                 title: 'Features',
//                 content: widget.features,
//                 expanded: _featuresExpanded,
//                 onToggle: () => _toggleExpansion('features'),
//               ),
//               SizedBox(height: 10.0),
//               _buildDropdownSection(
//                 title: 'How To Use',
//                 content: widget.howToUse,
//                 expanded: _howToUseExpanded,
//                 onToggle: () => _toggleExpansion('howToUse'),
//               ),
//               SizedBox(height: 10.0),
//               _buildDropdownSection(
//                 title: 'Packaging',
//                 content: widget.packaging,
//                 expanded: _packagingExpanded,
//                 onToggle: () => _toggleExpansion('packaging'),
//               ),
//               SizedBox(height: 10.0),
//               _buildDropdownSection(
//                 title: 'YouTube Reference',
//                 content: '',
//                 expanded: _youtubeExpanded,
//                 onToggle: () => _toggleExpansion('youtube'),
//                 child: _youtubeExpanded
//                     ? YoutubePlayer(
//                         controller: YoutubePlayerController(
//                           initialVideoId:
//                               YoutubePlayer.convertUrlToId(widget.ytLink)!,
//                           flags: YoutubePlayerFlags(
//                             autoPlay: true,
//                             mute: false,
//                           ),
//                         ),
//                         showVideoProgressIndicator: true,
//                         progressIndicatorColor: Colors.blueAccent,
//                       )
//                     : null,
//               ),
//               SizedBox(height: 30.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Total Price",
//                         style: TextStyle(
//                             fontSize: 18.0, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "\₹$total",
//                         style: TextStyle(
//                             fontSize: 20.0, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       Map<String, dynamic> addToCart = {
//                         "Name": widget.name,
//                         "Quantity": quantity.toString(),
//                         "Total": total.toString(),
//                         "Image": widget.image,
//                       };
//                       print(id);
//                       // Ensure you have a valid userId before calling this
//                       await DatabaseMethods().addToCart(addToCart, id!);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           backgroundColor: Colors.orangeAccent,
//                           content: Text(
//                             "Product Added to Cart",
//                             style: TextStyle(fontSize: 18.0),
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2,
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Add to cart",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           SizedBox(width: 20.0),
//                           Container(
//                             padding: EdgeInsets.all(3),
//                             decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Icon(
//                               Icons.shopping_cart_outlined,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDropdownSection({
//     required String title,
//     required String content,
//     required bool expanded,
//     required VoidCallback onToggle,
//     Widget? child,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onTap: onToggle,
//           child: Row(
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//               Spacer(),
//               Icon(
//                 expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                 color: Colors.black54,
//               ),
//             ],
//           ),
//         ),
//         if (expanded)
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: child ??
//                 Text(
//                   content,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//           ),
//       ],
//     );
//   }
// }

// class VideoPlayerScreen extends StatelessWidget {
//   final String videoUrl;

//   VideoPlayerScreen({required this.videoUrl});

//   @override
//   Widget build(BuildContext context) {
//     YoutubePlayerController _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: Center(
//         child: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.blueAccent,
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce_app/service/database.dart';
import 'package:ecommerce_app/service/shared_pref.dart';
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Details extends StatefulWidget {
  final String image, name, detail, price;
  final String shortDescription,
      features,
      howToUse,
      packaging,
      ytLink,
      category;

  Details({
    required this.detail,
    required this.image,
    required this.name,
    required this.price,
    required this.shortDescription,
    required this.features,
    required this.howToUse,
    required this.packaging,
    required this.ytLink,
    required this.category,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  int total = 0;
  String? id;
  String? userId;
  bool _featuresExpanded = false;
  bool _howToUseExpanded = false;
  bool _packagingExpanded = false;
  bool _youtubeExpanded = false;

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
    total = int.parse(widget.price);
    print(id); // Load userId from SharedPreference if needed
  }

  void _toggleExpansion(String section) {
    setState(() {
      switch (section) {
        case 'features':
          _featuresExpanded = !_featuresExpanded;
          break;
        case 'howToUse':
          _howToUseExpanded = !_howToUseExpanded;
          break;
        case 'packaging':
          _packagingExpanded = !_packagingExpanded;
          break;
        case 'youtube':
          _youtubeExpanded = !_youtubeExpanded;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              ),
              Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.0,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                          total -= int.parse(widget.price);
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    quantity.toString(),
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity++;
                        total += int.parse(widget.price);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                widget.detail,
                maxLines: 10,
                style: AppWidget.LightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    "Delivery Time",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 25.0),
                  Icon(
                    Icons.alarm,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "5-7 Days",
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _buildDropdownSection(
                title: 'Features',
                content: widget.features,
                expanded: _featuresExpanded,
                onToggle: () => _toggleExpansion('features'),
              ),
              SizedBox(height: 10.0),
              _buildDropdownSection(
                title: 'How To Use',
                content: widget.howToUse,
                expanded: _howToUseExpanded,
                onToggle: () => _toggleExpansion('howToUse'),
              ),
              SizedBox(height: 10.0),
              _buildDropdownSection(
                title: 'Packaging',
                content: widget.packaging,
                expanded: _packagingExpanded,
                onToggle: () => _toggleExpansion('packaging'),
              ),
              SizedBox(height: 10.0),
              _buildDropdownSection(
                title: 'YouTube Reference',
                content: widget.ytLink,
                expanded: _youtubeExpanded,
                onToggle: () => _toggleExpansion('youtube'),
                child:
                    _youtubeExpanded ? _buildYoutubeVideo(widget.ytLink) : null,
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\₹$total",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addToCart = {
                        "Name": widget.name,
                        "Quantity": quantity.toString(),
                        "Total": total.toString(),
                        "Image": widget.image,
                      };
                      print(
                          id); // Ensure you have a valid userId before calling this
                      await DatabaseMethods().addToCart(addToCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Product Added to Cart",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Add to cart",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          SizedBox(width: 20.0),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSection({
    required String title,
    required String content,
    required bool expanded,
    required VoidCallback onToggle,
    Widget? child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: child ??
                (title == 'YouTube Reference' && content.isNotEmpty
                    ? _buildYoutubeVideo(content)
                    : Text(
                        content,
                        style: TextStyle(fontSize: 16.0),
                      )),
          ),
      ],
    );
  }

  Widget _buildYoutubeVideo(String videoUrl) {
    final _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: false, // Adjust as needed
        mute: false,
      ),
    );

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      // Specify the height as a named parameter
      //height: 200.0, // Adjust height as needed
    );
  }
}
