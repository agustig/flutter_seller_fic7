import 'package:flutter_seller_fic7/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_seller_fic7/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_seller_fic7/data/repositories/auth_repository_impl.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_get_session.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_login.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_logout.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_register.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_remove_session.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_save_session.dart';
import 'package:flutter_seller_fic7/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_seller_fic7/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void init() {
  // Bloc
  locator.registerFactory(
    () => AuthBloc(
      authLogin: locator(),
      authRegister: locator(),
      authLogout: locator(),
      authSaveToken: locator(),
      authRemoveToken: locator(),
      authGetToken: locator(),
    ),
  );
  locator.registerFactory(() => AuthStatusBloc(locator()));

  // Usecases
  locator.registerLazySingleton(() => AuthRegister(locator()));
  locator.registerLazySingleton(() => AuthLogin(locator()));
  locator.registerLazySingleton(() => AuthLogout(locator()));
  locator.registerLazySingleton(() => AuthGetSession(locator()));
  locator.registerLazySingleton(() => AuthSaveSession(locator()));
  locator.registerLazySingleton(() => AuthRemoveSession(locator()));

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // DataSources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: locator()));

  // External
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());
}
