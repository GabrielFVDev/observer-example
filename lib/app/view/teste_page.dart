import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/service/bottom_sheet_service.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teste')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            CoinModalBottomSheetService().showCustomBottomSheet(
              context: context,
              height: 220,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Anexar Documento',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implementar lógica para abrir a câmera
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Abrir Câmera'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implementar lógica para escolher um documento
                      },
                      icon: const Icon(Icons.attach_file),
                      label: const Text('Escolher Documento'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text('Anexar Documento'),
        ),
      ),
    );
  }
}
