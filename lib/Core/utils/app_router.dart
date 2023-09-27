import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/service_locator.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social_app/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/login_view.dart';
import 'package:social_app/Features/Home/presentation/views/home_view.dart';
import '../../Features/Auth/data/repos/auth_repo_impl.dart';
import '../../Features/Auth/presentation/views/register_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
