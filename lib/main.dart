import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection.dart' as di;
import 'app/routes/app_router.dart';
import 'app/routes/app_routes.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() {
  di.init();  // Dependency Injection setup
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>(),  // Using DI for AuthBloc
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

