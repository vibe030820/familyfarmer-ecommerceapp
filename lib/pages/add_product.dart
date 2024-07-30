// import 'dart:io';

// import 'package:ecommerce_app/service/database.dart';
// import 'package:ecommerce_app/widget/widget_support.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';

// class AddProduct extends StatefulWidget {
//   const AddProduct({super.key});

//   @override
//   State<AddProduct> createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   final List<String> categories = [
//     'Bio-Fertilizer',
//     'Growth-Enhancer',
//     'Natural-Pesticides',
//     'Organic-Solution'
//   ];
//   String? selectedCategory;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController detailController = TextEditingController();
//   TextEditingController shortDescriptionController = TextEditingController();
//   TextEditingController featuresController = TextEditingController();
//   TextEditingController howToUseController = TextEditingController();
//   TextEditingController packagingController = TextEditingController();
//   TextEditingController ytLinkController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;

//   Future getImage() async {
//     var image = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       selectedImage = File(image!.path);
//     });
//   }

//   uploadItem() async {
//     if (selectedImage != null &&
//         nameController.text.isNotEmpty &&
//         priceController.text.isNotEmpty &&
//         detailController.text.isNotEmpty &&
//         shortDescriptionController.text.isNotEmpty &&
//         featuresController.text.isNotEmpty &&
//         howToUseController.text.isNotEmpty &&
//         packagingController.text.isNotEmpty &&
//         ytLinkController.text.isNotEmpty &&
//         selectedCategory != null) {
//       String addId = randomAlphaNumeric(10);

//       Reference firebaseStorageRef =
//           FirebaseStorage.instance.ref().child("productImages").child(addId);
//       final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

//       var downloadUrl = await (await task).ref.getDownloadURL();

//       Map<String, dynamic> addItem = {
//         "Image": downloadUrl,
//         "Name": nameController.text,
//         "Price": priceController.text,
//         "Detail": detailController.text,
//         "ShortDescription": shortDescriptionController.text,
//         "Features": featuresController.text,
//         "HowToUse": howToUseController.text,
//         "Packaging": packagingController.text,
//         "YouTubeLink": ytLinkController.text,
//         "Category": selectedCategory,
//       };

//       await DatabaseMethods()
//           .addProduct(addItem, selectedCategory!)
//           .then((value) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Product has been added successfully",
//               style: TextStyle(fontSize: 18.0),
//             )));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Color(0xFF373866),
//             )),
//         centerTitle: true,
//         title: Text(
//           "Add Item",
//           style: AppWidget.boldTextFieldStyle(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin:
//               EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Upload the Item Picture",
//                 style: AppWidget.semiBoldTextFieldStyle(),
//               ),
//               SizedBox(height: 20.0),
//               selectedImage == null
//                   ? GestureDetector(
//                       onTap: () {
//                         getImage();
//                       },
//                       child: Center(
//                         child: Material(
//                           elevation: 4.0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             width: 150,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.black, width: 1.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Icon(
//                               Icons.camera_alt_outlined,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: Material(
//                         elevation: 4.0,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black, width: 1.5),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.file(
//                               selectedImage!,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//               SizedBox(height: 30.0),
//               buildTextField("Item Name", nameController, "Enter Item Name"),
//               buildTextField("Item Price", priceController, "Enter Item Price"),
//               buildTextField(
//                   "Item Detail", detailController, "Enter Item Detail",
//                   maxLines: 6),
//               buildTextField("Short Description", shortDescriptionController,
//                   "Enter Short Description",
//                   maxLines: 3),
//               buildTextField("Features", featuresController, "Enter Features",
//                   maxLines: 3),
//               buildTextField(
//                   "How to Use", howToUseController, "Enter How to Use",
//                   maxLines: 3),
//               buildTextField(
//                   "Packaging", packagingController, "Enter Packaging Details",
//                   maxLines: 3),
//               buildTextField(
//                   "YouTube Link", ytLinkController, "Enter YouTube Link"),
//               SizedBox(height: 20.0),
//               Text(
//                 "Select Category",
//                 style: AppWidget.semiBoldTextFieldStyle(),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Color(0xFFececf8),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     items: categories
//                         .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                   fontSize: 18.0, color: Colors.black),
//                             )))
//                         .toList(),
//                     onChanged: (value) => setState(() {
//                       selectedCategory = value;
//                     }),
//                     dropdownColor: Colors.white,
//                     hint: Text("Select Category"),
//                     iconSize: 36,
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black,
//                     ),
//                     value: selectedCategory,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30.0),
//               GestureDetector(
//                 onTap: () {
//                   uploadItem();
//                 },
//                 child: Center(
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 5.0),
//                       width: 150,
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                         child: Text(
//                           "Add",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(
//       String label, TextEditingController controller, String hint,
//       {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: AppWidget.semiBoldTextFieldStyle(),
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: Color(0xFFececf8),
//               borderRadius: BorderRadius.circular(10)),
//           child: TextField(
//             controller: controller,
//             maxLines: maxLines,
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hint,
//                 hintStyle: AppWidget.LightTextFieldStyle()),
//           ),
//         ),
//         SizedBox(height: 30.0),
//       ],
//     );
//   }
// }
import 'dart:io';

import 'package:ecommerce_app/service/database.dart';
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> categories = [
    'Bio-Fertilizer',
    'Growth-Enhancer',
    'Natural-Pesticides',
    'Organic-Solution'
  ];
  String? selectedCategory;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController featuresController = TextEditingController();
  TextEditingController howToUseController = TextEditingController();
  TextEditingController packagingController = TextEditingController();
  TextEditingController ytLinkController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  uploadItem() async {
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        detailController.text.isNotEmpty &&
        shortDescriptionController.text.isNotEmpty &&
        featuresController.text.isNotEmpty &&
        howToUseController.text.isNotEmpty &&
        packagingController.text.isNotEmpty &&
        ytLinkController.text.isNotEmpty &&
        selectedCategory != null) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("productImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Detail": detailController.text,
        "ShortDescription": shortDescriptionController.text,
        "Features": featuresController.text,
        "HowToUse": howToUseController.text,
        "Packaging": packagingController.text,
        "YouTubeLink": ytLinkController.text,
        "Category": selectedCategory,
      };

      Map<String, dynamic> allProductItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Detail": detailController.text,
        "ShortDescription": shortDescriptionController.text,
        "Features": featuresController.text,
        "HowToUse": howToUseController.text,
        "Packaging": packagingController.text,
        "YouTubeLink": ytLinkController.text,
        "Category": selectedCategory,
      };

      // Add product to specific category collection
      await DatabaseMethods()
          .addProduct(addItem, selectedCategory!)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Product has been added to the category successfully",
              style: TextStyle(fontSize: 18.0),
            )));
      });

      // Add product to allproducts collection
      await DatabaseMethods()
          .addProduct(allProductItem, "allproducts")
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Product has been added to all products successfully",
              style: TextStyle(fontSize: 18.0),
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.boldTextFieldStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the Item Picture",
                style: AppWidget.semiBoldTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 30.0),
              buildTextField("Item Name", nameController, "Enter Item Name"),
              buildTextField("Item Price", priceController, "Enter Item Price"),
              buildTextField(
                  "Item Detail", detailController, "Enter Item Detail",
                  maxLines: 6),
              buildTextField("Short Description", shortDescriptionController,
                  "Enter Short Description",
                  maxLines: 3),
              buildTextField("Features", featuresController, "Enter Features",
                  maxLines: 3),
              buildTextField(
                  "How to Use", howToUseController, "Enter How to Use",
                  maxLines: 3),
              buildTextField(
                  "Packaging", packagingController, "Enter Packaging Details",
                  maxLines: 3),
              buildTextField(
                  "YouTube Link", ytLinkController, "Enter YouTube Link"),
              SizedBox(height: 20.0),
              Text(
                "Select Category",
                style: AppWidget.semiBoldTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categories
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )))
                        .toList(),
                    onChanged: (value) => setState(() {
                      selectedCategory = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: selectedCategory,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, TextEditingController controller, String hint,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppWidget.semiBoldTextFieldStyle(),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xFFececf8),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: AppWidget.LightTextFieldStyle()),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
