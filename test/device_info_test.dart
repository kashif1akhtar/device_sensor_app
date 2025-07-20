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
            return 100;
          case 'getDeviceName':
            return 'Pixel 6';
          case 'getOsVersion':
            return '15';
          default:
            return null;
        }
      });
      model = DeviceInfoModel();
    });

    test('fetchDeviceInfo updates model values', () async {
      await model.fetchDeviceInfo();
      expect(model.batteryLevel, '100');
      expect(model.deviceName, 'Pixel 6');
      expect(model.osVersion, '15');
    });
  });
}