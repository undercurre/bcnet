import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice? connectedDevice;

  @override
  void initState() {
    super.initState();
    scanForDevices();
  }

  void scanForDevices() {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        setState(() {
          devicesList.add(r.device);
        });
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    setState(() {
      connectedDevice = device;
    });

    // 获取设备信息
    discoverServices(device);
  }

  void discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      print("Service: ${service.uuid}");
      service.characteristics.forEach((characteristic) {
        print("Characteristic: ${characteristic.uuid}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth Devices')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: devicesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(devicesList[index].name.isEmpty
                      ? 'Unnamed Device'
                      : devicesList[index].name),
                  onTap: () => connectToDevice(devicesList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
