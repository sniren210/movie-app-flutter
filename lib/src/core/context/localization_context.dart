import 'package:flutter/material.dart';
import 'package:movies/movies.dart';

extension LocalizationContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
