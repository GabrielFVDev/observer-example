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
            await BottomSheetService.showModal(
              context: context,
              builder: (context) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Conteúdo do BottomSheet'),
              ),
            );
          },
          child: const Text('Anexar Documento'),
        ),
      ),
    );
  }
}
