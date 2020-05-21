

import 'package:http_interceptor/http_interceptor.dart';

class Interceptor implements InterceptorContract{
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // TODO: implement interceptRequest
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // TODO: implement interceptResponse
    return data;
  }

}