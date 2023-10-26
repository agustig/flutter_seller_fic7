import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_remove_token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock_helper.dart';

void main() {
  late final AuthRemoveToken usecase;
  late final MockAuthRepository mockRepository;

  setUpAll(() {
    mockRepository = MockAuthRepository();
    usecase = AuthRemoveToken(mockRepository);
  });

  mockRepositoryCaller() => mockRepository.removeSession();

  usecaseCaller() => usecase.execute();

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
