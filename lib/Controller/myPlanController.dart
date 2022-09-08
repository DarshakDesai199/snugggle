import 'package:get/get.dart';
import 'package:snugggle/Services/Api_service.dart';

import '../Model/myPlanModel.dart';

class MyPlanController extends GetxController {
  RxBool isLoading = true.obs;
  MyPlanResModel? myPlanList;

  @override
  void onInit() {
    fetchPlan();
    super.onInit();
  }

  void fetchPlan() async {
    isLoading(true);
    try {
      var plan = await ApiService.myPlanServices();
      if (plan != null) {
        myPlanList = plan;
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}
