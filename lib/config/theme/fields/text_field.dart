import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../spacer.dart';
import '../text.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final bool autocorrect;
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? enabled;
  final ValueChanged<String>? onSubmitted;

  const AppTextField({
    Key? key,
    this.labelText,
    this.style,
    this.focusNode,
    this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.maxLines,
    this.decoration,
    this.autocorrect = false,
    this.autofocus = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.inputFormatters,
    this.maxLength,
    this.enabled,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      style: style,
      maxLines: maxLines,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      enabled: enabled,
      decoration: InputDecoration(
        isDense: decoration?.isDense ?? true,
        prefix: decoration?.prefix,
        prefixIcon: decoration?.prefixIcon,
        suffix: decoration?.suffix,
        suffixIcon: decoration?.suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(14.0),
                child: decoration?.suffixIcon,
              )
            : null,
        suffixIconConstraints: decoration?.suffixIconConstraints ??
            const BoxConstraints(minHeight: 16.0, minWidth: 16.0),
        hintText: decoration?.hintText,
        // hintStyle: AppStyles.textMdNormal.copyWith(color: AppColors.gray500),
        contentPadding: decoration?.contentPadding ??
            const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 10.0),
        border: const OutlineInputBorder(
          borderRadius: AppSpacer.radius8,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppSpacer.radius8,
        ),
        errorText: decoration?.errorText,
        counterText: '',
      ),
      autocorrect: autocorrect,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: AppSpacer.edgeInsetsBottom8,
            child: ThemedText(
              labelText!,
              type: ThemedTextType.labelLarge,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        textField,
      ],
    );
  }
}
