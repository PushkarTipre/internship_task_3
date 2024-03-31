import 'package:flutter/material.dart';
import 'package:internship_task_3/custom_widgets/categories_widget.dart';
import 'package:internship_task_3/models/categories_model.dart';
import 'package:provider/provider.dart';

import '../services/api_handler.dart';

class Categoreis_Screen extends StatelessWidget {
  const Categoreis_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<List<CategoriesModel>>(
          future: APIHnadler.getAllCategories(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index], child: Categories_Widget());
                },
              );
            }
          })),
    );
  }
}
