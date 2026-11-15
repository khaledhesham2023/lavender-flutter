
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:lavender/core/di/dependency_injection.dart';
import 'package:material_ui/material_ui.dart';

import 'core/routing/app_router.dart';
import 'lavender_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LavenderBootstrap());
}

class LavenderBootstrap extends StatefulWidget {
  const LavenderBootstrap({super.key});

  @override
  State<LavenderBootstrap> createState() => _LavenderBootstrapState();
}

class _LavenderBootstrapState extends State<LavenderBootstrap> {
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _initializeApp();
  }

  Future<void> _initializeApp() async {
    await EasyLocalization.ensureInitialized();
    await setDependencies();
  }

  void _retryInitialization() {
    setState(() => _initialization = _initializeApp());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Unable to start the app.'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _retryInitialization,
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        return EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
          path: 'assets/translations',
          fallbackLocale: const Locale('ar', 'SA'),
          startLocale: const Locale('en', 'US'),
          child: LavenderApp(appRouter: AppRouter()),
        );
      },
    );
  }
}
