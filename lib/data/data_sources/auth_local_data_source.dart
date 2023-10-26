import 'dart:convert';

import 'package:flutter_seller_fic7/data/models/auth_model.dart';
import 'package:flutter_seller_fic7/data/models/user_model.dart';
import 'package:flutter_seller_fic7/utils/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<AuthModel?> getSession();
  Future<bool> removeSession();
  Future<bool> saveSession(AuthModel session);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const _prefKey = 'session';

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AuthModel?> getSession() async {
    try {
      final result = sharedPreferences.getString(_prefKey);
      if (result != null) {
        final Map<String, dynamic> resultMap = json.decode(result);
        return AuthModel(
          token: resultMap['auth_token'],
          user: UserModel.fromMap(resultMap['user']),
        );
      } else {
        return null;
      }
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> removeSession() async {
    try {
      final result = await sharedPreferences.remove(_prefKey);
      if (result) {
        return true;
      }
      throw DatabaseException('Failed to remove session');
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> saveSession(AuthModel session) async {
    try {
      final sessionJson = json.encode(session.toMap());
      final result = await sharedPreferences.setString(_prefKey, sessionJson);
      if (result) {
        return true;
      }
      throw DatabaseException('Failed to save session');
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
