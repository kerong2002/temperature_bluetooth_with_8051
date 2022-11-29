import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:lottie/lottie.dart';
import 'package:temperature_app/bluetooth_devices.dart';
import 'package:temperature_app/percent_indicator.dart';

enum BluetoothConnectionState {
  disconnected,                 //未連線
  connecting,                   //連線中
  connected,                    //連線
  error,                        //中斷
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BluetoothConnectionState _btStatus = BluetoothConnectionState.disconnected;
  BluetoothConnection? connection;
  String _messageBuffer = '';
  double? percentValue;
  bool _isWatering = false;
  bool fan_open = false;
  void _sendOnMessageToBluetooth() async {
    connection!.output.add(Uint8List.fromList(utf8.encode("DONE")));
    await connection!.output.allSent;
    print('done');
  }
  void _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    var message = '';
    if (~index != 0) {
      message = backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString.substring(0, index);
      _messageBuffer = dataString.substring(index);
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }

    // calculate percentage from message
    // analog 10 bit
    if (message.isEmpty) return; // to avoid fomrmat exception
    print(message);
    var take= double.parse(message) / 100;
    //print(take);
    double? analogMessage = double.tryParse(message.trim());
    setState(() {
      var percent = (message) * 100;
      percentValue = take; // inverse percent
    });
  }
  // Method to send message,
  // for turning the Bluetooth device on


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_bluetooth),
            onPressed: () async {
              BluetoothDevice? device = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BluetoothDevices()));

              if (device == null) return;

              print('Connecting to device...');
              setState(() {
                _btStatus = BluetoothConnectionState.connecting;
              });

              BluetoothConnection.toAddress(device.address).then((_connection) {
                print('Connected to the device');
                connection = _connection;
                setState(() {
                  _btStatus = BluetoothConnectionState.connected;
                });

                connection!.input!.listen(_onDataReceived).onDone(() {
                  setState(() {
                    _btStatus = BluetoothConnectionState.disconnected;
                  });
                });
              }).catchError((error) {
                print('Cannot connect, exception occured');
                print(error);

                setState(() {
                  _btStatus = BluetoothConnectionState.error;
                });
              });
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),       //架構與邊界
            Builder(
              builder: (context) {
                switch (_btStatus) {
                  case BluetoothConnectionState.disconnected:
                    return const PercentIndicator.disconnected();
                  case BluetoothConnectionState.connecting:
                    return PercentIndicator.connecting();
                  case BluetoothConnectionState.connected:
                    return PercentIndicator.connected(
                      percent: percentValue ?? 0,
                    );
                  case BluetoothConnectionState.error:
                    return const PercentIndicator.error();
                }
              },
            ),
            //===============<按鈕>==============

            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),  //字體大小
                //shadowColor: MaterialStateProperty.all(Colors.black),           //邊框
                overlayColor: MaterialStateProperty.all(Colors.lightBlue),     //按鈕觸發背景
                foregroundColor: MaterialStateProperty.all(Colors.black),       //按鈕顏色
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black)
                    )
                )
              ),
              onPressed: () async {
                _sendOnMessageToBluetooth();
                String text = 'water';
                if(fan_open==false){
                  fan_open = true;
                }
                else{
                  fan_open = false;
                }
                setState(() => _isWatering = true);

                if (text.isNotEmpty) {
                  try {
                    connection!.output
                        .add(Uint8List.fromList(utf8.encode("$text\r\n")));
                    await connection!.output.allSent;
                  } finally {
                    Future.delayed(const Duration(seconds: 4), () {
                      setState(() => _isWatering = false);
                    });
                  }
                }
              },
                child: fan_open ? Text('Turn off the fan!') : Text('Turn on the fan!'),
            ),
            const Spacer(),
            SizedBox(
              height: 300,            //Water plant按鈕位置
              child: Builder(
                builder: (context) {
                  if (_isWatering) {
                    if(fan_open) {
                      return Lottie.asset(
                          'assets/lottie/fans.json');
                    }
                    else{
                      return Lottie.asset(
                          'assets/lottie/turn-off.json');
                    }
                  }

                  if (percentValue == null) {
                    return const SizedBox.shrink();
                  }

                  if (percentValue! >= 0.3) {
                    return Lottie.asset('assets/lottie/very_hot.json');
                  }
                  else if (percentValue! >=0.2 && percentValue! <0.3) {
                    return Lottie.asset('assets/lottie/sunny.json');
                  }
                  else {
                    return Lottie.asset('assets/lottie/snow.json');
                  }

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
