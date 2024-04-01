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
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productList = [];
  int limit = 10;
  bool _isLoading = false;
  bool _isLimit = false;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // getProducts();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_isLoading = true;

        limit += 10;
        print("limit $limit");
        if (limit == 51) {
          _isLimit = true;
          setState(() {});
          return;
        }
        await getProducts();
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    productList = await APIHnadler.getAllProducts(
      limit: limit.toString(),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 0.6),
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                            value: productList[index],
                            child: const Feeds_Widget());
                      }),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
    );
  }
}
