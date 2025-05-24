import 'package:flutter/material.dart';

class DesignifyInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
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

  // Design properties with your default values
  final Color borderColor;
  final double borderRadius;
  final Color cardBackgroundColor;
  final double cardElevation;
  final EdgeInsetsGeometry cardMargin;
  final Color? cursorColor;
  final TextStyle textStyle;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry contentPadding;
  final InputBorder inputBorder;

  const DesignifyInputField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
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

    // Default design values matching your Card DesignifyInputField
    this.borderColor = const Color(0xFFBDBDBD),
    this.borderRadius = 5.0,
    this.cardBackgroundColor = Colors.white,
    this.cardElevation = 0.0,
    this.cardMargin = EdgeInsets.zero,
    this.cursorColor,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontSize: 12.0,
    ),
    this.labelStyle = const TextStyle(
      fontSize: 14.0,
      color: Colors.black87,
    ),
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    this.inputBorder = InputBorder.none,
  }) : super(key: key);

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
    widget.controller.addListener(_handleControllerChange);
    if (widget.validator != null && widget.controller.text.isNotEmpty) {
      _errorText = widget.validator!(widget.controller.text);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChange);
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  void _handleControllerChange() {
    if (widget.validator != null) {
      final newErrorText = widget.validator!(widget.controller.text);
      if (newErrorText != _errorText) {
        setState(() {
          _errorText = newErrorText;
        });
      }
    }
    widget.onChanged?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(
          color: widget.borderColor,
          width: 1.0,
        ),
      ),
      color: widget.cardBackgroundColor,
      elevation: widget.cardElevation,
      margin: widget.cardMargin,
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
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
          border: widget.inputBorder,
          enabledBorder: widget.inputBorder,
          focusedBorder: widget.inputBorder,
          disabledBorder: widget.inputBorder,
          errorBorder: widget.inputBorder,
          focusedErrorBorder: widget.inputBorder,
        ),
      ),
    );
  }
}