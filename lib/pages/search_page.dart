// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// // Replace with your product data model and retrieval logic
// class Product {
//   final String name;
//   final String imageUrl;

//   Product(this.name, this.imageUrl);
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final _searchTextController = TextEditingController();
//   final _speech = SpeechToText();
//   bool _isListening = false;
//   String _searchQuery = ''; // Store the recognized speech

//   // Replace with your product data (list of Product objects)
//   List<Product> _products = [];

//   @override
//   void initState() {
//     super.initState();
//     _speech.initialize();
//   }

//   void _toggleListening() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize();
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(onResult: _onSpeechResult);
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//       _performSearch(_searchQuery); // Search after speech recognition stops
//     }
//   }

//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       _searchQuery = result.recognizedWords;
//       _searchTextController.text = _searchQuery;
//     });
//   }

//   void _performSearch(String query) async {
//     // Replace with your logic to fetch products based on the search query
//     // This example simulates product retrieval based on keywords
//     List<Product> foundProducts = [];
//     for (Product product in _products) {
//       if (product.name.toLowerCase().contains(query.toLowerCase())) {
//         foundProducts.add(product);
//       }
//     }
//     setState(() => _products = foundProducts);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _searchTextController,
//           ),
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(_isListening ? Icons.mic : Icons.mic_off),
//                 onPressed: _toggleListening,
//               ),
//               ElevatedButton(
//                 onPressed: () => _performSearch(_searchTextController.text),
//                 child: Text('Search'),
//               ),
//             ],
//           ),
//           // Display search results here
//           _products.isEmpty
//               ? Text('No products found. Browse from our categories.')
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: _products.length,
//                     itemBuilder: (context, index) =>
//                         ProductCard(product: _products[index]),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }

// // Replace with your product card widget (assuming it displays product name and image)
// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(product.name),
//         leading: Image.network(product.imageUrl),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// // Replace with your product data model and retrieval logic
// class Product {
//   final String name;
//   final String imageUrl;

//   Product(this.name, this.imageUrl);
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final _searchTextController = TextEditingController();
//   final _speech = SpeechToText();
//   bool _isListening = false;
//   String _searchQuery = ''; // Store the recognized speech

//   // Replace with your product data (list of Product objects)
//   List<Product> _products = [
//     Product('apple', 'https://example.com/apple.jpg'),
//     Product('banana', 'https://example.com/banana.jpg'),
//     Product('orange', 'https://example.com/orange.jpg'),
//   ]; // Dummy data for demonstration

//   @override
//   void initState() {
//     super.initState();
//     _initializeSpeech();
//   }

//   void _initializeSpeech() async {
//     bool available = await _speech.initialize();
//     if (!available) {
//       print('The user has denied the use of speech recognition.');
//     }
//   }

//   void _toggleListening() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize();
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(onResult: _onSpeechResult);
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//       _performSearch(_searchQuery); // Search after speech recognition stops
//     }
//   }

//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       _searchQuery = result.recognizedWords;
//       _searchTextController.text = _searchQuery;
//       _performSearch(_searchQuery); // Trigger search after voice recognition
//     });
//   }

//   void _performSearch(String query) async {
//     // Replace with your logic to fetch products based on the search query
//     // This example simulates product retrieval based on keywords
//     List<Product> foundProducts = [];
//     for (Product product in _products) {
//       if (product.name.toLowerCase().contains(query.toLowerCase())) {
//         foundProducts.add(product);
//       }
//     }
//     setState(() => _products = foundProducts);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: SizedBox(
//           height: kToolbarHeight,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 36,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: TextField(
//                     controller: _searchTextController,
//                     onChanged: _performSearchAuto, // Trigger search on change
//                     decoration: InputDecoration(
//                       hintText: 'Search for products, brands and more',
//                       contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                       border: InputBorder.none,
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: () =>
//                             _performSearch(_searchTextController.text),
//                       ),
//                     ),
//                     onSubmitted: (text) => _performSearch(text),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.mic),
//                 onPressed: _toggleListening,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: _products.isEmpty
//           ? Center(
//               child: Text('No products found. Browse from our categories.'),
//             )
//           : ListView.builder(
//               itemCount: _products.length,
//               itemBuilder: (context, index) =>
//                   ProductCard(product: _products[index]),
//             ),
//     );
//   }

//   void _performSearchAuto(String query) {
//     // Trigger search automatically when text changes
//     _performSearch(query);
//   }
// }

// // Replace with your product card widget (assuming it displays product name and image)
// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(12),
//         title: Text(
//           product.name,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         leading: Image.network(
//           product.imageUrl,
//           width: 60,
//           height: 60,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// // Replace with your product data model and retrieval logic (assuming allProducts is a List<Product>)
// class Product {
//   final String name;
//   final String imageUrl;
//   final String shortDescription;

//   Product(this.name, this.imageUrl, this.shortDescription);
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final _searchTextController = TextEditingController();
//   final _speech = SpeechToText();
//   bool _isListening = false;
//   String _searchQuery = ''; // Store the recognized speech
//   List<Product> _searchResults = []; // List to store search results

//   bool compareProductName(String query, Product product) {
//     return product.name.toLowerCase().contains(query.toLowerCase());
//   }

//   void _initializeSpeech() async {
//     bool available = await _speech.initialize();
//     if (!available) {
//       print('The user has denied the use of speech recognition.');
//     }
//   }

//   void _toggleListening() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize();
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(onResult: _onSpeechResult);
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }

//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       _searchQuery = result.recognizedWords;
//       _searchTextController.text = _searchQuery;
//       _performSearch(_searchQuery);
//     });
//   }

//   void _performSearch(String query) async {
//     _searchResults.clear(); // Clear previous results before searching
//     _searchResults = allProducts.where((product) => compareProductName(query, product)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: SizedBox(
//           height: kToolbarHeight,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 36,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: TextField(
//                     controller: _searchTextController,
//                     onChanged: _performSearchAuto, // Trigger search on text change
//                     decoration: InputDecoration(
//                       hintText: 'Search for products, brands and more',
//                       contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                       border: InputBorder.none,
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: () =>
//                             _performSearch(_searchTextController.text),
//                       ),
//                     ),
//                     onSubmitted: (text) => _performSearch(text),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.mic),
//                 onPressed: _toggleListening,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: _searchResults.isEmpty
//           ? Center(
//               child: Text('No products found. Browse from our categories.'),
//             )
//           : ListView.builder(
//               itemCount: _searchResults.length,
//               itemBuilder: (context, index) => ProductCard(
//                 product: _searchResults[index],
//               ),
//             ),
//     );
//   }

//   void _performSearchAuto(String query) {
//     _performSearch(query);
//   }
// }

// // Replace with your product card widget
// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(12),
//         title: Text(
//           product.name,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//                 leading: Image.network(
//           product.imageUrl,
//           width: 60,
//           height: 60,
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) =>
//               Icon(Icons.error), // Display error icon if image fails to load
//         ),
//         subtitle: Text(product.shortDescription),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'details.dart'; // Import your details page here

class Product {
  final String name;
  final String imageUrl;
  final String shortDescription;
  final String price;
  final String detail;
  final String features;
  final String howToUse;
  final String packaging;
  final String ytLink;
  final String category;

  Product({
    required this.name,
    required this.imageUrl,
    required this.shortDescription,
    required this.price,
    required this.detail,
    required this.features,
    required this.howToUse,
    required this.packaging,
    required this.ytLink,
    required this.category,
  });

  // Factory method to create a Product from Firestore document
  factory Product.fromDocument(DocumentSnapshot doc) {
    return Product(
      name: doc['Name'],
      imageUrl: doc['Image'],
      shortDescription: doc['ShortDescription'],
      price: doc['Price'], // Ensure proper conversion
      detail: doc['Detail'],
      features: doc['Features'],
      howToUse: doc['HowToUse'],
      packaging: doc['Packaging'],
      ytLink: doc['YouTubeLink'],
      category: doc['Category'],
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();
  final _speech = SpeechToText();
  bool _isListening = false;
  String _searchQuery = ''; // Store the recognized speech
  List<Product> _products = []; // Start with an empty list
  bool _isLoading = false; // Track loading state for search
  bool _isSearchStarted = false; // Track if the search has started

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    bool available = await _speech.initialize();
    if (!available) {
      print('The user has denied the use of speech recognition.');
    }
  }

  void _toggleListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: _onSpeechResult);
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _searchQuery = result.recognizedWords.toLowerCase().replaceAll(' ', '');
      _searchTextController.text =
          result.recognizedWords; // Update in real-time
      _isListening = false; // Update listening state
    });
    _speech.stop(); // Stop listening after recognizing the input
    _performSearch(_searchQuery); // Trigger search after voice recognition
  }

  void _performSearch(String query) async {
    setState(() {
      _isLoading = true;
      _isSearchStarted = true; // Mark that the search has started
    });
    // Fetch products from Firestore based on the search query
    List<Product> foundProducts = await fetchProducts(query);
    setState(() {
      _products = foundProducts;
      _isLoading = false;
    });
  }

  Future<List<Product>> fetchProducts(String query) async {
    List<Product> foundProducts = [];
    // Fetch products from Firestore where the name contains the search query
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('allproducts').get();

    for (var doc in snapshot.docs) {
      String productName = doc['Name'].toLowerCase().replaceAll(' ', '');
      if (productName.contains(query)) {
        foundProducts.add(Product.fromDocument(doc));
      }
    }
    return foundProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: _searchTextController,
                    onChanged: (text) => _performSearch(
                      text.toLowerCase().replaceAll(' ', ''),
                    ), // Trigger search on change
                    decoration: InputDecoration(
                      hintText: 'Search for products, and more',
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => _performSearch(
                          _searchTextController.text
                              .toLowerCase()
                              .replaceAll(' ', ''),
                        ),
                      ),
                    ),
                    onSubmitted: (text) => _performSearch(
                      text.toLowerCase().replaceAll(' ', ''),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: _toggleListening,
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _products.isEmpty && _isSearchStarted
              ? Center(
                  child: Text('No products found. Browse from our categories.'),
                )
              : ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) =>
                      ProductCard(product: _products[index]),
                ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        title: Text(
          product.name,
          style: AppWidget.HeadLineTextFieldStyle(),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.shortDescription,
              style: AppWidget.LightTextFieldStyle(),
            ),
            Text('\₹${product.price}',
                style: AppWidget.semiBoldTextFieldStyle()),
          ],
        ),
        leading: Image.network(
          product.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        onTap: () {
          // Navigate to the details page with all required parameters
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                detail: product.detail,
                image: product.imageUrl,
                name: product.name,
                price: product.price, // Convert double to String
                shortDescription: product.shortDescription,
                features: product.features,
                howToUse: product.howToUse,
                packaging: product.packaging,
                ytLink: product.ytLink,
                category: product.category,
              ),
            ),
          );
        },
      ),
    );
  }
}
