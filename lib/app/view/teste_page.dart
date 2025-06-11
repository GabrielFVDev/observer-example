import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/service/bottom_sheet_service.dart';
import 'package:flutter_application_3/app/widgets/verification_step_card.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    void _openCamera() {
      // Sua lógica para abrir a câmera
      print('Abrindo câmera...');
    }

    void _openGallery() {
      // Sua lógica para abrir galeria
      print('Abrindo galeria...');
    }

    return ElevatedButton(
      onPressed: () async {
        final result = await BottomSheetService.showDocumentPicker(context);

        if (result != null) {
          switch (result) {
            case 'camera':
              // Lógica para abrir câmera
              _openCamera();
              break;
            case 'gallery':
              // Lógica para escolher documento da galeria
              _openGallery();
              break;
          }
        }
      },
      child: Text('Anexar Documento'),
    );
  }
}
