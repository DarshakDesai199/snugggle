import 'package:get/get.dart';
import 'package:snugggle/Model/cartModel.dart';
import 'package:snugggle/Services/Api_service.dart';

class CartController extends GetxController {
  RxBool isLoading = true.obs;
  CartModel? cartList;

  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }

  void fetchCart() async {
    isLoading(true);
    try {
      var cart = await ApiService.cartService();
      if (cart != null) {
        cartList = cart;
      }
    } finally {
      isLoading(false);
    }
  }
}
