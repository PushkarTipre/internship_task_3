import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_widgets/feeds_widget.dart';
import '../models/products_model.dart';
import '../services/api_handler.dart';

class Feeds_Screen extends StatefulWidget {
  const Feeds_Screen({
    super.key,
  });

  @override
  State<Feeds_Screen> createState() => _Feeds_ScreenState();
}

class _Feeds_ScreenState extends State<Feeds_Screen> {
  List<ProductsModel> productList = [];
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  @override
  Future<void> getProducts() async {
    productList = await APIHnadler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: productList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              shrinkWrap: true,
              itemCount: productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                    value: productList[index], child: Feeds_Widget());
              },
            ),
    );
  }
}
