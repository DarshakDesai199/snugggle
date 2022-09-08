import 'package:get/get.dart';
import 'package:snugggle/Model/AllBrandModel.dart';
import 'package:snugggle/Model/brandModel.dart';
import 'package:snugggle/Services/Api_service.dart';

class BrandController extends GetxController {
  var isLoading = true.obs;
  BrandModel? brandList;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isLoading(true);
    try {
      var brand = await ApiService.brandApi();
      if (brand != null) {
        brandList = brand;
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}

class AllBrandController extends GetxController {
  RxBool isLoading = true.obs;
  AllBrandModel? allBrandList;

  @override
  void onInit() {
    fetchBrand();
    super.onInit();
  }

  void fetchBrand() async {
    isLoading(true);
    try {
      var brand = await ApiService.allProductApi();
      if (brand != null) {
        allBrandList = brand;
      }
    } finally {
      isLoading(false);
    }
  }
}
