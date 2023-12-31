import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../mock_helper.dart';

void main() {
  late AuthStatusBloc authStatusBloc;
  late MockAuthGetToken mockAuthGetToken;

  setUp(() {
    mockAuthGetToken = MockAuthGetToken();
    authStatusBloc = AuthStatusBloc(mockAuthGetToken);
  });

  const tSession = testAuth;

  test('initial setup should be unauthenticated', () {
    expect(authStatusBloc.state, const AuthStatusState.unauthenticated());
  });

  group('AuthStatusBloc', () {
    blocTest(
      'should return [loading, authenticated] state when saved token is exist',
      build: () {
        when(() => mockAuthGetToken.execute())
            .thenAnswer((_) async => Right(tSession));
        return authStatusBloc;
      },
      act: (bloc) => bloc.add(const AuthStatusEvent.check()),
      expect: () => [
        const AuthStatusState.loading(),
        AuthStatusState.authenticated(tSession)
      ],
    );

    blocTest(
      'should return [loading, unauthenticated] state when saved token is exist',
      build: () {
        when(() => mockAuthGetToken.execute())
            .thenAnswer((_) async => const Right(null));
        return authStatusBloc;
      },
      act: (bloc) => bloc.add(const AuthStatusEvent.check()),
      expect: () => [
        const AuthStatusState.loading(),
        const AuthStatusState.unauthenticated()
      ],
    );

    blocTest(
      'should return [loading, error] state when saved token is exist',
      build: () {
        when(() => mockAuthGetToken.execute()).thenAnswer(
            (_) async => const Left(DatabaseFailure('Database failure')));
        return authStatusBloc;
      },
      act: (bloc) => bloc.add(const AuthStatusEvent.check()),
      expect: () => [
        const AuthStatusState.loading(),
        const AuthStatusState.error('Database failure')
      ],
    );
  });
}
