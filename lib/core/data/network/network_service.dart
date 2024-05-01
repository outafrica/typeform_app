abstract class NetworkService {
  Future<Map<String, dynamic>> getHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool tokenRequired,
    bool isAuthUrl,
  });

  Future<Map<String, dynamic>> postHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    required dynamic body,
    Map<String, dynamic>? headers,
    bool tokenRequired,
    bool isAuthUrl,
  });

  Future<Map<String, dynamic>> putHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool tokenRequired,
    bool isPatch,
    bool isAuthUrl,
  });

  Future<Map<String, dynamic>> deleteHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool tokenRequired,
    bool isAuthUrl,
  });
}
