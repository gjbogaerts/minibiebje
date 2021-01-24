import 'package:http_interceptor/http_interceptor.dart';
import 'my_logger.dart';
import 'dart:convert';

class LoggingInterceptor implements InterceptorContract {
  final _log = getLogger('LoggingInterceptor');
  @override
  Future<RequestData> interceptRequest({RequestData data}) {
    _log.i('Request: $data');
    return Future.value(data);
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) {
    _log.i('Response: ${json.decode(data.body)}');
    return Future.value(data);
  }
}
