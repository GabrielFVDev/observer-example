import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatefulWidget {
  final double? width;
  final double? height;
  final double strokeWidth;
  final Color? backgroundColor;
  final Color? color;

  const GradientCircularProgressIndicator({
    super.key,
    this.width = 36,
    this.height = 36,
    this.strokeWidth = 2.5,
    this.backgroundColor,
    this.color,
  });

  @override
  State<GradientCircularProgressIndicator> createState() => _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Animação contínua
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _GradientCircularProgressPainter(
              _controller.value,
              strokeWidth: widget.strokeWidth,
              backgroundColor: widget.backgroundColor ?? colorScheme.surfaceContainer,
              color: widget.color ?? colorScheme.onSurface,
            ),
          );
        },
      ),
    );
  }
}

// CustomPainter para desenhar o gradiente e o progresso
class _GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color color;

  _GradientCircularProgressPainter(
    this.progress, {
    this.strokeWidth = 4,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Definir o ângulo inicial e o progresso
    const startAngle = -pi / 2; // Começar de cima
    final sweepAngle = 2 * pi * progress; // Progresso baseado na animação

    // Criação do paint do arco
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square // Remover a duplicação dos segmentos
      ..strokeJoin = StrokeJoin.round // Cantos arredondados
      ..isAntiAlias = true; // Garantir suavização

    // Melhor interpolação de cor entre branco e preto
    for (double i = 0.0001; i <= sweepAngle; i += 0.001) {
      final double t = i / sweepAngle;

      // Interpolação de cores suaves sem StrokeCap.round
      paint.color = Color.lerp(color, backgroundColor, t)!;

      // Desenhar o arco suavemente
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + i,
        0.001, // Passo suave para o arco
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GradientCircularProgressPainter oldDelegate) {
    return true;
  }
}
