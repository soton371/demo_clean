import 'package:demo_clean/core/constants/app_urls.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import 'network/api_client.dart';

final sl = GetIt.instance;

void init() {
  // Registering API Client
  sl.registerLazySingleton<ApiClient>(() => ApiClient(baseUrl: AppUrls.baseUrl));

  // Registering Remote DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(apiClient: sl()));

  // Registering Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));

  // Registering UseCase
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Registering Bloc
  sl.registerFactory(() => AuthBloc(sl()));
}
