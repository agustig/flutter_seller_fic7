import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_save_session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../mock_helper.dart';

void main() {
  late final AuthSaveSession usecase;
  late final MockAuthRepository mockRepository;

  setUpAll(() {
    mockRepository = MockAuthRepository();
    usecase = AuthSaveSession(mockRepository);
  });
  const tSession = testAuth;

  mockRepositoryCaller() => mockRepository.saveSession(tSession);

  usecaseCaller() => usecase.execute(tSession);

  test('should be a return true when execute is successfully', () async {
    // Arrange
    when(() => mockRepositoryCaller())
        .thenAnswer((_) async => const Right(true));
    // Act
    final call = await usecaseCaller();
    // Assert
    verify(() => mockRepositoryCaller());
    expect(call, const Right(true));
  });
}
