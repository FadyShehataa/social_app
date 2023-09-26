import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/login_view.dart';
import '../../Features/Auth/presentation/views/register_view.dart';

abstract class AppRouter {
  // static const kSplashView = '/';
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(
              // getIt.get<HomeRepoImpl>(),
              ),
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
