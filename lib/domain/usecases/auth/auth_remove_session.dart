import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';

class AuthRemoveSession {
  final AuthRepository repository;

  AuthRemoveSession(this.repository);

  Future<Either<Failure, bool>> execute() {
    return repository.removeSession();
  }
}
