import 'package:flutter/material.dart';
import 'package:flutter_application_3/app/observer/overlay_route_observer.dart';
import 'package:routefly/routefly.dart';
import 'app_widget.route.dart'; // <- GENERATED

part 'app_widget.g.dart'; // <- GENERATED

@Main('lib/app/view')
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
        observers: [
          OverlayRouteObserver(),
        ],
        initialPath: routePaths.teste,
      ),
    );
  }
}
