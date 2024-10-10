import 'package:ai_tennis/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_bloc.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_event.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_state.dart';
import 'package:ai_tennis/features/forcast/data/models/forecast_day_model.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const WeatherScreen({required this.latitude, required this.longitude, Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Trigger the events to fetch weather and forecast on screen initialization
    BlocProvider.of<WeatherBloc>(context)
      ..add(GetWeatherEvent(latitude: widget.latitude, longitude: widget.longitude))
      ..add(GetForecastEvent(latitude: widget.latitude, longitude: widget.longitude));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);  // Initialize SizeConfig
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather & Forecast'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Current Weather'),
            Tab(text: 'Forecast'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCurrentWeatherTab(),
          _buildForecastTab(),
        ],
      ),
    );
  }

  Widget _buildCurrentWeatherTab() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherError) {
          return Center(child: Text(state.message));
        } else if (state is WeatherLoaded) {
          return _buildWeatherContent(state.weather);
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }

  Widget _buildWeatherContent(WeatherModel weather) {
    String locationName = weather.location.name;
    String locationCountry = weather.location.country;
    double tempC = weather.current.tempC;
    String conditionText = weather.current.condition.text;
    String conditionIcon = weather.current.condition.icon;

    return Padding(
      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2), // Responsive padding
      child: Column(
        children: [
          _buildWeatherContainer(
            title: "$locationName, $locationCountry",
            iconPath: conditionIcon,
            content: Column(
              children: [
                Text('Temperature: $tempC°C', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4)),
                Text('Condition: $conditionText', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastTab() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherError) {
          return Center(child: Text(state.message));
        } else if (state is ForecastLoaded) {
           return _buildForecastContent();
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }

  Widget _buildForecastContent(List<ForecastDayModel> forecast) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2), // Responsive padding
      child: ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          var day = forecast[index];
          return _buildWeatherContainer(
            title: "Forecast for ${day.date}",
            iconPath: day.day.condition.icon,
            content: Column(
              children: [
                Text('Max Temp: ${day.day.maxtempC}°C', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4)),
                Text('Min Temp: ${day.day.mintempC}°C', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4)),
                Text('Condition: ${day.day.condition.text}', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.5)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeatherContainer({required String title, required String iconPath, required Widget content}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1), // Responsive margin
      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 5, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                "https:$iconPath",
                width: SizeConfig.blockSizeHorizontal * 12,
                height: SizeConfig.blockSizeHorizontal * 12,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 1), // Responsive spacing
          content,
        ],
      ),
    );
  }
}
