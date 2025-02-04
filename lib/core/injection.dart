import 'package:get_it/get_it.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Registering Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Registering UseCase
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

  // Registering Bloc
  sl.registerFactory(() => AuthBloc(sl<LoginUseCase>()));
}

