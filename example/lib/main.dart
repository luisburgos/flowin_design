import 'package:example/app/observers/app_bloc_observer.dart';
import 'package:example/app/router/router_config_builder.dart';
import 'package:flowin_design/flowin_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

/// @no-doc
class MyApp extends StatelessWidget {
  /// @no-doc
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flowin Design',
      theme: FlowinDesignThemes.light,
      darkTheme: FlowinDesignThemes.dark,
      routerConfig: appRouterConfigBuilder(context),
    );
  }
}
