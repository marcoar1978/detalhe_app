import 'package:detalhe_app1/http/interceptors/interceptor.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:http/http.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [Interceptor()],
  requestTimeout: Duration(seconds: 15),
);

const String baseUrl = 'http://ec2-54-82-227-244.compute-1.amazonaws.com';
