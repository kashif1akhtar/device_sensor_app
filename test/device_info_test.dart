import 'package:device_sensor_app/models/device_info_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoModel', () {
    late DeviceInfoModel model;

    setUp(() {
      const channel = MethodChannel('com.kashif.sensor.device_sensor_app');
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
        switch (call.method) {
          case 'getBatteryLevel':
            return 85;
          case 'getDeviceName':
            return 'Test Device';
          case 'getOsVersion':
            return 'Test OS 1.0';
          default:
            return null;
        }
      });
      model = DeviceInfoModel();
    });

    test('fetchDeviceInfo updates model values', () async {
      await model.fetchDeviceInfo();
      expect(model.batteryLevel, '85');
      expect(model.deviceName, 'Test Device');
      expect(model.osVersion, 'Test OS 2.0');
    });
  });
}