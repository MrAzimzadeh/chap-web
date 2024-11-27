import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String key;
  final String title;
  final String route;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final FocusNode? focusNode;
  bool isSelected;

  MenuItem({
    required this.key,
    required this.title,
    required this.route,
    this.focusNode,
    this.isSelected = false,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);

  MenuItem copyWith({
    String? key,
    String? title,
    String? route,
    bool? isSelected,
  }) {
    return MenuItem(
      key: key ?? this.key,
      title: title ?? this.title,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
