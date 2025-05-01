class ApiConstants {
  static const String baseUrl =
      "https://holo.runasp.net/Api/V1/"; // تأكد من استخدام HTTPS

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
}
