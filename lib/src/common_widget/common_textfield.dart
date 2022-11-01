import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.title,
    this.controller,
    this.isError,
    this.errorText,
    this.maxLines = 1,
    this.height = 100,
    this.width = 300,
    this.isDense = true,
    this.suffix,
    this.hintText,
    this.prefix,
    this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.inactiveBorderColor = Colors.grey,
    this.filledColor = Colors.white,
    this.onTap,
    this.onSubmitted,
    this.lableText,
    this.enabled = true,
    this.obscureText = false,
    this.titleFontSize,
    this.labelColor = Colors.green,
    this.textColor = Colors.black,
    this.focusColor = Colors.transparent,
    this.cursorColor = Colors.black,
    this.lableStyle,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.autofocus = false,
    this.keyboardType,
    this.hintStyle = const TextStyle(fontSize: 14),
  }) : super(key: key);
  final String? title;
  final TextEditingController? controller;
  final bool? isError;
  final String? errorText;
  final int? maxLines;
  final double height;
  final double width;
  final bool isDense;
  final Widget? suffix;
  final String? hintText;
  final Widget? prefix;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final Color inactiveBorderColor;
  final Color filledColor;
  final GestureTapCallback? onTap;
  final Function(String)? onSubmitted;
  final String? lableText;
  final Color? labelColor;
  final bool enabled;
  final bool obscureText;
  final double? titleFontSize;
  final Color textColor;
  final Color focusColor;
  final Color cursorColor;
  final TextStyle? lableStyle;
  final String? Function(String)? validator;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    bool isDesktop = false;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? const SizedBox.shrink()
              : Text(
                  ' $title',
                  style: TextStyle(fontSize: titleFontSize),
                ),
          TextFormField(
            autofocus: autofocus,
            textInputAction: textInputAction,
            validator: (str) => validator?.call(str!),
            showCursor: true,
            obscureText: obscureText,
            enabled: enabled,
            onFieldSubmitted: onSubmitted,
            onTap: onTap,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            maxLines: maxLines,
            controller: controller,
            cursorColor: cursorColor,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                color: labelColor,
                fontSize: 16,
              ),
              labelStyle: lableStyle,
              labelText: lableText,
              alignLabelWithHint: true,
              hintText: hintText,
              hintStyle: hintStyle,
              isDense: true,
              fillColor: filledColor,
              filled: true,
              errorText: (isError ?? false) ? errorText : null,
              border: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: const BorderRadius.all(
                  Radius.circular(true ? 5 : 0),
                ),
                borderSide: BorderSide(color: inactiveBorderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(color: focusColor, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(true ? 5 : 0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(color: inactiveBorderColor, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(true ? 5 : 0),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(color: inactiveBorderColor, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(true ? 5 : 0),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(true ? 5 : 0),
                ),
              ),
              suffixIcon: suffix,
              prefixIcon: prefix,
            ),
          ),
        ],
      ),
    );
  }
}
