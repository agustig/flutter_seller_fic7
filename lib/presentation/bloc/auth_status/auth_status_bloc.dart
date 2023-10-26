import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_seller_fic7/domain/entities/auth.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_get_session.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';
part 'auth_status_bloc.freezed.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  final AuthGetSession _authGetSession;

  AuthStatusBloc(AuthGetSession authGetSession)
      : _authGetSession = authGetSession,
        super(const _Unauthenticated()) {
    on<_Check>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await _authGetSession.execute();
        result.fold(
            (failure) => throw failure,
            (session) => emit((session != null)
                ? _Authenticated(session)
                : const _Unauthenticated()));
      } on Failure catch (failure) {
        emit(_Error(failure.message));
      }
    });
  }
}
