class ApiConstants {
  static const String baseUrl = "https://holo.runasp.net/Api/V1/";

  static const String getAllCategories = "Category/GetAll";
  static const String login = "Authentication/SignIn";
  static const String signUp = "User/Create";
  static const String getAllProducts = "Product/Paginated";

  static const String getAllDiscounts = "Discount/GetAll";

  static const String getProductsByDiscount =
      "Product/ProductsByDiscount?DiscountPercentage={discountPercentage}";

  static const String getProductsByCategory =
      "Product/ProductsByCategory?CategoryId={categoryId}";

  static const String getProductColors = "ProductColor/ProductId?id={id}";
  static const String forgetPassword = "Authentication/SendResetPasswordCode";
  static const String confirmVerification =
      "Authentication/ConfirmResetPasswordCode";
  static const String resetPassword = "Authentication/ResetPassword";
  static const String getUserById = "User/{id}";
  static const String updateProfle = "User/Edit";

  static const String getFavouriteItems = "Favourit/user/{id}";
  static const String createShippingAddress = "ShippingAddress/Create";
  static const String getShippingAddress = "ShippingAddress/GetById/{id}";

  

}
