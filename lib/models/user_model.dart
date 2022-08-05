import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User {
  const User({required this.mail, required this.password});

  final String mail;
  final String password;

  factory User.FromJson(Map<String, dynamic> json) =>
      User(mail: json['username'], password: json['password']);

  Map<String, dynamic> ToJson() => {"username": mail, "password": password};
}
