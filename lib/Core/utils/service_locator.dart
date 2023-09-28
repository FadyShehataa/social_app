import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo_impl.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());

  getIt.registerSingleton<NewsFeedRepoImpl>(NewsFeedRepoImpl());

}
