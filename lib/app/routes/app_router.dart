import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
