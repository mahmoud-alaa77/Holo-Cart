import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = "https://holo.runasp.net/Api/V1/";

  static const String getAllCategories = "Category/GetAll";
  static const String login = "Authentication/SignIn";
  static const String signUp = "User/Create";
  static const String getAllProducts =
      "Product/Paginated?ApplicationUserId={id}";

  static const String getProductById =
      "/Product/GetById?ProductId={productId}&UserId={userId}";

  static const String getAllDiscounts =
      "Discount/GetAll?ApplicationUserId={id}";

  static const String getProductsByDiscount =
      "Product/ProductsByDiscount?DiscountPercentage={discountPercentage}&?ApplicationUserId={id}";

  static const String getProductsByCategory =
      "Product/ProductsByCategory?CategoryId={categoryId}&ApplicationUserId={id}";

  static const String getProductColors = "ProductColor/ProductId?id={id}";
  static const String forgetPassword = "Authentication/SendResetPasswordCode";
  static const String confirmVerification =
      "Authentication/ConfirmResetPasswordCode";
  static const String resetPassword = "Authentication/ResetPassword";
  static const String getUserById = "User/{id}";
  static const String updateProfle = "User/Edit";

  // Favourit
  static const String getFavouriteItems = "Favourit/user/{id}";
  static const String addFavouriteItem = "Favourit/Create";
  static const String deleteFavouriteItem = "Favourit/Delete";
  static const String createShippingAddress = "ShippingAddress/Create";
  static const String getShippingAddresses = "ShippingAddress/User/{id}";
  static const String updateShippingAddress = "ShippingAddress/Update";
  static const String deleteShippingAddress = "ShippingAddress/Delete/{id}";

  // Stripe & Paypal keys from env
  static String get secretKey => dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static String get publicKey => dotenv.env['STRIPE_PUBLIC_KEY'] ?? '';
  static String get paypalClientId => dotenv.env['PAYPAL_CLIENT_ID'] ?? '';
  static String get paypalSecretKey => dotenv.env['PAYPAL_SECRET_KEY'] ?? '';

  // search
  static const String search =
      "Product/Paginated?ApplicationUserId={userId}&SearchBy={searchTerm}";

  // review
  static const String addReview = "Review/Create";
}
