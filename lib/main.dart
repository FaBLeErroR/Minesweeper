import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minesweeper/navigation/router.dart';
import 'package:minesweeper/l10n/app_localizations.dart';
import 'package:minesweeper/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,

      locale: const Locale('ru'),
      routerConfig: _appRouter.config(),
    );
  }
}