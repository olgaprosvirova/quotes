
import 'package:flutter/material.dart';
import 'package:quotes/core/base_bloc.dart';
import 'package:quotes/model/quote_model.dart';

class QuoteState extends BaseState {
  @override
  final Status status;
  final QuoteModel? quote;

  QuoteState({required this.status, this.quote}) {
    debugPrint(toString());
  }

  @override
  String toString() => '$runtimeType $status $quote';
}