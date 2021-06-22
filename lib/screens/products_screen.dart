import 'package:flutter/material.dart';
import 'package:shopify/widgets/single_product.dart';

import '../widgets/search.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final availableHeight = size.height - padding.top;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: availableHeight * 0.09, child: SearchWidget()),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SingleProduct(), SingleProduct()],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SingleProduct(), SingleProduct()],
          ),
        ],
      ),
    ));
  }
}
