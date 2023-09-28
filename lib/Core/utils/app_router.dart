import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/service_locator.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social_app/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/login_view.dart';
import 'package:social_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:social_app/Features/Home/presentation/views/home_view.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/create_post_view.dart';
import 'package:social_app/Features/Profile/presentation/manager/profile_cubit/profile_cubit.dart';
import '../../Features/Auth/data/repos/auth_repo_impl.dart';
import '../../Features/Auth/presentation/views/register_view.dart';
import '../../Features/Profile/presentation/views/edit_profile_view.dart';
import 'constants.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kNewPostView = '/newPostView';
  static const kEditProfileView = '/editProfileView';

  static final router = GoRouter(
    routes: [
      // check if user is logged in or not
      // if logged in go to home view, else go to login view
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (uId != null && uId!.isNotEmpty) {
            return BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
              child: const HomeView(),
            );
          } else {
            return BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
              child: const LoginView(),
            );
          }
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(
            getIt.get<AuthRepoImpl>(),
          ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kNewPostView,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
          child: CreatePostView(),
        ),
        // builder: (context, state) => CreatePostView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(),
            ),
          ],
          child: const EditProfileView(),
        ),
      ),
    ],
  );
}
