import 'package:flutter_seller_fic7/data/api/remote_api.dart';
import 'package:flutter_seller_fic7/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_seller_fic7/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_seller_fic7/domain/repositories/auth_repository.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_get_session.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_login.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_logout.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_register.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_remove_token.dart';
import 'package:flutter_seller_fic7/domain/usecases/auth/auth_save_token.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock External
class MockClient extends Mock implements http.Client {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

// class MockStorage extends Mock implements Storage {}

// Mock Data Sources
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

// Mock Repositories
class MockAuthRepository extends Mock implements AuthRepository {}

// Mock Use Cases
class MockAuthRegister extends Mock implements AuthRegister {}

class MockAuthLogin extends Mock implements AuthLogin {}

class MockAuthLogout extends Mock implements AuthLogout {}

class MockAuthGetToken extends Mock implements AuthGetSession {}

class MockAuthRemoveToken extends Mock implements AuthRemoveToken {}

class MockAuthSaveToken extends Mock implements AuthSaveToken {}

// Mock Mixins
class MockRemoteApi with RemoteApi {}
