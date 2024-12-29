import 'package:get/get.dart';

class CalendarController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedView = 'Month'.obs;

  void changeView(String view) {
    selectedView.value = view;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void changeMonth(int increment) {
    selectedDate.value = DateTime(
      selectedDate.value.year,
      selectedDate.value.month + increment,
      selectedDate.value.day,
    );
  }

  bool isSelectedDate(DateTime date) {
    return selectedDate.value.year == date.year &&
        selectedDate.value.month == date.month &&
        selectedDate.value.day == date.day;
  }
}
