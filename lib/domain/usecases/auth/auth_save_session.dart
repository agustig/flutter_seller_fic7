import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/entities/auth.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';

class AuthSaveSession {
  final AuthRepository repository;

  AuthSaveSession(this.repository);

  Future<Either<Failure, bool>> execute(Auth session) {
    return repository.saveSession(session);
  }
}
