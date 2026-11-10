import 'package:flutter/material.dart';
import 'package:login_register_page/pages/auth/pages/login_page.dart';
import 'package:login_register_page/pages/auth/pages/register_page.dart';

abstract final class AppRoutes {
  static const String login = '/';
  static const String register = '/register';

  static final Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginPage(),
    register: (_) => const RegisterPage(),
  };
}
