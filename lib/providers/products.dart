import 'package:flutter/material.dart';
import 'package:shopify/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
}
