import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/app_widget.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Routefly.push(routePaths.teste),
          child: const Text('Ir para Jorge'),
        ),
      ),
    );
  }
}
