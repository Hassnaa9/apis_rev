import 'package:apis_rev/core/api/end_points.dart';
import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[ApiKey.token] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //         ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
    //         : null;
    super.onRequest(options, handler);
  }
}