class ApiConstants {
  static const String baseUrl =
      "https://holo.runasp.net/Api/V1/"; 

  static const String getAllCategories = "Category/GetAll";
  static const String login = "Authentication/SignIn";
  static const String signUp = "User/Create";
  static const String getAllProducts = "Product/Paginated";

  static const String getAllDiscounts = "Discount/GetAll";

  static const String getProductsByDiscount =
      "Product/ProductsByDiscount?DiscountPercentage={discountPercentage}";
  static const String forgetPassword = "Authentication/SendResetPasswordCode";
  static const String resetPassword = "Authentication/ResetPassword";

}
