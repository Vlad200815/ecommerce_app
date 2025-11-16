import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'model/models.dart';

part "api.g.dart";

@RestApi(baseUrl: "")
abstract class EcommerceApiClient {
  factory EcommerceApiClient(Dio dio, {String? baseUrl}) = _EcommerceApiClient;

  @GET("products/search")
  Future<ProductSearchModel> searchProducts(@Query("q") String query);
}
