import 'dart:convert';
import 'dart:io';

import 'package:bubbles/core/enum.dart';
import 'package:flutter/material.dart';
import '../../../theme/theme.theme.dart';
import '../shapes/chat_view_shapes.shape.dart';
import 'bubble_stack.widget.dart';

class ChatItemWidget extends StatelessWidget {
  final String text;
  final DiadicRole role;
  bool isFirst;
  bool isLast;

  ChatItemWidget({
    required this.text,
    required this.role,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isOwn = role == DiadicRole.user;
    final isDiadic = role == DiadicRole.diadic;

    Color color = DiadicThemeMaterial.diadicColor;
    if (role == DiadicRole.user)
      color = DiadicThemeMaterial.diadicContrastColor;
    if (role == DiadicRole.diadic) color = Colors.white;

    Widget fillWidget;
    Widget contentWidget;
    Widget fillChild;

    Color textColor = Colors.white;
    if (role == DiadicRole.diadic || role == DiadicRole.user)
      textColor = Colors.black54;

    MainAxisAlignment textAlignment = MainAxisAlignment.start;
    if (role == DiadicRole.diadic) textAlignment = MainAxisAlignment.center;
    if (role == DiadicRole.user) textAlignment = MainAxisAlignment.end;

    double fontSize = 20;
    if (isLast) fontSize = 40;

    fillChild = Text(
      text,
      style: TextStyle(
        color: Colors.transparent,
        fontSize: fontSize,
      ),
    );

    contentWidget = Row(
      mainAxisAlignment: textAlignment,
      children: [
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.5, 1.5),
                  blurRadius: 3.0,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
      ],
    );

    fillWidget = Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(30, 19, 30, 20),
        color: Colors.transparent,
        child: fillChild);

    Widget functionWidget = GestureDetector(
      onLongPress: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
        decoration: ShapeDecoration(
          color: color,
          shape: MessageBorderShape(
              isOwn: isOwn, isDiadic: isDiadic), //CircleBorder(),
        ),
        child: contentWidget,
      ),
    );

    return BubbleStack(
        text: text,
        role: role,
        fillWidget: fillWidget,
        contentWidget: functionWidget);
  }
}
