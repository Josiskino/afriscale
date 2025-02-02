import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/theme/theme.dart';
import 'core/constants/app_text_strings.dart';
import 'presentation/routes/app_router.dart';

void main() {
  // Envelopper toute l'application avec ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTextStrings.appName,
      theme: TAppTheme.lightThemeData(context),
      darkTheme: TAppTheme.darkThemeData(context),
      themeMode: themeMode,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/main',
    );
  }
}