import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/service/overlay_service.dart';

class CustomOverlay extends StatelessWidget {
  const CustomOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      child: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Este é um overlay!'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => OverlayService.hideOverlay(),
                child: const Text('Fechar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
