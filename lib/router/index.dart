// app_routes.dart

import 'package:bcnet/pages/main_index.dart';
import 'package:bcnet/pages/mine/setting_page.dart';
import 'package:bcnet/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import '../pages/home/task_completion.dart';
import '../pages/login_page.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => const MainIndex(),
      '/splash': (context) => const SplashScreen(),
      '/login': (context) => const LoginPage(),
      '/home': (context) => const MainIndex(),
      '/taskCompletion': (context) => TaskCompletionPage(
        task: ModalRoute.of(context)?.settings.arguments as String,
      ),
      '/setting': (context) => SettingsPage(),
    };
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR: Route not found'),
          ),
        );
      },
    );
  }
}
