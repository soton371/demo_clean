import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:demo_clean/core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final result = await remoteDataSource.login(email, password);
      return Right(result);
    }on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }on SocketException{
      return Left(ServerFailure(AppConstants.socketExceptionMessage));
    }
    catch (e) {
      return Left(ServerFailure(AppConstants.exceptionMessage));
    }
  }
}
