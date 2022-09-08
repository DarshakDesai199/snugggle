import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:snugggle/Model/AllBrandModel.dart';
import 'package:snugggle/Model/cartModel.dart';
import 'package:snugggle/Model/categeory%20Model.dart';
import 'package:snugggle/Model/foryouModel.dart';
import 'package:snugggle/Services/Api%20Url.dart';

import '../Model/allCategoriesModel.dart';
import '../Model/banner Model.dart';
import '../Model/brandModel.dart';
import '../Model/favoriteDataModel.dart';
import '../Model/myPlanModel.dart';
import '../Model/plan model.dart';

class ApiService {
  /// send OTP
  static Future<int?> sendOtp({Map<String, dynamic>? reqBody}) async {
    http.Response response =
        await http.post(Uri.parse(Api_Url.otpSend), body: reqBody);

    if (response.statusCode == 200) {
      log(response.body);
      var result = jsonDecode(response.body);

      return result['status'];
    }
    return null;
  }

  /// OTP verify
  static Future<int?> otpVerify({Map<String, dynamic>? reqBody}) async {
    http.Response response =
        await http.post(Uri.parse(Api_Url.otpVerify), body: reqBody);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      log(response.body);
      return result['status'];
    }
    return null;
  }

  /// Plan Api
  static Future<PlanData?> planApi() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.planUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return planDataFromJson(response.body);
    }
    return null;
  }

  /// Banner Services
  static Future<BannerModel?> bannerApi() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.bannerUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return bannerModelFromJson(response.body);
    }
    return null;
  }

  /// Brand Service
  static Future<BrandModel?> brandApi() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.brandUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return brandModelFromJson(response.body);
    }
    return null;
  }

  /// AllProduct Service
  static Future<AllBrandModel?> allProductApi() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMjA1YjRmMWM2ZjUzN2IyNWZmNzkyZCIsImlhdCI6MTY0NjI5MDI2N30.EjOtIyiS_6Iu-KrNW299YjpPdn4Q-43CEmp0wxmbIOU"
    };

    http.Response response =
        await http.get(Uri.parse(Api_Url.allBrandUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return allBrandModelFromJson(response.body);
    }
    return null;
  }

  /// category Service
  static Future<CategoryModel?> categoryApi() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.categeoryUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return categoryModelFromJson(response.body);
    }
  }

  ///ForYou Services
  static Future<ForYouModel?> forYouServices() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.forYouUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return forYouModelFromJson(response.body);
    }
    return null;
  }

  /// Cart Service
  static Future<CartModel?> cartService() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response =
        await http.get(Uri.parse(Api_Url.cartUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return cartModelFromJson(response.body);
    }
    return null;
  }

  /// Add Wardrobe
  static Future<int?> wardrobeAddService(
      {Map<String, dynamic>? reqBody}) async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response = await http.post(Uri.parse(Api_Url.wardrobeAddUrl),
        body: reqBody, headers: header);
    if (response.statusCode == 200) {
      log(response.body);
      var result = jsonDecode(response.body);
      return result['status'];
    }
    return null;
  }

  /// Remove Wardrobe
  static Future<int?> wardrobeRemoveService(
      {Map<String, dynamic>? reqBody}) async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };
    http.Response response = await http.post(
        Uri.parse(Api_Url.wardrobeRemoveUrl),
        body: reqBody,
        headers: header);
    if (response.statusCode == 200) {
      log(response.body);
      var result = jsonDecode(response.body);
      return result['status'];
    }
    return null;
  }

  /// Favorite Service
  static Future<FavoriteModel?> favoriteDataService() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };

    http.Response response =
        await http.get(Uri.parse(Api_Url.favoriteDataUrl), headers: header);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return favoriteModelFromJson(response.body);
    }
    return null;
  }

  /// Favorite Add Service
  static Future<int?> favoriteAddService(Map<String, dynamic>? reqBody) async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };

    http.Response response = await http.post(Uri.parse(Api_Url.favoriteAddUrl),
        body: reqBody, headers: header);
    if (response.statusCode == 200) {
      log(response.body);
      var result = jsonDecode(response.body);
      return result['status'];
    }
    return null;
  }

  /// Favorite Remove Services
  static Future<int?> favoriteRemoveService(
      Map<String, dynamic>? reqBody) async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };

    http.Response response = await http.post(
        Uri.parse(Api_Url.favoriteRemoveUrl),
        body: reqBody,
        headers: header);
    if (response.statusCode == 200) {
      log(response.body);
      var result = jsonDecode(response.body);
      return result['status'];
    }
    return null;
  }

  /// All Categories Service
  static Future<AllCategoriesModel?> allCategoriesServices() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };

    http.Response response =
        await http.get(Uri.parse(Api_Url.allCategoriesUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return allCategoriesModelFromJson(response.body);
    }
    return null;
  }

  /// MyPlan Service
  static Future<MyPlanResModel?> myPlanServices() async {
    Map<String, String> header = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTc3ZDgzOTU3ODYyN2FhZDNlOWM5YyIsImlhdCI6MTY0NTcwNzE4MX0.wBhiGfT1-A3tsOGyQLCZSAHqCCUHbMNE1VtyClHxH7U"
    };

    http.Response response =
        await http.get(Uri.parse(Api_Url.myPlanUrl), headers: header);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      return myPlanResModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
