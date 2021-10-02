
import 'package:flutter/material.dart';
import 'package:quotes/core/base_bloc.dart';

class PictureState extends BaseState {
  @override
  final Status status;
  final String? url;

  PictureState({required this.status, this.url}) {
    debugPrint(toString());
  }

  @override
  String toString() => '$runtimeType $status $url';
}