import 'package:get/get.dart';
import 'package:snugggle/Model/categeory%20Model.dart';
import 'package:snugggle/Services/Api_service.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;
  CategoryModel? categoryList;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  void fetchCategory() async {
    isLoading(true);
    try {
      var category = await ApiService.categoryApi();
      if (category != null) {
        categoryList = category;
      }
    } finally {
      isLoading(false);
    }
  }
}
