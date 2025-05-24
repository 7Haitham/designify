import 'package:flutter/material.dart';

class DesignifyInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLength;

  // Design properties
  final Color borderColor;
  final double borderRadius;
  final Color cardBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;

  const DesignifyInputField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.onTap,
    this.maxLength,
    this.borderColor = Colors.transparent,
    this.borderRadius = 5.0,
    this.cardBackgroundColor = Colors.white,
    this.contentPadding,
    this.decoration,
  }) : super(key: key);

  @override
  State<DesignifyInputField> createState() => _DesignifyInputFieldState();
}

class _DesignifyInputFieldState extends State<DesignifyInputField> {
  String? _errorText;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    widget.controller.addListener(_validate);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_validate);
    super.dispose();
  }

  void _validate() {
    if (widget.validator != null) {
      final error = widget.validator!(widget.controller.text);
      if (error != _errorText) {
        setState(() => _errorText = error);
      }
    }
    widget.onChanged?.call(widget.controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final defaultDecoration = InputDecoration(
      labelText: widget.label,
      border: InputBorder.none,
      contentPadding: widget.contentPadding ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      errorText: _errorText,
      errorStyle: const TextStyle(fontSize: 12),
      counterText: '',
    );

    final effectiveDecoration = widget.decoration != null
        ? defaultDecoration.copyWith(
      labelText: widget.decoration?.labelText ?? widget.label,
      hintText: widget.decoration?.hintText,
      prefixIcon: widget.decoration?.prefixIcon ?? widget.prefixIcon,
      suffixIcon: widget.decoration?.suffixIcon ?? widget.suffixIcon,
      contentPadding: widget.decoration?.contentPadding ??
          widget.contentPadding ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    )
        : defaultDecoration;

    return Card(
      color: widget.cardBackgroundColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(color: widget.borderColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: effectiveDecoration,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          enabled: widget.enabled,
          textInputAction: widget.textInputAction,
          onChanged: (value) => widget.onChanged?.call(value),
          onSubmitted: widget.onSubmitted,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          maxLength: widget.maxLength,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}