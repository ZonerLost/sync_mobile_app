import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final RxString userRole = 'owner'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserRole();
  }

  Future<void> loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    userRole.value = prefs.getString('userRole') ?? 'owner';
  }

  Future<void> saveUserRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRole', role);
    userRole.value = role;
  }
}
