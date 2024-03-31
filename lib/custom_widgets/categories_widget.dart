import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:internship_task_3/consts/global_colors.dart';
import 'package:internship_task_3/models/categories_model.dart';
import 'package:provider/provider.dart';

class Categories_Widget extends StatefulWidget {
  const Categories_Widget({super.key});

  @override
  State<Categories_Widget> createState() => _Categories_WidgetState();
}

class _Categories_WidgetState extends State<Categories_Widget> {
  @override
  Widget build(BuildContext context) {
    final categoriesModel = Provider.of<CategoriesModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.45,
              width: size.width * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: categoriesModel.image.toString(),
              boxFit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(categoriesModel.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      backgroundColor: lightCardColor.withOpacity(0.5),
                      fontSize: 24)),
            ),
          )
        ],
      ),
    );
  }
}
