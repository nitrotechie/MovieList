import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widgets {
  static Widget addMovie(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        alignment: Alignment.topLeft,
        width: 225,
        height: 435,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
