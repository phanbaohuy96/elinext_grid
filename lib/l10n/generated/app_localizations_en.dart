// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Picsum Grid';

  @override
  String get actionAddImage => 'Add image';

  @override
  String get actionReloadAll => 'Reload All';

  @override
  String get emptyImages => 'No images yet.';
}
