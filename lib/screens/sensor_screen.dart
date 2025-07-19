import 'package:device_sensor_app/models/device_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeviceInfoModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sensor Control')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: model.isFlashlightOn ? Colors.yellow : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: model.toggleFlashlight,
              child: Text(model.isFlashlightOn ? 'Turn Off Flashlight' : 'Turn On Flashlight'),
            ),
          ],
        ),
      ),
    );
  }
}
