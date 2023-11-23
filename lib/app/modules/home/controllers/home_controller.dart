import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

import '../../../../utils/constants.dart';
import '../../../data/models/weather_model.dart';
import '../../../data/models/api_call_status.dart';
import '../../../routes/app_pages.dart';
import '../../../services/api_service.dart';
import '../../../services/location_service.dart';

class HomeController extends GetxController {
  LocationData? locationData;

  static HomeController get instance => Get.find();

  WeatherModel? currentWeather;
  TextEditingController searchController = TextEditingController();

  var apiCallStatus = ApiCallStatus.success;

  @override
  void onInit() async {
    getUserLocation();
    super.onInit();
  }

  /// get the user location
  getUserLocation() async {
    locationData = await LocationService().getUserLocation();
    if (locationData != null) {
      await getCurrentWeather(
          '${locationData?.latitude},${locationData?.longitude}');
    }
  }

  getCurrentWeather(String location) async {
    await ApiService.getApi(
      Constants.currentWeatherApiUrl,
      queryParameters: {
        Constants.key: Constants.apiKey,
        Constants.q: location,
      },
      onSuccess: (response) async {
        currentWeather = WeatherModel.fromJson(response.data);
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: () {
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  search() {
    getCurrentWeather(searchController.text);
  }

  gotoDetails() {
    var location = searchController.text;
    if (location == "") {
      location = '${locationData?.latitude},${locationData?.longitude}';
    }
    Get.toNamed(Routes.WEATHER, arguments: [location]);
  }
}
