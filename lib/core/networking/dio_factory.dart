import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:holo_cart/core/networking/api_constants.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        followRedirects: false, // تعطيل المتابعة التلقائية لإعادة التوجيه
        validateStatus: (status) {
          return status != null && status <= 307; // قبول حالات إعادة التوجيه
        },
        contentType: Headers.formUrlEncodedContentType,
      ));

      // إضافة معالجة شهادات SSL باستخدام IOHttpClientAdapter
      if (dio!.httpClientAdapter is IOHttpClientAdapter) {
        (dio!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        };
      }

      addDioInterceptor();
      addDioHeaders();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': '*/*',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    dio?.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          // التعامل مع استجابات إعادة التوجيه
          if (response.statusCode == 301 || 
              response.statusCode == 302 || 
              response.statusCode == 303 || 
              response.statusCode == 307 || 
                            response.statusCode == 308) {
            
            String? redirectUrl = response.headers['location']?.first;
            if (redirectUrl != null) {
              print("تم اكتشاف إعادة توجيه إلى: $redirectUrl");
              
              // معالجة إعادة التوجيه
              _handleRedirect(response.requestOptions, redirectUrl, handler);
              return;
            }
          }
          
          // استمر بشكل طبيعي للاستجابات الأخرى
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          // التعامل مع خطأ إعادة التوجيه
          if (error.response?.statusCode == 301 || 
              error.response?.statusCode == 302 || 
              error.response?.statusCode == 303 || 
              error.response?.statusCode == 307 || 
              error.response?.statusCode == 308) {
            
            String? redirectUrl = error.response?.headers['location']?.first;
            if (redirectUrl != null) {
              print("تم اكتشاف إعادة توجيه في الخطأ إلى: $redirectUrl");
              
              // معالجة إعادة التوجيه
              _handleRedirect(error.requestOptions, redirectUrl, handler as ResponseInterceptorHandler);
              return;
            }
          }
          
          // تمرير الأخطاء الأخرى
          return handler.next(error);
        },
      ),
    );
  }
  
  // دالة مساعدة لمعالجة إعادة التوجيه
  static void _handleRedirect(RequestOptions requestOptions, String redirectUrl, ResponseInterceptorHandler handler) async {
    try {
      // الاحتفاظ بنفس طريقة الطلب والبيانات وإعدادات أخرى
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        contentType: requestOptions.contentType,
        responseType: requestOptions.responseType,
        followRedirects: false,
        validateStatus: (status) => status! <= 307,
      );
      
      // إعادة محاولة الطلب بعنوان URL الجديد
      final response = await dio!.request(
        redirectUrl,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      
      print("استجابة الطلب المعاد توجيهه: ${response.statusCode}");
      
      // قد نحتاج إلى التعامل مع إعادات توجيه متعددة
      if (response.statusCode == 301 || 
          response.statusCode == 302 || 
          response.statusCode == 303 || 
          response.statusCode == 307 || 
          response.statusCode == 308) {
        
        String? newRedirectUrl = response.headers['location']?.first;
        if (newRedirectUrl != null) {
          print("إعادة توجيه متسلسلة إلى: $newRedirectUrl");
          _handleRedirect(requestOptions, newRedirectUrl, handler);
          return;
        }
      }
      
      // إرسال الاستجابة النهائية
      handler.resolve(response);
    } catch (e) {
      print("فشل في معالجة إعادة التوجيه: $e");
      // إنشاء خطأ DioException جديد
      handler.reject(
        DioException(
          requestOptions: requestOptions,
          error: "فشل في متابعة إعادة التوجيه: $e",
        ),
      );
    }
  }
}