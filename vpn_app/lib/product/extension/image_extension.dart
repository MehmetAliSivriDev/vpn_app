import 'package:flutter/material.dart';

enum Flags { italy, netherlands, germany }

extension FlagsExtension on Flags {
  String get path => "assets/flags/$name.png";

  Image get image => Image.asset(path);
}
