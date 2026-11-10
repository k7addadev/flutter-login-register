import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register_page/core/provider/local_provider.dart';
import 'package:login_register_page/core/routes/app_routes.dart';
import 'package:login_register_page/core/theme/app_theme.dart';
import 'package:login_register_page/generated/l10n.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
