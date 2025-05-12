import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/service/overlay_service.dart';

class OverlayRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (OverlayService.isVisible) {
      OverlayService.hideOverlay();
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (OverlayService.isVisible) {
      OverlayService.hideOverlay();
    }
    super.didPop(route, previousRoute);
  }
}
