import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:internship_task_3/consts/global_colors.dart';

class Users_Widget extends StatelessWidget {
  const Users_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
        boxFit: BoxFit.fill,
      ),
      title: Text('User Name'),
      subtitle: Text('User Email'),
      trailing: Text(
        'User Role',
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
