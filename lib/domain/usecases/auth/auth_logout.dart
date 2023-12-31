import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';

class AuthLogout {
  final AuthRepository repository;

  AuthLogout(this.repository);

  Future<Either<Failure, bool>> execute(String authToken) {
    return repository.logout(authToken);
  }
}
