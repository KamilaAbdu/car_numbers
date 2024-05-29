import 'package:flutter/material.dart';
import 'transports/transport.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Номер машины')),
        body: Center(
          child: CarNumberPlateWidget(
            plate: MyCarNumberPlate(countryCode: 'KGZ', idNumber: '1234KA', letters: 'CHUI', isSquare: true,
            ),
          )
            ),
          ),
        );
  }
}
