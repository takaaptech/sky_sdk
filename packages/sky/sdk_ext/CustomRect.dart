// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of dart.sky;

/// Holds 4 floating-point coordinates for a rectangle.
class Rect {
  Rect();

  Rect.fromLTRB(double left, double top, double right, double bottom) {
    _value
      ..[0] = left
      ..[1] = top
      ..[2] = right
      ..[3] = bottom;
  }

  Rect.fromLTWH(double left, double top, double width, double height) {
    _value
      ..[0] = left
      ..[1] = top
      ..[2] = left + width
      ..[3] = top + height;
  }

  final Float32List _value = new Float32List(4);
  double get left => _value[0];
  double get top => _value[1];
  double get right => _value[2];
  double get bottom => _value[3];

  Point get center => new Point(left + right / 2.0, top + bottom / 2.0);
  Point get topLeft => new Point(left, top);
  Point get topRight => new Point(right, top);
  Point get bottomLeft => new Point(left, bottom);
  Point get bottomRight => new Point(right, bottom);

  Size get size => new Size(right - left, bottom - top);

  // Rects are inclusive of the top and left edges but exclusive of the bottom
  // right edges.
  bool contains(Point point) {
    return point.x >= left && point.x < right && point.y >= top && point.y < bottom;
  }

  bool operator ==(other) {
    if (other is! Rect)
      return false;
    for (var i = 0; i < 4; ++i) {
      if (_value[i] != other._value[i])
        return false;
    }
    return true;
  }
  int get hashCode =>_value.fold(373, (value, item) => (37 * value + item.hashCode));
  String toString() => "Rect.fromLTRB($left, $top, $right, $bottom)";
}
