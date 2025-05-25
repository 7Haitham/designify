import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignifyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;
  final Color color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool softWrap;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final String? fontFamily;


  const DesignifyText(
    this.text, {
    Key? key,
    this.fontSize = 14.0,
    this.isBold = false,
    this.color = Colors.black54,
    this.maxLines = 2,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = true,
    this.fontWeight,
    this.letterSpacing,
    this.height,
    this.decoration,
    this.fontFamily,
  }) : super(key: key);

  factory DesignifyText.bold(
    String text, {
    double fontSize = 14.0,
    Color color = Colors.black54,
    int? maxLines = 1,
  }) {
    return DesignifyText(
      text,
      fontSize: fontSize,
      color: color,
      isBold: true,
      maxLines: maxLines,
    );
  }

  factory DesignifyText.heading(
    String text, {
    double fontSize = 24.0,
    Color color = Colors.black87,
    int? maxLines = 2,
  }) {
    return DesignifyText(
      text,
      fontSize: fontSize,
      color: color,
      isBold: true,
      maxLines: maxLines,
    );
  }

  factory DesignifyText.subtitle(
    String text, {
    double fontSize = 16.0,
    Color color = Colors.black54,
    int? maxLines = 2,
  }) {
    return DesignifyText(
      text,
      fontSize: fontSize,
      color: color,
      isBold: false,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _buildTextStyle(),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
    );
  }

  TextStyle _buildTextStyle() {
    final baseStyle = GoogleFonts.rubik(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.normal),
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );

    return fontFamily != null
        ? baseStyle.copyWith(fontFamily: fontFamily)
        : baseStyle;
  }
}
