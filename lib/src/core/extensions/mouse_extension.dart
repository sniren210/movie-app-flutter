import 'package:flutter/material.dart';
import 'package:movies/movies.dart';

extension HoverExtensions on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }

  Widget activeUpOnHover({bool active = false}) {
    return TranslateOnActive(
      active: active,
      child: this,
    );
  }
}
