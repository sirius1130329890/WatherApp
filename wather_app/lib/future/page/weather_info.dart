import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/future/controller/controller.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              Expanded(child: UpperSide()),
              Expanded(child: LowerSide())
            ],
          ),
        ),
      ),
    );
  }
}

class UpperSide extends StatelessWidget {
  const UpperSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: boxDecoration(50),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              context.watch<Controller>().getCity,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          )),
          const Expanded(
            flex: 3,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    child: param(
                        CupertinoIcons.thermometer, '${context.watch<Controller>().getTemperature[0]}°C', 'temperature')),
                Expanded(
                    child: param(CupertinoIcons.drop_fill, '56', 'humidity')),
                Expanded(
                    child: param(
                        CupertinoIcons.speedometer, '1017hPa', 'pressure')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LowerSide extends StatelessWidget {
  const LowerSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: Chart()),
        Expanded(
            child: Row(
          children: [
            dayBox(Icons.sunny, '${context.watch<Controller>().getTemperature[0]}°C', 'Mon'),
            dayBox(CupertinoIcons.cloud_drizzle_fill, '${context.watch<Controller>().getTemperature[1]}°C', 'Tue'),
            dayBox(CupertinoIcons.cloud_bolt_rain_fill, '${context.watch<Controller>().getTemperature[2]}°C', 'Wed'),
            dayBox(CupertinoIcons.cloud_sun_rain_fill, '${context.watch<Controller>().getTemperature[3]}°C', 'Thu'),
            dayBox(CupertinoIcons.cloud_fill, '${context.watch<Controller>().getTemperature[4]}°C', 'Fri')
          ],
        )),
      ],
    );
  }
}


class Chart extends StatelessWidget{
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, bottom: 20),
          child: Sparkline(data: context.watch<Controller>().getTemperature, enableGridLines: true, gridLinelabelPrefix: '°C',),
        )),
        Row(
          children: [
            text('Mon'),
            text('Tue'),
            text('Wed'),
            text('Thu'),
            text('Fri'),
          ],
        )
      ],
    );
  }

}
Expanded text(String value){
  return Expanded(child: Text(value, textAlign: TextAlign.center,));
}

Expanded dayBox(IconData icon, String value, String day) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      decoration: boxDecoration(15),
      child: param(icon, value, day),
    ),
  ));
}

BoxDecoration boxDecoration(double radius) {
  return BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlue, Colors.purpleAccent]),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Padding param(IconData icon, String value, String name) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                value,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
        Expanded(
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),
      ],
    ),
  );
}
