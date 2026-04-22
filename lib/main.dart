import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'l10n/localization_ext.dart';
import 'presentation/route/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ElinextGridApp());
}

class ElinextGridApp extends StatelessWidget {
  const ElinextGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MobileLikeScrollBehavior(),
      onGenerateTitle: (c) => c.l10n.appTitle,
      routerConfig: AppRouter.build(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    );
  }
}

class MobileLikeScrollBehavior extends MaterialScrollBehavior {
  const MobileLikeScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
