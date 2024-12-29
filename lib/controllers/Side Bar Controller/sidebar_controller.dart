import 'package:get/get.dart';

class SidebarController extends GetxController {
  var isSidebarOpen = true.obs; // Sidebar toggle state
  var selectedMenu = 'Calendar'.obs; // Default selected menu

  void toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value;
  }

  void selectMenu(String menu) {
    selectedMenu.value = menu;
  }
}
