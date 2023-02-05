import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModel {
  final String acessToken;
  final String refreshToken;
  AuthModel({
    required this.acessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acessToken': acessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      acessToken: map['acessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
