import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String desc;
  final int price;
  final List<String> images;

  Product(
      {@required this.id,
      @required this.name,
      @required this.desc,
      @required this.price,
      @required this.images});
}
