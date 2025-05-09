import 'package:flutter/material.dart';
import 'package:navegabilidadgorouter/views/custom_drawer.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const CustomDrawer(), // Drawer persistente para todas las vistas
      body: body,
    );
  }
}