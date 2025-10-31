import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Products", style: TextStyle())],
          ),
        ),
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}

enum Product { dart, flutter, firebase }

extension ProductInfo on Product {
  String get title {
    switch(this) {
      case Product.dart:
        return "Dart";
      case Product.flutter:
        return "Flutter";
      case Product.firebase:
        return "Firebase";
    }
  }

  String get description {
    switch(this) {
      case Product.dart:
        return "the best object language";
      case Product.flutter:
        return "the best mobile widget library";
      case Product.firebase:
        return "the best cloud database";
    }
  }

  String get image {
    switch(this) {
      case Product.dart:
        return "assets/ex3/dart.png";
      case Product.flutter:
        return "assets/ex3/flutter.png";
      case Product.firebase:
        return "assets/ex3/firebase.png";
    }
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.image,
                width: 100,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.description,
                style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 114, 114, 114)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
