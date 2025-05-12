import 'package:flutter/material.dart';

class OverlayService {
  static final OverlayService _instance = OverlayService._internal();
  factory OverlayService() => _instance;
  OverlayService._internal();

  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;

  static void showOverlay(
      {required BuildContext context, required Widget child}) {
    if (isVisible) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => child,
    );

    Overlay.of(context).insert(_overlayEntry!);
    isVisible = true;
  }

  static void hideOverlay() {
    if (!isVisible) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    isVisible = false;
  }
}
