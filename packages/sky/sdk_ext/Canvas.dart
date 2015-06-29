// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// WARNING: Do not edit - generated code.
part of dart.sky;

class Canvas extends
    NativeFieldWrapperClass2 {
    // Constructors
    void _constructor(PictureRecorder recorder, Size bounds) native "Canvas_constructorCallback";
    Canvas(PictureRecorder recorder, Size bounds) { _constructor(recorder, bounds); }

    // Attributes

    // Methods
    void save() native "Canvas_save_Callback";
    void saveLayer(Rect bounds, Paint paint) native "Canvas_saveLayer_Callback";
    void restore() native "Canvas_restore_Callback";
    void translate(double dx, double dy) native "Canvas_translate_Callback";
    void scale(double sx, double sy) native "Canvas_scale_Callback";
    void rotate(double radians) native "Canvas_rotate_Callback";
    void skew(double sx, double sy) native "Canvas_skew_Callback";
    void concat(Float32List matrix4) native "Canvas_concat_Callback";
    void clipRect(Rect rect) native "Canvas_clipRect_Callback";
    void clipRRect(RRect rrect) native "Canvas_clipRRect_Callback";
    void clipPath(Path path) native "Canvas_clipPath_Callback";
    void drawLine(Point p1, Point p2, Paint paint) native "Canvas_drawLine_Callback";
    void drawPicture(Picture picture) native "Canvas_drawPicture_Callback";
    void drawPaint(Paint paint) native "Canvas_drawPaint_Callback";
    void drawRect(Rect rect, Paint paint) native "Canvas_drawRect_Callback";
    void drawRRect(RRect rrect, Paint paint) native "Canvas_drawRRect_Callback";
    void drawOval(Rect rect, Paint paint) native "Canvas_drawOval_Callback";
    void drawCircle(Point c, double radius, Paint paint) native "Canvas_drawCircle_Callback";
    void drawPath(Path path, Paint paint) native "Canvas_drawPath_Callback";
    void drawImage(Image image, Point p, Paint paint) native "Canvas_drawImage_Callback";
    void drawImageRect(Image image, Rect src, Rect dst, Paint paint) native "Canvas_drawImageRect_Callback";

    // Operators
}
