import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import 'feeds_widget.dart';

class Feeds_Grid_Widget extends StatelessWidget {
  const Feeds_Grid_Widget({Key? key, required this.productsList})
      : super(key: key);
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
              value: productsList[index], child: Feeds_Widget());
        });
  }
}
