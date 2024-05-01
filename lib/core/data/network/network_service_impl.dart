// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/core/data/network/utilities/guarded_datasource_calls.dart';
import 'package:typeform_app/core/platform/flavor_config.dart';
import 'package:typeform_app/core/platform/utilities/utilities.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:typeform_app/features/authentication/data/models/user_model.dart';
import 'package:typeform_app/features/authentication/domain/authentication_module_injector.dart';

class NetworkServiceImpl implements NetworkService {
  var _dio = Dio();

  NetworkServiceImpl() {
    final options = BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      baseUrl: FlavorConfig.instance.flavorValues.baseUrl,
      connectTimeout: const Duration(seconds: 6),
    );

    _dio = Dio(options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra['token-required'] == true) {
            final personalAccUser = await guardedCacheAccess<UserModel?>(
                AuthenticationModuleInjector.resolve<
                        AuthenticationLocalDatasource>()
                    .getPersonalAccountUser);

            final token = personalAccUser?.token;
            options.headers.addAll({
              'Authorization': 'Bearer $token',
            });
          }

          return handler.next(options);
        },
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> getHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    bool tokenRequired = true,
    Map<String, dynamic>? headers,
    bool isAuthUrl = false,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: params,
        options: Options(
          extra: {
            'token-required': tokenRequired,
            'isAuthUrl': isAuthUrl,
          },
          headers: headers,
        ),
      );

      // logger.i(response.data);

      return _handleApiResponse(response);
    } on DioError catch (e) {
      logger.e(e.error.toString());

      logger.e(e.message);

      logger.e(e.response?.headers.toString());

      return _handleApiResponse(e.response);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> postHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    required dynamic body,
    Map<String, dynamic>? headers,
    bool tokenRequired = true,
    bool isAuthUrl = false,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        queryParameters: params,
        data: body,
        options: Options(
          extra: {
            'token-required': tokenRequired,
            'isAuthUrl': isAuthUrl,
          },
          headers: headers,
        ),
      );
      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> putHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool isPatch = false,
    bool tokenRequired = true,
    bool isAuthUrl = false,
  }) async {
    try {
      final response = isPatch
          ? await _dio.patch(
              endpoint,
              queryParameters: params,
              data: body,
              options: Options(
                extra: {
                  'token-required': tokenRequired,
                  'isAuthUrl': isAuthUrl,
                },
                headers: headers,
              ),
            )
          : await _dio.put(
              endpoint,
              queryParameters: params,
              data: body,
              options: Options(
                extra: {
                  'token-required': tokenRequired,
                  'isAuthUrl': isAuthUrl,
                },
                headers: headers,
              ),
            );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> deleteHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool tokenRequired = true,
    bool isAuthUrl = false,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: params,
        data: body,
        options: Options(
          extra: {
            'token-required': tokenRequired,
            'isAuthUrl': isAuthUrl,
          },
          headers: headers,
        ),
      );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  Map<String, dynamic> _handleApiResponse(Response? response) {
    logger.i("${response?.statusCode}\n\n${response?.data} ");

    if (response == null) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': "Something went wrong",
      };
    }

    if (response.statusCode! / 200 >= 1 && response.statusCode! / 200 < 1.5) {
      if (response.data == true) {
        return <String, dynamic>{'data': true};
      }

      if (response.data is Map && (response.data as Map).containsKey('data')) {
        return response.data as Map<String, dynamic>;
      }

      if (response.data is Map && (response.data as Map)['success'] == false) {
        return <String, dynamic>{
          'data': response.data,
          'message': (response.data['errors'] as List).join(', '),
          'error': ApiErrors.unknown
        };
      }

      return <String, dynamic>{'data': response.data};
    }

    final errorResult = <String, dynamic>{
      'message': response.data != null
          ? (response.data is Map)
              ? '${response.data['message']}'
              : 'Something went wrong'
          : 'Something went wrong',
      'data': response.data,
    };

    switch (response.statusCode) {
      case 400:
        errorResult['error'] = ApiErrors.badRequest;
        break;
      case 401:
        errorResult['error'] = ApiErrors.unauthenticated;
        break;
      case 403:
        errorResult['error'] = ApiErrors.notPermitted;
        break;
      case 404:
        errorResult['error'] = ApiErrors.notFound;
        break;
      case 422:
        errorResult['error'] = ApiErrors.validationFailed;
        break;
      case 500:
        errorResult['error'] = ApiErrors.serverError;
        break;
      default:
        errorResult['error'] = ApiErrors.unknown;
    }

    assert(errorResult['error'] != null);
    assert(errorResult['error'] is ApiErrors);

    assert(errorResult['message'] != null);
    assert(errorResult['message'] is String);

    return errorResult;
  }
}

enum ApiErrors {
  serverError,
  badRequest,
  notFound,
  validationFailed,
  unauthenticated,
  notPermitted,
  unknown,
  noInternet,
  failure,
}
