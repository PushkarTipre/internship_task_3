import 'package:flutter/material.dart';
import 'package:internship_task_3/custom_widgets/users_widget.dart';

import 'package:internship_task_3/models/users_model.dart';
import 'package:provider/provider.dart';

import '../services/api_handler.dart';

class Users_Screen extends StatelessWidget {
  const Users_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
          future: APIHnadler.getAllUsers(),
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
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index], child: Users_Widget());
                  });
            }
          })),
    );
  }
}
