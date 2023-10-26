import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_get_session.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../mock_helper.dart';

void main() {
  late final AuthGetSession usecase;
  late final MockAuthRepository mockRepository;

  setUpAll(() {
    mockRepository = MockAuthRepository();
    usecase = AuthGetSession(mockRepository);
  });

  const tSession = testAuth;

  mockRepositoryCaller() => mockRepository.getSession();

  usecaseCaller() => usecase.execute();

  test('should be a return a token when execute is successfully', () async {
    // Arrange
    when(() => mockRepositoryCaller())
        .thenAnswer((_) async => const Right(tSession));
    // Act
    final call = await usecaseCaller();
    // Assert
    verify(() => mockRepositoryCaller());
    expect(call, const Right(tSession));
  });
}
