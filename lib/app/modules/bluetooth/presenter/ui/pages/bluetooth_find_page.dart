import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:forestinv_mobile/app/modules/bluetooth/presenter/ui/components/scan_result_tile.dart';
import 'package:forestinv_mobile/app/modules/bluetooth/presenter/ui/pages/bluetooth_off_page.dart';
import 'package:forestinv_mobile/app/modules/bluetooth/presenter/ui/pages/device_page.dart';

class BluetoothFindPage extends StatefulWidget {
  @override
  BluetoothFindPageState createState() => BluetoothFindPageState();
}

class BluetoothFindPageState extends State<BluetoothFindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispositivos'),
      ),
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return _buildFindDevices(context);
            }
            return BluetoothOffPage(state: state);
          }),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: const Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: const Icon(Icons.search),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: const Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}

Widget _buildFindDevices(final BuildContext context) {
  return RefreshIndicator(
    onRefresh: () =>
        FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4)),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StreamBuilder<List<BluetoothDevice>>(
            stream: Stream.periodic(const Duration(seconds: 2))
                .asyncMap((_) => FlutterBlue.instance.connectedDevices),
            initialData: const [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!
                  .map((d) => ListTile(
                        title: Text(d.name),
                        subtitle: Text(d.id.toString()),
                        trailing: StreamBuilder<BluetoothDeviceState>(
                          stream: d.state,
                          initialData: BluetoothDeviceState.disconnected,
                          builder: (c, snapshot) {
                            if (snapshot.data ==
                                BluetoothDeviceState.connected) {
                              return ElevatedButton(
                                child: const Text('OPEN'),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DevicePage(device: d))),
                              );
                            }
                            return Text(snapshot.data.toString());
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            initialData: const [],
            builder: (c, snapshot) => Column(
                children: snapshot.data!
                    .map(
                      (r) => ScanResultTile(
                        result: r,
                        onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          r.device.connect();
                          return DevicePage(device: r.device);
                        })),
                      ),
                    )
                    .toList()),
          ),
        ],
      ),
    ),
  );
}
