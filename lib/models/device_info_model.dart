import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DeviceInfoModel with ChangeNotifier {
  String _batteryLevel = '0';
  String _deviceName = 'OS';
  String _osVersion = '0.0';
  bool _isFlashlightOn = false;
  bool _isLoading = false;

  String get batteryLevel => _batteryLevel;
  String get deviceName => _deviceName;
  String get osVersion => _osVersion;
  bool get isFlashlightOn => _isFlashlightOn;
  bool get isLoading => _isLoading;

  final _channel = const MethodChannel('com.kashif.sensor.device_sensor_app');

  Future<void> fetchDeviceInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      final battery = await _channel.invokeMethod('getBatteryLevel');
      final device = await _channel.invokeMethod('getDeviceName');
      final os = await _channel.invokeMethod('getOsVersion');
       print("Battery Level"+battery.toString());
      print("device Level"+device.toString());
      print("os Level"+os.toString());
      _batteryLevel = battery.toString();
      _deviceName = device.toString();
      _osVersion = os.toString();
    } catch (e) {
      _batteryLevel = 'Error: $e';
      _deviceName = 'Error: $e';
      _osVersion = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFlashlight() async {
    try {
      final result = await _channel.invokeMethod('toggleFlashlight');
      _isFlashlightOn = result as bool;
      notifyListeners();
    } catch (e) {
      print('Error toggling flashlight: $e');
    }
  }
}