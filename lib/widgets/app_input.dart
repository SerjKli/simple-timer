import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

class AppInputField extends StatelessWidget {
  final String? title;
  final Function? onSave;
  final Function? onSubmit;
  final Function validator;
  final TextInputType inputType;
  final bool obscureText;
  final IconData? icon;
  final String initValue;
  final bool autoValidation;
  final TextEditingController? controller;
  final int maxLength;
  final FocusNode? focus;
  final bool noBorders;
  final TextAlign textAlign;

  const AppInputField({
    Key? key,
    this.title,
    this.onSave,
    required this.validator,
    this.inputType = TextInputType.text,
    this.icon,
    this.obscureText = false,
    this.initValue = '',
    this.autoValidation = false,
    this.onSubmit,
    this.controller,
    this.maxLength = 30,
    this.focus,
    this.noBorders = false,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  const AppInputField.noBorder({
    Key? key,
    this.title,
    this.onSave,
    required this.validator,
    this.inputType = TextInputType.text,
    this.icon,
    this.obscureText = false,
    this.initValue = '',
    this.autoValidation = false,
    this.onSubmit,
    this.controller,
    this.maxLength = 30,
    this.focus,
    this.textAlign = TextAlign.left,
  })  : noBorders = true,
        super(key: key);

  InputBorder _getBorders(Color color) {
    if (noBorders) return InputBorder.none;

    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }

  EdgeInsets get innerPadding => noBorders
      ? const EdgeInsets.symmetric(vertical: UiValues.paddingMax)
      : UiValues.paddingEdgeMax;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller != null ? null : initValue,
      focusNode: focus,
      textAlign: textAlign,
      decoration: InputDecoration(
        contentPadding: innerPadding,
        focusedBorder: _getBorders(context.colorScheme.brand!),
        enabledBorder: _getBorders(context.colorScheme.brand!),
        errorBorder: _getBorders(context.colorScheme.error!),
        focusedErrorBorder: _getBorders(context.colorScheme.error!),
        disabledBorder: InputBorder.none,
        labelText: title,
        labelStyle: TextStyle(
          color: context.colorScheme.light!.withOpacity(0.5),
        ),
        counterText: '',
        suffixIcon:
            icon != null ? Icon(icon, color: context.colorScheme.light!) : null,
      ),
      maxLength: maxLength,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: (value) {
        return validator(value);
      },
      onSaved: (String? value) {
        if (onSave != null) onSave!(value);
      },
      onChanged: (String? value) {
        if (onSave != null) onSave!(value);
      },
      onFieldSubmitted: (String? value) {
        if (onSubmit != null) onSubmit!(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        color: context.colorScheme.light!,
      ),
    );
  }
}
