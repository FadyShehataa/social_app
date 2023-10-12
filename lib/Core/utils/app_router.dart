import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Core/utils/service_locator.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social_app/Features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/login_view.dart';
import 'package:social_app/Features/Chat/data/repos/chat_repo_impl.dart';
import 'package:social_app/Features/Chat/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:social_app/Features/Chat/presentation/views/chat_details_view.dart';
import 'package:social_app/Features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:social_app/Features/Home/presentation/views/home_view.dart';
import 'package:social_app/Features/News%20Feed/data/models/post_model.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo_impl.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/create_post_view.dart';
import 'package:social_app/Features/Profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:social_app/Features/Splash/presentation/views/splash_view.dart';
import '../../Features/Auth/data/repos/auth_repo_impl.dart';
import '../../Features/Auth/presentation/views/register_view.dart';
import '../../Features/News Feed/presentation/views/edit_post_view.dart';
import '../../Features/Profile/data/repos/edit_profilr_repo_impl.dart';
import '../../Features/Profile/presentation/views/edit_profile_view.dart';
import 'constants.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kAfterSplashView = '/afterSplashView';
  static const kNewPostView = '/newPostView';
  static const kEditPostView = '/editPostView';
  static const kEditProfileView = '/editProfileView';
  static const kChatDetailsView = '/chatDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
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
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
            ),
            BlocProvider(
              create: (context) =>
                  NewsFeedCubit(getIt.get<NewsFeedRepoImpl>())..getPosts(),
            ),
            BlocProvider(
              create: (context) =>
                  ChatCubit(getIt.get<ChatRepoImpl>())..getUsersForChat(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kAfterSplashView,
        builder: (context, state) {
          // check if user is logged in or not
          // if logged in go to home view, else go to login view
          if (uId != null && uId!.isNotEmpty) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => HomeCubit()..getUserData(),
                ),
                BlocProvider(
                  create: (context) =>
                      NewsFeedCubit(getIt.get<NewsFeedRepoImpl>())..getPosts(),
                ),
                BlocProvider(
                  create: (context) =>
                      ChatCubit(getIt.get<ChatRepoImpl>())..getUsersForChat(),
                ),
              ],
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
        path: kNewPostView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
            ),
            BlocProvider(
              create: (context) => NewsFeedCubit(getIt.get<NewsFeedRepoImpl>()),
            ),
          ],
          child: const CreatePostView(),
        ),
      ),
      GoRoute(
        path: kEditPostView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
            ),
            BlocProvider(
              create: (context) => NewsFeedCubit(getIt.get<NewsFeedRepoImpl>()),
            ),
          ],
          child: EditPostView(
            postModel: state.extra as PostModel,
          ),
        ),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit()..getUserData(),
            ),
            BlocProvider(
              create: (context) =>
                  ProfileCubit(getIt.get<EditProfileRepoImpl>()),
            ),
          ],
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: kChatDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => ChatCubit(getIt.get<ChatRepoImpl>())
            ..getMessages((state.extra as UserModel).uId!),
          child: ChatDetailsView(userModel: state.extra as UserModel),
        ),
      ),
    ],
  );
}
