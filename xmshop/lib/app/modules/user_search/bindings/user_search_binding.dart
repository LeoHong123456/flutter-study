import 'package:get/get.dart';

import '../controllers/user_search_controller.dart';

class UserSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSearchController>(
      () => UserSearchController(),
    );
  }
}
