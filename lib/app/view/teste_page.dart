import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/app_widget.dart';
import 'package:flutter_application_3/app/service/overlay_service.dart';
import 'package:flutter_application_3/app/widgets/custom_overlay.dart';
import 'package:routefly/routefly.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Teste Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Routefly.push(routePaths.home),
            child: const Text('voltar'),
          ),
          ElevatedButton(
            onPressed: () => OverlayService.showOverlay(
              context: context,
              child: const CustomOverlay(),
            ),
            child: const Text('Mostrar Overlay'),
          ),
        ],
      ),
    );
  }
}
