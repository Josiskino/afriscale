// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:hive/hive.dart';

// import '../../data/datasources/local/auth_local_data_source.dart';
// import '../../data/datasources/remote/auth_remote_data_source.dart';
// import '../../data/models/user_model.dart';
// import '../../data/repositories/auth_repository_impl.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../../domain/usecases/auth/register_usecase.dart';
// import '../../domain/usecases/auth/send_otp_usecase.dart';
// import '../../domain/usecases/auth/verify_otp_usecase.dart';
// import '../abstract/api_client_interface.dart';
// import '../constants/api_constant.dart';
// import '../services/api_client.dart';
// import '../utils/network_info.dart';

// final di = GetIt.instance;

// Future<void> initDependencies() async {
//   // Core
//   di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  
//   // Dio Configuration
//   di.registerLazySingleton(() => Dio(BaseOptions(
//     baseUrl: ApiConstant.baseUrl,
//     // connectTimeout: const Duration(seconds: 5),
//     // receiveTimeout: const Duration(seconds: 3),
//     headers: {'Content-Type': 'application/json'},
//   )));

//   // API Client
//   di.registerLazySingleton<ApiClientInterface>(
//     () => DioClient(dio: di<Dio>())
//   );

//   // DataSources
//   final userBox = await Hive.openBox<UserModel>('users');
  
//   di.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImpl(userBox: userBox)
//   );

//   di.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImpl(apiClient: di<ApiClientInterface>())
//   );

//   // Repository
//   di.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
//     remoteDataSource: di<AuthRemoteDataSource>(),
//     localDataSource: di<AuthLocalDataSource>(),
//     networkInfo: di<NetworkInfo>(),
//   ));

//   // UseCases
//   di.registerLazySingleton(() => SendOtpUseCase(repository: di<AuthRepository>()));
//   di.registerLazySingleton(() => VerifyOtpUseCase(repository: di<AuthRepository>()));
//   di.registerLazySingleton(() => RegisterUseCase(authRepository: di<AuthRepository>()));
// }