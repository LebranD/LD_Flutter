

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter/app/app.dart';
import 'package:first_flutter/app/app_manager.dart';
import 'package:first_flutter/manager/user_manager.dart';
import 'package:first_flutter/module/utility/platform_utility.dart';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import 'package:quiver/strings.dart';

class Request {

  static Future<dynamic> get(String path,[Map params]) async {

  }

  static Future<dynamic> start(
    String path, {
        Map params,
        CancelToken cancelToken,
        String method = 'GET',
        int cacheSeconds = 0,
        bool ignoreCache = false,
        int connectTimeout = 15 * 1000,
        int retryCount = 0,
  }) async {
    var cacheUrl;
    if (cacheSeconds > 0) {
      cacheUrl = RequestCache.instance.getUrl(path, params);
      if (!ignoreCache) {
        var cache = await RequestCache.instance.load(cacheUrl);
        if (cache != null) {
          return cache;
        }
      }

    }

  }

  static Dio createDio(int connectTimeout) {
    var options = BaseOptions(
      baseUrl: apiHost,
      headers: getHeader(),
      contentType: ContentType.json,
      connectTimeout: connectTimeout,
      receiveTimeout: 5000,
      validateStatus: (int status) {
        return status < 400;
      }
    );

    var dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (Response response) {

      },
      onError: (DioError error) {

      },
    ));
    
    Future future = new Future(() {
      
    });
    future.whenComplete(() => dio.unlock());
    
    
    return dio;
  }

  static Map getHeader() {

    var appMgr = AppManager.instance;

    Map<String, dynamic> header = {};
    header['x-channel-id'] = appMgr.channelId;
    header['x-version'] = packageInfo.version;
    header['x-app-patch'] = patchId;
    header['x-package-type'] = flavor.app.packageType;
    header['User-Agent'] = FlutterUserAgent.userAgent + ' iNovel/${packageInfo.version}';
    header['x-uuid'] = appMgr.uuid;

    var token = currentUser?.token;
    if (isNotEmpty(token)) {
      header['authorization'] = 'Bearer ' + token;
    }
    header['x-platform'] = platformUtility.platformName;
    if (Platform.isAndroid) {
      header['x-imei'] = appMgr.imei ?? 'unknown';
      header['x-android-id'] = androidDeviceInfo.androidId;
      if (isNotEmpty(appMgr.aaid)) {
        header['x-idfa'] = appMgr.aaid;
      }
      if (isNotEmpty(appMgr.mac)) {
        header['x-mac'] = appMgr.mac;
      }
    }
    if (Platform.isIOS) {
      header['x-idfa'] = appMgr.idfa;
    }
    header['x-zaid'] = appMgr.zaid;
    header['x-gender'] = UserManager.instance.genderDesc;
    header['x-locale'] = locale;

    return header;
  }

}