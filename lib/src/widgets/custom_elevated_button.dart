import 'package:flutter/material.dart';
import 'package:designify/designify.dart';

/// زر مرتفع مخصص مع تصميم متكامل
///
/// يوفر زر مرتفع بتصميم متكامل مع خيارات تخصيص متعددة
class DesignifyElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isLoading;
  final bool isDisabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BorderSide? side;
  final Gradient? gradient;
  final BoxConstraints? constraints;
  final bool expanded;

  const DesignifyElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 50.0,
    this.borderRadius = 10.0,
    this.elevation = 5.0,
    this.padding,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.side,
    this.gradient,
    this.constraints,
    this.expanded = false,
  }) : super(key: key);

  /// زر أساسي مع لون الخلفية الأساسي
  factory DesignifyElevatedButton.primary({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    double? width,
    double? height,
    double borderRadius = 10.0,
    double elevation = 5.0,
    EdgeInsetsGeometry? padding,
    Widget? icon,
    bool isLoading = false,
    bool isDisabled = false,
    double? fontSize,
    FontWeight? fontWeight,
    BorderSide? side,
    bool expanded = false,
  }) {
    return DesignifyElevatedButton(
      key: key,
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      borderRadius: borderRadius,
      elevation: elevation,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      icon: icon,
      isLoading: isLoading,
      isDisabled: isDisabled,
      fontSize: fontSize,
      fontWeight: fontWeight,
      side: side,
      expanded: expanded,
    );
  }

  /// زر ثانوي مع إطار
  factory DesignifyElevatedButton.outlined({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    Color? borderColor,
    Color? textColor,
    double? width,
    double? height,
    double borderRadius = 10.0,
    double elevation = 0.0,
    EdgeInsetsGeometry? padding,
    Widget? icon,
    bool isLoading = false,
    bool isDisabled = false,
    double? fontSize,
    FontWeight? fontWeight,
    bool expanded = false,
  }) {
    return DesignifyElevatedButton(
      key: key,
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      backgroundColor: Colors.transparent,
      textColor: textColor ?? Colors.blue,
      borderRadius: borderRadius,
      elevation: elevation,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      icon: icon,
      isLoading: isLoading,
      isDisabled: isDisabled,
      fontSize: fontSize,
      fontWeight: fontWeight,
      side: BorderSide(color: borderColor ?? Colors.blue, width: 1.0),
      expanded: expanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: isDisabled
          ? theme.disabledColor
          : (backgroundColor ?? theme.primaryColor),
      foregroundColor: isDisabled
          ? theme.colorScheme.onSurface.withOpacity(0.38)
          : (textColor ?? theme.colorScheme.onPrimary),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: side ?? BorderSide.none,
      ),
      elevation: isDisabled ? 0 : elevation,
      minimumSize: Size(width ?? (expanded ? double.infinity : 0), height ?? 50),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    return Container(
      width: expanded ? double.infinity : width,
      constraints: constraints,
      child: ElevatedButton(
        key: key,
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: buttonStyle,
        child: _buildChild(theme),
      ),
    );
  }

  Widget _buildChild(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor ?? theme.colorScheme.onPrimary,
          ),
        ),
      );
    }

    final textWidget = Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: isDisabled
            ? theme.colorScheme.onSurface.withOpacity(0.38)
            : textColor ?? theme.colorScheme.onPrimary,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 8),
          textWidget,
        ],
      );
    }

    return textWidget;
  }
}

// دالة مساعدة للتوافق مع الكود القديم - يمكن إزالتها في المستقبل
@Deprecated('Use DesignifyElevatedButton instead')
ElevatedButton customElevatedButton({
  required String text,
  required VoidCallback onPressed,
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
  double borderRadius = 10.0,
  double elevation = 5.0,
  EdgeInsetsGeometry? padding,
  Key? key,
}) {
  return ElevatedButton(
    key: key,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}
