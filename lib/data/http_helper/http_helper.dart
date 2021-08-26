import 'dart:convert';
import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:nabed_test/config/chache_manager.dart';
import 'package:nabed_test/config/constants.dart';
import 'package:nabed_test/config/network_error.dart';
import 'package:nabed_test/model/image_card/image_list.dart';
import 'package:nabed_test/model/serializer/serializer.dart';

import 'ihttpe_helper.dart';

class HttpHelper implements IHttpHelper {
  final Dio _dio;

  HttpHelper(this._dio) {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
      ),
    );
  }

  @override
  Future<ImageList?> getImages(int pageNumber) async {
    print("test api");
    try {
      final response = await _dio.get('?key=' + API_KEY + "&page=$pageNumber");

      print('imageList Response StatusCode ${response.statusCode}');

      if (response.statusCode == 200) {
        print('imageList Response body  ${response.data}');

        final ImageList baseResponse = serializers.deserialize(
            json.decode(response.data),
            specifiedType: FullType(ImageList)) as ImageList;

        print("imageList status : ${baseResponse}");
        if (baseResponse != null) {
          return baseResponse;
        } else {
          // throw NetworkException();
        }
      }
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          print("test");
          return null;
        }
      }
      print("test");
    }
  }
}
