import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// زر مخصص مع خيارات تخصيص متعددة
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isLoading;
  final bool isDisabled;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 8.0,
    this.padding,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.elevation = 2.0,
  }) : super(key: key);

  /// زر أساسي
  CustomButton.primary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    bool isDisabled = false,
    bool isLoading = false,
    Widget? icon,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          backgroundColor: AppTheme.primaryColor,
          textColor: AppTheme.onPrimaryColor,
          isDisabled: isDisabled,
          isLoading: isLoading,
          icon: icon,
        );

  /// زر ثانوي
  CustomButton.secondary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    bool isDisabled = false,
    bool isLoading = false,
    Widget? icon,
  }) : this(
          key: key,
          text: text,
          onPressed: onPressed,
          backgroundColor: Colors.transparent,
          textColor: AppTheme.primaryColor,
          isDisabled: isDisabled,
          isLoading: isLoading,
          icon: icon,
          elevation: 0,
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return theme.disabledColor.withOpacity(0.5);
          }
          return backgroundColor ?? theme.primaryColor;
        },
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        textColor ?? theme.colorScheme.onPrimary,
      ),
      elevation: MaterialStateProperty.all<double>(elevation ?? 2.0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(width ?? double.infinity, height ?? 48.0),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );

    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: buttonStyle,
      child: _buildChild(theme),
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

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isDisabled
                  ? theme.colorScheme.onSurface.withOpacity(0.38)
                  : textColor ?? theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: isDisabled
            ? theme.colorScheme.onSurface.withOpacity(0.38)
            : textColor ?? theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
