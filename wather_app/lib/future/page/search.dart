import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wather_app/future/controller/controller.dart';
import 'package:wather_app/future/page/weather_info.dart';

class Search extends StatelessWidget{
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/3, left: MediaQuery.of(context).size.width/8, right: MediaQuery.of(context).size.width/8),
          child: const Center(
              child: CitySearch()
          ),
        ),
      ),
    );
  }
}

class CitySearch extends StatelessWidget{
  const CitySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Enter your city',
          hintStyle: const TextStyle(
              fontSize: 14
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          suffixIcon: IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const WeatherInfo()
              ),
            );
          }, icon: const Icon(Icons.search))

      ),
      onChanged: (newData) => context.read<Controller>().changeCity(newData),
    );
  }
}