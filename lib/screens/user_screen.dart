import 'package:flutter/material.dart';
import 'package:internship_task_3/custom_widgets/users_widget.dart';

class Users_Screen extends StatelessWidget {
  const Users_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Users_Widget();
          }),
    );
  }
}
