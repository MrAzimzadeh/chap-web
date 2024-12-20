import 'package:flutter/material.dart';

class AppSearchBar extends TextFormField {
  AppSearchBar({
    super.key,
    super.controller,
    super.initialValue,
    super.focusNode,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    super.style,
    super.strutStyle,
    super.textDirection,
    super.textAlign,
    super.textAlignVertical,
    super.autofocus,
    super.readOnly,
    super.showCursor,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLengthEnforcement,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.onChanged,
    super.onTap,
    super.onTapOutside,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.buildCounter,
    super.scrollPhysics,
    super.autofillHints,
    super.autovalidateMode,
    super.scrollController,
    super.restorationId,
    super.enableIMEPersonalizedLearning,
    super.mouseCursor,
    super.contextMenuBuilder,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.undoController,
    super.onAppPrivateCommand,
    super.cursorOpacityAnimates,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.dragStartBehavior,
    super.contentInsertionConfiguration,
    super.clipBehavior,
    super.scribbleEnabled,
    super.canRequestFocus,
    InputDecoration decoration = const InputDecoration(),
    String? hintText,
  }) : super(
          decoration: decoration.copyWith(
            hintText: hintText,
            prefixIcon: const Icon(Icons.search, size: 26),
          ),
        );
}
