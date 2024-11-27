// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      key: json['key'] as String,
      title: json['title'] as String,
      route: json['route'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'route': instance.route,
      'isSelected': instance.isSelected,
    };
