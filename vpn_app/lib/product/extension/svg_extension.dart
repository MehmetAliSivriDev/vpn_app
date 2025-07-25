enum SVGs {
  category,
  crown,
  download,
  left_frame,
  map,
  open,
  radar,
  right_frame,
  search,
  setting,
  upload,
  arrow_right,
}

extension SVGExtension on SVGs {
  String get path => "assets/svg/$name.svg";
}
