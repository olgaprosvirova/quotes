import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(initialState) : super(initialState);
}

enum Status { initial, loading, loaded, error }

abstract class BaseState {
  abstract final Status status;

  bool get isInitial => status == Status.initial;

  bool get isLoading => status == Status.loading;

  bool get isLoaded => status == Status.loaded;

  bool get isError => status == Status.error;
}
