import 'dart:math';

import 'package:flutter/material.dart';

import '../../../theme/theme.theme.dart';

class ChatListBorderOverlay extends ShapeBorder {
  final borderRadius = DiadicThemeMaterial.borderRadius;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.left, rect.top + 25)
      ..arcToPoint(Offset(rect.left + 25, rect.top),
          radius: Radius.circular(borderRadius))
      ..lineTo(rect.left, rect.top)
      ..moveTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.top + 25)
      ..arcToPoint(Offset(rect.right - 25, rect.top),
          radius: Radius.circular(borderRadius), clockwise: false)
      ..lineTo(rect.left, rect.top)
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.bottom - 25)
      ..arcToPoint(Offset(rect.left + 25, rect.bottom),
          radius: Radius.circular(borderRadius), clockwise: false)
      ..lineTo(rect.left, rect.bottom)
      ..moveTo(rect.right, rect.bottom)
      ..lineTo(rect.right, rect.bottom - 25)
      ..arcToPoint(Offset(rect.right - 25, rect.bottom),
          radius: Radius.circular(borderRadius))
      ..lineTo(rect.left, rect.bottom);
    // ..quadraticBezierTo(
    //   controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
    //..lineTo(rect.size.width, 50);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}

class MessageBorderShape extends ShapeBorder {
  final bool isOwn;
  final bool isDiadic;

  final borderRadius = DiadicThemeMaterial.borderRadius;

  const MessageBorderShape({required this.isOwn, required this.isDiadic});

  double degToRad(num deg) => deg * (pi / 180.0);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    if (isOwn) {
      path
        ..addRRect(RRect.fromLTRBR(rect.left, rect.top + 30, rect.right,
            rect.bottom, Radius.circular(borderRadius)))
        ..moveTo(rect.right - 30, rect.top + 30)
        ..quadraticBezierTo(
            rect.right - 10, rect.top + 30, rect.right, rect.top)
        ..lineTo(rect.right, rect.top + 40);
    } else if (isDiadic) {
      path.moveTo(rect.left, rect.top);
      path
        ..lineTo(rect.left + 30, rect.top + 30)
        ..lineTo(rect.right, rect.top + 30)
        ..lineTo(rect.right, rect.bottom)
        ..lineTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top);
    } else {
      path
        ..addRRect(RRect.fromLTRBR(rect.left, rect.top + 30, rect.right,
            rect.bottom, Radius.circular(borderRadius)))
        //..moveTo(rect.left + 30, rect.top + 30)
        // ..quadraticBezierTo(rect.left + 10, rect.top + 30, rect.left, rect.top)
        // ..lineTo(rect.left, rect.top + 40)
        // ..lineTo(rect.left + 30, rect.top + 30)

        ..moveTo(rect.left, rect.top)
        ..quadraticBezierTo(
            rect.left + 10, rect.top + 30, rect.left + 30, rect.top + 30)
        ..lineTo(rect.left, rect.top + 40);
      //..lineTo(rect.left, rect.top + 40);
      // ..lineTo(rect.right, rect.bottom)
      // ..lineTo(rect.left, rect.bottom)
      // ..lineTo(rect.left, rect.top);
    }

    return path;
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 0);

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    /*
    final path = Path();
    path.moveTo(rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    path
      ..lineTo(rect.left, rect.top + 30)
      ..lineTo(rect.right - 30, rect.top + 30)
      ..lineTo(rect.right, rect.top);
    path.close();
    return path;
    */
    return getOuterPath(rect);
    // TODO: implement getInnerPath
    throw NetworkImageLoadException(
        statusCode: 403, uri: Uri.parse("http://google.com"));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, -30);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
