import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/api/api_interceptor.dart';
import 'core/api/url_creator.dart';
import 'core/device/network_info.dart';
import 'features/calculator/data/datasources/calculator_remote_data_source.dart';
import 'features/calculator/data/repositories/calculator_repository.dart';
import 'features/calculator/domain/repositories/i_calculator_repository.dart';
import 'features/calculator/domain/usecases/get_calculator_usecase.dart';
import 'features/calculator/presentation/bloc/calculator_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<IHttpClient>(() => HttpClient());
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton<IUrlCreator>(() => UrlCreator());

  sl.registerLazySingleton(() => CalculatorBloc(sl()));
  sl.registerLazySingleton(() => GetCalculatorUseCase(sl()));
  sl.registerLazySingleton<ICalculatorRepository>(
      () => CalculatorRepository(sl()));
  sl.registerLazySingleton<ICalculatorRemoteDataSource>(
      () => CalculatorRemoteDataSource(sl(), sl(), sl()));

  await sl.allReady();
}
