import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/widgets/buttons/coin_button.dart';

enum VerificationState { initial, success, error, inProgress }

class VerificationStepCard extends StatelessWidget {
  /// Title of the verification step
  final String title;

  /// Description text for the verification step
  final String description;

  /// Icon representing the verification type
  final IconData icon;

  /// Current state of the verification
  final VerificationState state;

  /// Callback when action button is pressed (only available in initial state)
  final VoidCallback? onActionPressed;

  /// Action button text (defaults to "Enviar")
  final String actionButtonText;

  const VerificationStepCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.state = VerificationState.initial,
    this.onActionPressed,
    this.actionButtonText = 'Enviar',
  });

  Widget _buildStatusIcon() {
    IconData statusIcon;
    Color statusColor;

    switch (state) {
      case VerificationState.success:
        statusIcon = Icons.check_circle;
        statusColor = const Color(0xFF22C55E);
        break;
      case VerificationState.error:
        statusIcon = Icons.error;
        statusColor = const Color(0xFFEF4444);
        break;
      case VerificationState.inProgress:
        statusIcon = Icons.access_time;
        statusColor = const Color(0xFFF59E0B);
        break;
      case VerificationState.initial:
        statusIcon = Icons.circle_outlined;
        statusColor = const Color(0xFF9CA3AF);
        break;
    }

    return Icon(
      statusIcon,
      color: statusColor,
      size: 20,
    );
  }

  Color _getStatusColor() {
    switch (state) {
      case VerificationState.success:
        return const Color(0xFF22C55E);
      case VerificationState.error:
        return const Color(0xFFEF4444);
      case VerificationState.inProgress:
        return const Color(0xFFF59E0B);
      case VerificationState.initial:
        return const Color(0xFF9CA3AF);
    }
  }

  String _getStatusText() {
    switch (state) {
      case VerificationState.success:
        return 'Reenviado';
      case VerificationState.error:
        return 'Negado';
      case VerificationState.inProgress:
        return 'Em análise';
      case VerificationState.initial:
        return actionButtonText;
    }
  }

  /// Gets border color based on verification state
  Color _getBorderColor() {
    return state == VerificationState.success
        ? const Color(0xFF22C55E)
        : const Color(0xFFE5E7EB);
  }

  /// Gets border width based on verification state
  double _getBorderWidth() {
    return state == VerificationState.success ? 2.0 : 1.0;
  }

  /// Checks if should show button (initial or success states)
  bool _shouldShowButton() {
    return state == VerificationState.initial ||
        state == VerificationState.success;
  }

  /// Checks if should show black stripe (error or inProgress states)
  bool _shouldShowBlackStripe() {
    return state == VerificationState.error ||
        state == VerificationState.inProgress;
  }

  /// Gets button background color based on state
  Color _getButtonBackgroundColor() {
    return state == VerificationState.initial
        ? const Color(0xFF111111)
        : const Color(0xFFE5E7EB);
  }

  /// Gets button text color based on state
  Color _getButtonTextColor() {
    return state == VerificationState.initial
        ? Colors.white
        : const Color(0xFF6B7280);
  }

  /// Gets button onPressed callback based on state
  VoidCallback? _getButtonOnPressed() {
    return state == VerificationState.initial ? onActionPressed : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 236,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: _getBorderColor(),
          width: _getBorderWidth(),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFF6B7280),
                      size: 18,
                    ),
                    _buildStatusIcon(),
                  ],
                ),
                const SizedBox(height: 12.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          // Botão para estado initial e success
          if (_shouldShowButton())
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 32,
                child: ElevatedButton(
                  onPressed: _getButtonOnPressed(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getButtonBackgroundColor(),
                    foregroundColor: _getButtonTextColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    _getStatusText(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          // Faixa preta para estados error e inProgress
          if (_shouldShowBlackStripe())
            Container(
              width: double.infinity,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF111111),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Center(
                child: Text(
                  _getStatusText(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _getStatusColor(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
