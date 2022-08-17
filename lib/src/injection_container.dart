import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/routing/router.dart';
import 'package:data_extractor/src/utils/book_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'env.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerLazySingleton<FluroRouter>(FluroRouter.new)
    ..registerLazySingleton<TransitionApp>(TransitionApp.new)
    ..registerLazySingleton<RouterApp>(
      () => RouterApp(
        router: sl(),
        transition: sl<TransitionApp>().getTransition(),
      ),
    )
    ..registerLazySingleton<NavigationService>(NavigationService.new)
    ..registerLazySingleton<BookUtils>(BookUtils.new)

    // ! Data sources
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    )

    // ! Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        localDataSource: sl(),
      ),
    )

    // ! Use cases
    ..registerLazySingleton<SaveToken>(
      () => SaveToken(sl()),
    )
    ..registerLazySingleton<GetToken>(
      () => GetToken(sl()),
    );

  // ! Externals
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
}
