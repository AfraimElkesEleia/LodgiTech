import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final ValueChanged<T?>? onSelected;
  final double? width;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final T? initialSelection;
  final String? hintText;
  final bool enableSearch;
  final InputDecoration? inputDecoration;
  final MenuStyle? menuStyle;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const CustomDropDownMenu({
    super.key,
    required this.dropdownMenuEntries,
    this.onSelected,
    this.width = 200,
    this.leadingIcon,
    this.trailingIcon,
    this.initialSelection,
    this.hintText,
    this.enableSearch = false,
    this.inputDecoration,
    this.menuStyle,
    this.textStyle,
    this.contentPadding,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enableSearch: enableSearch,
      width: width,
      menuStyle: menuStyle ?? _getDefaultMenuStyle(),
      inputDecorationTheme: _getInputDecorationTheme(),
      textStyle: textStyle ?? _getDefaultTextStyle(),
      initialSelection: initialSelection,
      onSelected: onSelected,
      leadingIcon: leadingIcon,
      trailingIcon:
          trailingIcon ??
          Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
      hintText: hintText,
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }

  MenuStyle _getDefaultMenuStyle() {
    return MenuStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      elevation: const WidgetStatePropertyAll(4),
      shadowColor: const WidgetStatePropertyAll(Colors.black12),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
    );
  }

  InputDecorationTheme _getInputDecorationTheme() {
    if (inputDecoration != null) {
      return InputDecorationTheme(
        border: inputDecoration!.border,
        enabledBorder: inputDecoration!.enabledBorder,
        focusedBorder: inputDecoration!.focusedBorder,
        contentPadding: inputDecoration!.contentPadding,
        filled: inputDecoration!.filled,
        fillColor: inputDecoration!.fillColor,
        hintStyle: inputDecoration!.hintStyle,
        suffixIconColor: inputDecoration!.suffixIconColor,
      );
    }

    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
      ),
      contentPadding:
          contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      filled: true,
      fillColor: backgroundColor ?? const Color(0xFFF3F3F5),
      hintStyle: TextStyle(color: Colors.grey.shade600),
      suffixIconColor: Colors.grey.shade600,
    );
  }

  TextStyle _getDefaultTextStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade800,
    );
  }
}

class StringDropDownMenu extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String?>? onSelected;
  final double? width;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? initialSelection;
  final String? hintText;
  final bool enableSearch;
  final InputDecoration? inputDecoration;
  final MenuStyle? menuStyle;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String Function(String)? valueTransformer;

  const StringDropDownMenu({
    super.key,
    required this.items,
    this.onSelected,
    this.width = 200,
    this.leadingIcon,
    this.trailingIcon,
    this.initialSelection,
    this.hintText,
    this.enableSearch = false,
    this.inputDecoration,
    this.menuStyle,
    this.textStyle,
    this.contentPadding,
    this.backgroundColor,
    this.borderRadius,
    this.valueTransformer,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomDropDownMenu<String>(
        dropdownMenuEntries: items.map((item) {
          return DropdownMenuEntry<String>(
            value: valueTransformer != null ? valueTransformer!(item) : item,
            label: item,
            style: MenuItemButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fixedSize: Size(constraints.maxWidth, 60),
            ),
          );
        }).toList(),
        onSelected: onSelected,
        width: width,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        initialSelection: initialSelection ?? items.first,
        hintText: hintText,
        enableSearch: enableSearch,
        inputDecoration: inputDecoration,
        menuStyle: menuStyle,
        textStyle: textStyle,
        contentPadding: contentPadding,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
      ),
    );
  }
}
