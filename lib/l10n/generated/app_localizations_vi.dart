// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Lưới ảnh Picsum';

  @override
  String get actionAddImage => 'Thêm ảnh';

  @override
  String get actionReloadAll => 'Tải lại tất cả';

  @override
  String get emptyImages => 'Chưa có ảnh nào.';
}
