import 'package:get/get.dart';
import 'package:snugggle/Model/foryouModel.dart';

import '../Services/Api_service.dart';

class ForYouController extends GetxController {
  RxBool isLoading = true.obs;
  ForYouModel? bannerList;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isLoading(true);
    try {
      var data = await ApiService.forYouServices();
      if (data != null) {
        bannerList = data;
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}
