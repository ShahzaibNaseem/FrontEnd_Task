import 'package:get/get.dart';

class CalendarController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedView = 'Month'.obs;

  void changeView(String view) {
    selectedView.value = view;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}
