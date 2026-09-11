import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopy_app/Core/api/api_service.dart';
import 'package:shopy_app/features/auth/data/repos/auth_repo.dart';
import 'package:shopy_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shopy_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:shopy_app/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:shopy_app/features/product_details/data/repos/home_repo.dart';
import 'package:shopy_app/features/product_details/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  // 1. Dio & ApiService
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        // ⚠️ مهم جداً اختيار الـ IP المناسب:
        // - محاكي أندرويد (Android Emulator): http://10.0.2.2:1337
        // - جهاز حقيقي (Physical Device): http://192.168.x.x:1337 (IP جهاز الكمبيوتر)
        baseUrl: 'http://10.0.2.2:1337',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    return dio;
  });
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // 2. Auth , Home Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<ApiService>()),
  );

  // 3. Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepo>()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<AuthRepo>()));
}
