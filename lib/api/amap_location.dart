import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/config/weather_api.dart';
import 'package:weather_app/model/amap_location_result.dart';

class GetLocation {
  AmapLocationResult? locationResult;
  late StreamSubscription<Map<String, Object>> locationListener;
  final AMapFlutterLocation location = AMapFlutterLocation();

  /// 初始化
  void init() async {
    try {
      /// [hasContains] 隐私声明中是否包含高德隐私政策说明
      ///
      /// [hasShow] 隐私权政策是否弹窗展示告知用户
      AMapFlutterLocation.updatePrivacyShow(true, true);

      /// [hasAgree] 隐私权政策是否已经取得用户同意
      AMapFlutterLocation.updatePrivacyAgree(true);

      /// 动态申请定位权限
      requestPermission();

      /// set API key
      AMapFlutterLocation.setApiKey(amapLocationApiKey, '');

      /// ios 获取native精度类荆
      if (Platform.isIOS) {
        iosRequestAccuracyAuth();
      }

      /// 注册定位结果监听
      await for (final value in location.onLocationChanged()) {
        locationResult = AmapLocationResult.fromJson(value);
        debugPrint(jsonEncode(value));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// 销毁
  void dispose() {
    /// 移除定位监听
    locationListener.cancel();

    /// 销毁定位
    location.destroy();
  }

  /// 设置定位参数
  void setOption() {
    if (null == location) {
      return;
    }

    AMapLocationOption option = AMapLocationOption();

    /// 是否单次定位
    option.onceLocation = false;

    /// 是否需要返回逆地理位置
    option.needAddress = true;

    /// 逆地理信息的语言
    option.geoLanguage = GeoLanguage.DEFAULT;

    option.desiredLocationAccuracyAuthorizationMode =
        AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;

    option.fullAccuracyPurposeKey = 'AMapLocationScene';

    /// 设置Android端连续定位的定位间隔
    option.locationInterval = 2000;

    /// 设置Android端的定位模式
    option.locationMode = AMapLocationMode.Hight_Accuracy;

    ///设置iOS端期望的定位精度
    /// 可选值：<br>
    /// <li>[DesiredAccuracy.Best] 最高精度</li>
    /// <li>[DesiredAccuracy.BestForNavigation] 适用于导航场景的高精度 </li>
    /// <li>[DesiredAccuracy.NearestTenMeters] 10米 </li>
    /// <li>[DesiredAccuracy.Kilometer] 1000米</li>
    /// <li>[DesiredAccuracy.ThreeKilometers] 3000米</li>
    option.desiredAccuracy = DesiredAccuracy.Best;

    /// 设置ios端是否允许系统暂停定位
    option.pausesLocationUpdatesAutomatically = false;

    /// 将定位参数设置给定位插件
    location.setLocationOption(option);
  }

  /// 动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    debugPrint(hasLocationPermission ? '定位权限申请通过' : '定位权限申请不通过');
  }

  /// 申请定位权限
  /// 授予定位权限返回true, 否则返回false
  Future<bool> requestLocationPermission() async {
    // 获取当前的权限
    var status = await Permission.location.status;
    // 已授权
    if (status == PermissionStatus.granted) {
      return true;
    }

    status = await Permission.location.request();

    return status == PermissionStatus.granted;
  }

  /// 获取IOS native的accuracyAuthorization类型
  void iosRequestAccuracyAuth() async {
    AMapAccuracyAuthorization currentAccuracyAuth =
        await location.getSystemAccuracyAuthorization();
    if (currentAccuracyAuth ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
      debugPrint("精确定位类型");
    } else if (currentAccuracyAuth ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
      debugPrint("模糊定位类型");
    } else {
      debugPrint("未知定位类型");
    }
  }

  // 开始定位
  void start() {
    if (null != location) {
      setOption();
      location.startLocation();
    }
  }

  // 停止定位
  void stop() {
    if (null != location) {
      location.stopLocation();
    }
  }
}
