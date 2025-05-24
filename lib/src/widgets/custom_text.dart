import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// نص مخصص مع خيارات تنسيق متعددة
///
/// يوفر طريقة سهلة لإنشاء نصوص بتنسيق متسق في التطبيق
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

  /// إنشاء نص مخصص
  ///
  /// [text] النص المطلوب عرضه
  /// [fontSize] حجم الخط (الافتراضي: 14.0)
  /// [isBold] إذا كان النص عريض (الافتراضي: false)
  /// [color] لون النص (الافتراضي: Colors.black54)
  /// [maxLines] الحد الأقصى لعدد الأسطر (الافتراضي: 2)
  /// [textAlign] محاذاة النص
  /// [overflow] سلوك تجاوز النص
  /// [softWrap] التفاف النص عند الحاجة
  /// [fontWeight] سمك الخط
  /// [letterSpacing] المسافة بين الحروف
  /// [height] ارتفاع السطر
  /// [decoration] تزيين النص (تحته خط، إلخ)
  /// [fontFamily] عائلة الخط
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

  /// إنشاء نص بخط عريض
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

  /// إنشاء نص بعنوان رئيسي
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

  /// إنشاء نص فرعي
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

    // تطبيق عائلة الخط المخصصة إذا تم تحديدها
    return fontFamily != null
        ? baseStyle.copyWith(fontFamily: fontFamily)
        : baseStyle;
  }
}

// دالة مساعدة للتوافق مع الكود القديم - يمكن إزالتها في المستقبل
@Deprecated('Use DesignifyText instead')
Text mText(
  String text, {
  double size = 14.0,
  bool isBold = false,
  Color? color,
  int? maxLines,
  TextAlign? textAlign,
  TextOverflow? overflow,
  FontWeight? fontWeight,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : fontWeight ?? FontWeight.normal,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    ),
    maxLines: maxLines,
    textAlign: textAlign,
    overflow: overflow,
  );
}

@Deprecated('Use DesignifyText._buildTextStyle instead')
TextStyle mTextStyle(bool isBold, Color color, double size) {
  return GoogleFonts.rubik(
    color: color,
    fontSize: size,
    fontWeight: isBold ? FontWeight.bold : null,
  );
}
