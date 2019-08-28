import 'dart:io';

import 'package:dio/dio.dart';

typedef ProgressCallback = void Function(int count, int total);

class BaseHttpUtil {}

class HttpUtil extends BaseHttpUtil {
  static HttpUtil _instance;

  static HttpUtil get instance => _getInstance();

  factory HttpUtil() => _getInstance();
  Dio _dio;
  BaseOptions _options;

  static HttpUtil _getInstance() {
    if (_instance == null) {
      _instance = HttpUtil._internal();
    }
    return _instance;
  }

  _onRequest(RequestOptions options) {
    // print(options);
  }

  _onResponse(Response response) {
    print("-----------information--------------->");
    print("url:${response.request.uri}");
    print("method:${response.request.method}");
    print("param:${response.request.queryParameters.toString()}");
    print("code:${response.statusCode}");
    print("data:${response.data}");

    print("------------------------------------->");
  }

  _onError(DioError error) {
    // print(error);
  }

  HttpUtil._internal() {
    _options = BaseOptions();
    _options.connectTimeout = 1000;
    _options.receiveTimeout = 5000;
    _options.baseUrl = "https://www.apiopen.top/";
    _options.headers = {};
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  Future get(String path, {Map<String, dynamic> param}) async {
    return await _dio.get(path, queryParameters: param);
  }

  Future post(String path, {Map<String, dynamic> param}) async {
    FormData formaData = FormData.from(param);
    return _post(path, param: formaData);
  }

  Future downLoadFile(String urlPath, String savePath,
      {ProgressCallback onReceiveProgress}) async {
    return await _dio.download(urlPath, savePath,
        onReceiveProgress: onReceiveProgress);
  }

  Future uploadFile(
      String path, Map<String, dynamic> params, Map<String, String> files,
      {ProgressCallback progressCallback}) async {
    Map<String, dynamic> tempParams = Map();
    tempParams.addAll(params);
    tempParams.addAll(files);
    FormData formData = FormData.from(tempParams);
    _dio.post(path, data: formData, onSendProgress: progressCallback);
  }

  Future _post(String path,
      {FormData param, ProgressCallback progressCallback}) async {
    return await _dio.post(path,
        queryParameters: param, onSendProgress: progressCallback);
  }
}
