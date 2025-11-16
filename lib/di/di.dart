import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  //register ecommerce api client
  getIt.registerLazySingleton<EcommerceApiClient>(() {
    final apiUrl = dotenv.env["API_URL"];
    final dio = getIt<Dio>();
    // ..interceptors.add(
    // TalkerDioLogger(
    //   settings: const TalkerDioLoggerSettings(
    //     printRequestHeaders: true,
    //     printResponseHeaders: true,
    //     printResponseMessage: true,
    //   ),
    // ),
    // );
    return EcommerceApiClient(dio, baseUrl: apiUrl);
  });
}
