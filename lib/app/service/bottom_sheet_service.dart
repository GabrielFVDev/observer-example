import 'package:flutter/material.dart';

class CoinModalBottomSheetService {
  Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    double? height,
    double? maxHeight,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    RouteSettings? routeSettings,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      routeSettings: routeSettings,
      builder: (context) {
        return SizedBox(
          height: height,
          child: SafeArea(
            child: Builder(builder: builder),
          ),
        );
      },
    );
  }

  Future<void> showAttachmentModal({
    required BuildContext context,
    required VoidCallback onOpenCamera,
    required VoidCallback onChooseDocument,
    String? title,
    String? cameraText,
    String? documentText,
    double? height,
  }) async {
    await showCustomBottomSheet(
      context: context,
      height: height ?? 200,
      builder: (context) => _AttachmentModalContent(
        onOpenCamera: onOpenCamera,
        onChooseDocument: onChooseDocument,
        title: title,
        cameraText: cameraText,
        documentText: documentText,
      ),
    );
  }
}

class _AttachmentModalContent extends StatelessWidget {
  final VoidCallback onOpenCamera;
  final VoidCallback onChooseDocument;
  final String? title;
  final String? cameraText;
  final String? documentText;

  const _AttachmentModalContent({
    required this.onOpenCamera,
    required this.onChooseDocument,
    this.title,
    this.cameraText,
    this.documentText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title ?? 'Anexar comprovante',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                    onOpenCamera();
                  },
                  child: Text(cameraText ?? 'Abrir câmera'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () {
                    Navigator.pop(context);
                    onChooseDocument();
                  },
                  child: Text(documentText ?? 'Escolher documento'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
