import 'package:get/get.dart';

class FollowersCardController extends GetxController {
  var followers = 12345.obs;
  var growthPercentage = 12.5.obs;
  var followersGained = 250.obs;
  var followersLost = 50.obs;

  var weeklyData = [
    {'day': 'M', 'value': 40},
    {'day': 'T', 'value': 60},
    {'day': 'W', 'value': 80},
    {'day': 'T', 'value': 100},
    {'day': 'F', 'value': 60},
    {'day': 'S', 'value': 30},
    {'day': 'S', 'value': 80},
  ].obs;
}
