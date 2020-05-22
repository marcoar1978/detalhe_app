

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:detalhe_app1/bloc/LoginBloc.dart';


class Interceptor implements InterceptorContract{

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.headers["Content-Type"] = "application/json";
      data.headers["Authorization"] = "Bearer ${BlocProvider.getBloc<LoginBloc>().token.value}";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // TODO: implement interceptResponse
    return data;
  }

}