import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/weather_provider.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherProviderTrue =
    Provider.of<WeatherProvider>(context, listen: true);
    var weatherProviderFalse =
    Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.more_vert_outlined),
      ),
      body: FutureBuilder(
          future: weatherProviderFalse.fetchDataFromApi(),
          builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Column(
      children: [],
      );
    }
    else{ return const Center(
    child: CircularProgressIndicator(),);}
    }

    );
  }
}
