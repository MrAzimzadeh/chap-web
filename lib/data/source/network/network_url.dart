import 'package:json_annotation/json_annotation.dart';

part 'network_url.g.dart';

@JsonSerializable()
class NetworkUrl {
  final String logo;
  NetworkUrl({required this.logo});

  factory NetworkUrl.fromJson(Map<String, dynamic> json) =>
      _$NetworkUrlFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkUrlToJson(this);
}
