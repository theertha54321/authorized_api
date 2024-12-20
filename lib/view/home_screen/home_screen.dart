import 'package:authorized_api/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
       await context.read<HomeController>().fetchAllProducts(context);
      }),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}