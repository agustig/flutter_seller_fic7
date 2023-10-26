import 'package:dartz/dartz.dart';
import 'package:flutter_seller_fic7/domain/entities/auth.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/utils/failure.dart';

class AuthGetSession {
  final AuthRepository repository;

  AuthGetSession(this.repository);

  Future<Either<Failure, Auth?>> execute() {
    return repository.getSession();
  }
}
