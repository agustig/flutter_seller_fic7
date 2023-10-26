import 'dart:convert';

import 'package:flutter_seller_fic7/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_seller_fic7/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_object.dart';
import '../../mock_helper.dart';

void main() {
  late final AuthLocalDataSource dataSource;
  late final MockSharedPreferences mockSharedPreferences;

  setUpAll(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        AuthLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  const prefKey = 'session';
  const tAuthModel = testAuthModel;
  final tAuthModelJson = json.encode(tAuthModel.toMap());

  group('getSession function:', () {
    test('should return session when process is successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(prefKey))
          .thenReturn(tAuthModelJson);
      // Act
      final call = await dataSource.getSession();
      // Assert
      expect(call, tAuthModel);
    });

    test('should return null when saved session is null', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(prefKey))
          .thenAnswer((_) => null);
      // Act
      final call = await dataSource.getSession();
      // Assert
      expect(call, null);
    });

    test('should return DatabaseException when getting saved session is error',
        () {
      // Arrange
      when(() => mockSharedPreferences.getString(prefKey))
          .thenThrow(Exception());
      // Act
      final call = dataSource.getSession();
      // Assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('removeSession function:', () {
    test('should return true when remove session is successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.remove(prefKey))
          .thenAnswer((_) async => true);
      // Act
      final call = await dataSource.removeSession();
      // Assert
      expect(call, true);
    });

    test(
        'should return DatabaseException when remove session is unsuccessfully',
        () async {
      // Arrange
      when(() => mockSharedPreferences.remove(prefKey))
          .thenAnswer((_) async => false);
      // Act
      final call = dataSource.removeSession();
      // Assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });

    test('should return DatabaseException when saved session is error', () {
      // Arrange
      when(() => mockSharedPreferences.remove(prefKey)).thenThrow(Exception());
      // Act
      final call = dataSource.removeSession();
      // Assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('saveToken function:', () {
    test('should return true when save token is successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(prefKey, tAuthModelJson))
          .thenAnswer((_) async => true);
      // Act
      final call = await dataSource.saveSession(tAuthModel);
      // Assert
      expect(call, true);
    });

    test('should return DatabaseException when save session is unsuccessfully',
        () async {
      // Arrange
      when(() => mockSharedPreferences.setString(prefKey, tAuthModelJson))
          .thenAnswer((_) async => false);
      // Act
      final call = dataSource.saveSession(tAuthModel);
      // Assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });

    test('should return DatabaseException when saved session is error', () {
      // Arrange
      when(() => mockSharedPreferences.setString(prefKey, tAuthModelJson))
          .thenThrow(Exception());
      // Act
      final call = dataSource.saveSession(tAuthModel);
      // Assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });
}
