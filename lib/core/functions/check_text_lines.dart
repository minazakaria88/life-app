
import 'package:flutter/cupertino.dart';

bool checkTextLines(String text, TextStyle style,double maxWidth) {
  TextPainter painter = TextPainter(
    text: TextSpan(
      text: text,
      style: style,
    ),
    textDirection: TextDirection.ltr,
    maxLines: 1,
  );
  painter.layout(maxWidth:maxWidth);
  return painter.didExceedMaxLines;
}
