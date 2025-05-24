import 'package:flutter/material.dart';
import 'package:designify/designify.dart';

/// حقل إدخال مخصص مع تصميم متكامل
///
/// يوفر حقل إدخال بتصميم متكامل مع خيارات تخصيص متعددة
class DesignifyInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool enabled;
  final Color borderColor;
  final double borderRadius;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool showCursor;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool enableInteractiveSelection;
  final TextDirection? textDirection;
  final bool enableIMEPersonalizedLearning;
  final bool showCounter;
  final EdgeInsetsGeometry contentPadding;

  const DesignifyInputField({
    Key? key,
    required this.label,
    this.controller,
    TextInputType? keyboardType,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.autofocus = false,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.maxLength,
    this.showCursor = true,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.enableInteractiveSelection = true,
    this.textDirection,
    this.enableIMEPersonalizedLearning = true,
    this.showCounter = false,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  }) : keyboardType = keyboardType ?? TextInputType.text,
       super(key: key);

  /// إنشاء حقل إدخال مع أيقونة بادئة
  factory DesignifyInputField.withPrefixIcon({
    required String label,
    required IconData icon,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    Color? iconColor,
    double iconSize = 20.0,
  }) {
    return DesignifyInputField(
      label: label,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      prefixIcon: Icon(icon, color: iconColor, size: iconSize),
    );
  }

  /// إنشاء حقل كلمة مرور
  factory DesignifyInputField.password({
    required String label,
    required TextEditingController controller,
    bool showPassword = false,
    VoidCallback? onToggleVisibility,
  }) {
    return DesignifyInputField(
      label: label,
      controller: controller,
      obscureText: !showPassword,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
          showPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
        onPressed: onToggleVisibility,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor ?? theme.primaryColor,
          width: 1.0,
        ),
      ),
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: TextField(
        key: Key('${label}Field'),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        enabled: enabled,
        style: TextStyle(
          color: theme.brightness == Brightness.dark ? Colors.white : Colors.black87,
        ),
        decoration: InputDecoration(
          label: DesignifyText(label, fontSize: 14),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

// دالة مساعدة للتوافق مع الكود القديم - يمكن إزالتها في المستقبل
@Deprecated('Use DesignifyInputField instead')
Card customInput(
  BuildContext context,
  String text,
  TextEditingController controller, {
  TextInputType inputType = TextInputType.text,
  Color borderColor = Colors.blue,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(color: borderColor),
    ),
    color: Colors.white,
    child: TextField(
      key: Key("${text}Field"),
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      style: TextStyle(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87,
      ),
      keyboardType: inputType,
      decoration: InputDecoration(
        label: DesignifyText(text, fontSize: 14),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    ),
  );
}
