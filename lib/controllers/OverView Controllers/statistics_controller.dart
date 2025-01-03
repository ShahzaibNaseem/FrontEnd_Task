import 'package:get/get.dart';

class StatisticsController extends GetxController {
  // Dropdown selection
  var selectedPeriod = 'This Week'.obs;

  // Statistics data
  var shares = 19042.obs;
  var likes = 34300.obs;
  var comments = 52274.obs;
  var growthPercentage = 4.85.obs;
  var growthPercentagelikes = 1.05.obs;
  var growthPercentagecomments = 1.15.obs;

  // Chart data
  var chartData = <Map<String, dynamic>>[
    {'day': 'Mon', 'values': [15.650, 10.550, 14.400]},
    {'day': 'Tue', 'values': [20.000, 25.000, 24.000]},
    {'day': 'wed', 'values': [15.650, 12.550, 14.400]},
    {'day': 'Thus', 'values': [20.000, 25.000, 24.000]},
    {'day': 'Fri', 'values': [15.650, 23.550, 18.400]},
    {'day': 'Sat', 'values': [20.000, 25.000, 24.000]},
    {'day': 'Sun', 'values': [20.000, 25.000, 24.000]},
  ].obs;

  // Update period selection
  void updatePeriod(String period) {
    selectedPeriod.value = period;
  }
}

