import 'package:flutter/material.dart';
// إذا كنت تستخدم DesignifyText للـ label، تأكد من استيراده بشكل صحيح.
// import 'package:designify/src/widgets/custom_text.dart';

class DesignifyInputField extends StatefulWidget {
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
  final bool autofocus;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final VoidCallback? onTap;
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

  // خصائص التصميم المأخوذة من customInput كقيم افتراضية
  final Color borderColor;
  final double borderRadius;
  final Color cardBackgroundColor;
  final double cardElevation;
  final EdgeInsetsGeometry cardMargin;
  final Color? cursorColor; // يسمح بأن يكون null ليأخذ قيمة theme.primaryColor
  final TextStyle textStyle;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry contentPadding;
  final InputBorder inputBorder; // للتحكم الكامل في حدود TextField

  const DesignifyInputField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType = TextInputType.text, // قيمة افتراضية من customInput
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
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

    // القيم الافتراضية من customInput
    this.borderColor = const Color(0xFFBDBDBD), // قيمة افتراضية لـ secondColor (Colors.grey.shade400)
    this.borderRadius = 5.0,
    this.cardBackgroundColor = Colors.white,
    this.cardElevation = 0.0, // لجعل البطاقة مسطحة افتراضيًا
    this.cardMargin = EdgeInsets.zero,
    this.cursorColor, // إذا كان null، سيستخدم theme.primaryColor
    this.textStyle = const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12.0), // يطابق mTextStyle(false,Colors.black,12)
    this.labelStyle = const TextStyle(fontSize: 14.0, color: Colors.black87), // يطابق mText(text,size: 14) مع لون معقول
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.inputBorder = InputBorder.none, // هذا هو المفتاح للتصميم المطلوب
  });

  @override
  State<DesignifyInputField> createState() => _DesignifyInputFieldState();
}

class _DesignifyInputFieldState extends State<DesignifyInputField> {
  String? _errorText;
  late FocusNode _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = widget.focusNode ?? FocusNode();
    widget.controller?.addListener(_handleControllerChange);
    // التحقق الأولي إذا كان هناك validator والنص ليس فارغًا
    if (widget.validator != null && widget.controller?.text.isNotEmpty == true) {
      _errorText = widget.validator!(widget.controller!.text);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChange);
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  void _handleControllerChange() {
    final currentText = widget.controller?.text;
    if (widget.validator != null) {
      final newErrorText = widget.validator!(currentText);
      if (newErrorText != _errorText) {
        setState(() {
          _errorText = newErrorText;
        });
      }
    }
    // استدعاء onChanged المقدم من المستخدم
    widget.onChanged?.call(currentText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(
          color: widget.borderColor,
          width: 1.0, // عرض ثابت للحدود
        ),
      ),
      color: widget.cardBackgroundColor,
      elevation: widget.cardElevation,
      margin: widget.cardMargin,
      child: TextField(
        key: widget.key ?? Key('${widget.label}Field'),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        // onChanged يتم معالجته بواسطة _handleControllerChange
        onSubmitted: widget.onSubmitted,
        autocorrect: widget.autocorrect,
        enableSuggestions: widget.enableSuggestions,
        textCapitalization: widget.textCapitalization,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        focusNode: _internalFocusNode,
        maxLength: widget.maxLength,
        showCursor: widget.showCursor,
        expands: widget.expands,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        textDirection: widget.textDirection,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        cursorColor: widget.cursorColor ?? theme.primaryColor,
        style: widget.textStyle,
        decoration: InputDecoration(
          label: Text(widget.label, style: widget.labelStyle),
          hintText: widget.hintText,
          contentPadding: widget.contentPadding,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          counterText: widget.showCounter ? null : '',
          errorText: _errorText,
          errorStyle: TextStyle(
            color: theme.colorScheme.error,
            fontSize: 12.0,
          ),
          // تطبيق الحدود الافتراضية (InputBorder.none) على جميع الحالات
          border: widget.inputBorder,
          enabledBorder: widget.inputBorder,
          focusedBorder: widget.inputBorder,
          disabledBorder: widget.inputBorder,
          errorBorder: widget.inputBorder, // مهم جدًا لـ error state
          focusedErrorBorder: widget.inputBorder, // مهم جدًا لـ error state
        ),
      ),
    );
  }
}

/*
// دالة customInput الأصلية للمقارنة (لا تقم بإلغاء التعليق إلا للمراجعة)
Card customInputFunctionForReference(BuildContext context,String text,TextEditingController controller,{ TextInputType inputType=TextInputType.text, Color secondColor = const Color(0xFFBDBDBD)}) {
    return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // widget.borderRadius
                    side: BorderSide(
                      color:secondColor, // widget.borderColor
                    )
                  ),
                  color: Colors.white, // widget.cardBackgroundColor
                  // elevation: 0, // widget.cardElevation
                  // margin: EdgeInsets.zero, // widget.cardMargin
                  child: TextField(
                    // key: Key("usernameField"), // widget.key or generated
                    controller:controller,
                    cursorColor: Theme.of(context).primaryColor, // widget.cursorColor ?? theme.primaryColor
                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12.0), // widget.textStyle
                    keyboardType:inputType, // widget.keyboardType
                    decoration: InputDecoration(
                      label: Text(text, style: TextStyle(fontSize: 14.0, color: Colors.black87)), // Text(widget.label, style: widget.labelStyle)
                      border: InputBorder.none, // widget.inputBorder
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5) // widget.contentPadding
                    )
                  ),
                );
  }
*/