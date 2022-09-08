import 'package:get/get.dart';
import 'package:snugggle/Services/Api_service.dart';

import '../Model/banner Model.dart';

class BannerController extends GetxController {
  RxBool isLoading = true.obs;
  BannerModel? bannerList;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void fetchBanner() async {
    isLoading(true);
    try {
      var banner = await ApiService.bannerApi();
      if (banner != null) {
        bannerList = banner;
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}

class BannerButtonController extends GetxController {
  RxInt pageSelected = 0.obs;

  isPageChanged(index) {
    pageSelected.value = index;
  }

  isPageValue(value) {
    pageSelected.value = value;
  }
}
