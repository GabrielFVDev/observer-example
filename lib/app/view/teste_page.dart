import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/app_widget.dart';
import 'package:flutter_application_3/app/service/overlay_service.dart';
import 'package:flutter_application_3/app/widgets/custom_overlay.dart';
import 'package:flutter_application_3/app/widgets/verification_step_card.dart';
import 'package:routefly/routefly.dart';

class TestePage extends StatelessWidget {
  const TestePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Dados Pessoais'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dados Pessoais',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const VerificationStepCard(
                    title: 'Verificação de Documentos',
                    description: 'RG, CNH ou outro documento oficial com foto',
                    icon: Icons.description,
                    state: VerificationState.success,
                  ),
                  const SizedBox(width: 16.0),
                  const VerificationStepCard(
                    title: 'Comprovante de residência',
                    description:
                        'Fatura de Água, luz, internet ou Cartão dos últimos 60 dias.',
                    icon: Icons.home,
                    state: VerificationState.inProgress,
                  ),
                  const SizedBox(width: 16.0),
                  VerificationStepCard(
                    title: 'Reconhecimento facial',
                    description:
                        'Faça uma selfie para verificar confirmar a sua identidade',
                    icon: Icons.face,
                    state: VerificationState.error,
                    onActionPressed: () =>
                        print('Iniciar reconhecimento facial'),
                  ),
                  const SizedBox(width: 16.0),
                  VerificationStepCard(
                    title: 'Reconhecimento facial',
                    description:
                        'Faça uma selfie para verificar confirmar a sua identidade',
                    icon: Icons.face,
                    state: VerificationState.initial,
                    onActionPressed: () =>
                        print('Iniciar reconhecimento facial'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
