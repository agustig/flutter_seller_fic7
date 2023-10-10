import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_seller_fic7/injection.dart' as di;
import 'package:flutter_seller_fic7/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_seller_fic7/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:flutter_seller_fic7/presentation/pages/auth/auth_page.dart';
import 'package:flutter_seller_fic7/presentation/pages/dashboard/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await di.locator.isReady<SharedPreferences>();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthBloc>()),
        BlocProvider(
            create: (_) => di.locator<AuthStatusBloc>()
              ..add(const AuthStatusEvent.check())),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: BlocBuilder<AuthStatusBloc, AuthStatusState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const AuthPage(),
              authenticated: (authToken) => const DashboardPage(),
              loading: () => const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }
}
