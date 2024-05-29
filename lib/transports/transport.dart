import 'package:flutter/material.dart';

void transport() {
  Car car = Car(
      body: 'Седан',
      make: 'Toyota',
      model: 'Prius',
      engine: 'V8',
      transportWay: 'Дорога');

  car.setRegistrationCountry('North Korea');
  car.setRegistrationNumber('NK11111');
  print(
      'Машина: ${car.make}. Параметры: ${car.model}, ${car.engine}, ${car.transportWay}, ${car.getRegistrationCoutry()}, ${car.getRegistrationNumber()}');

  Bike bike =
      Bike(body: 'Kama', engine: 'Без двигателя', transportWay: 'Велодорожка');

  bike.setRegistrationCountry('Kyrgyzstan');
  bike.setRegistrationNumber('ABC12345');
  bike.start();
  bike.stop();
  print(
      'Велосипед: ${bike.body}. Параметры: ${bike.engine}, ${bike.transportWay}, ${bike.getRegistrationCoutry()}, ${bike.getRegistrationNumber()}');
}

class Transport {
  String make;
  String model;
  String body;
  String engine;
  String transportWay;

  Transport(
      {required this.body,
      required this.make,
      required this.model,
      required this.engine,
      required this.transportWay});
}

mixin RegistrationCountry {
  late final String? registrationCountry;

  String? getRegistrationCoutry() {
    return registrationCountry;
  }

  void setRegistrationCountry(String country) {
    registrationCountry = country;
  }
}

mixin RegistrationNumber {
  late final String? registrationNumber;

  String? getRegistrationNumber() {
    return registrationNumber;
  }

  void setRegistrationNumber(String number) {
    registrationNumber = number;
  }
}

class Car extends Transport with RegistrationCountry, RegistrationNumber {
  Car(
      {required super.body,
      required super.make,
      required super.engine,
      required super.transportWay,
      required super.model});
}

class Bus extends Transport with RegistrationCountry, RegistrationNumber {
  Bus(
      {required super.body,
      required super.make,
      required super.model,
      required super.engine,
      required super.transportWay});
}

class Boat extends Transport with RegistrationCountry, RegistrationNumber {
  Boat(
      {required super.body,
      required super.make,
      required super.model,
      required super.engine,
      required super.transportWay});
}

class Plane extends Transport with RegistrationCountry, RegistrationNumber {
  Plane(
      {required super.body,
      required super.make,
      required super.model,
      required super.engine,
      required super.transportWay});
}

abstract class AbstractTransport {
  String body;
  String engine;
  String transportWay;

  AbstractTransport({
    required this.body,
    required this.engine,
    required this.transportWay,
  });

  void start();
  void stop();
}

class Bike extends AbstractTransport
    with RegistrationCountry, RegistrationNumber {
  Bike(
      {required super.body,
      required super.engine,
      required super.transportWay});

  @override
  void start() {
    print('Велик поехал');
  }

  @override
  void stop() {
    print('Велик остановился');
  }
}

class Helicopter extends AbstractTransport
    with RegistrationCountry, RegistrationNumber {
  Helicopter(
      {required super.body,
      required super.engine,
      required super.transportWay});

  @override
  void start() {
    print('Вертолет полетел');
  }

  @override
  void stop() {
    print('Вертолет приземлился');
  }
}

abstract class CarNumberPlate {
  String countryCode;
  String idNumber;
  String letters;
  bool isSquare;

  CarNumberPlate(
    this.isSquare,
    this.countryCode,
    this.idNumber,
    this.letters,
  );
}

class MyCarNumberPlate implements CarNumberPlate {
  @override
  final String countryCode;

  @override
  final String idNumber;

  @override
  final String letters;

  @override
  final bool isSquare;

  MyCarNumberPlate({
    required this.countryCode,
    required this.idNumber,
    required this.letters,
    this.isSquare = false,
  });
  
  @override
  set countryCode(String countryCode) {}
  
  @override
  set idNumber(String idNumber) {}
  
  @override
  set isSquare(bool isSquare) {}
  
  @override
  set letters(String letters) {}
}

class CarNumberPlateWidget extends StatelessWidget {
  final CarNumberPlate plate;

  CarNumberPlateWidget({required this.plate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: plate.isSquare ? 200 : 300,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            plate.countryCode,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            plate.idNumber,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            plate.letters,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
