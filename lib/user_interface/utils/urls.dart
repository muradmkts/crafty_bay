class Urls{

  static const String base = "https://ecommerce-api.codesilicon.com/api";
  static const String brandList = "$base/BrandList";
  static const String categoryList = "$base/CategoryList";
  static String login({required final String email}) => "$base/UserLogin/$email";
  static String verifyLogin({required final String email, required final String otp}) => "$base/VerifyLogin/$email/$otp";
  static const String createProfile = "$base/CreateProfile";
  static const String readProfile = "$base/ReadProfile";
  static String listByCategory({required final String categoryId}) => "$base/ListProductByCategory/$categoryId";
  static String listByBrand({required final String brandId}) => "$base/ListProductByBrand/$brandId";
  static String listByRemark({required final String remark}) => "$base/ListProductByRemark/$remark";
  static String details({required final String productId}) => "$base/ProductDetailsById/$productId";
  static String reviews({required final String productId}) => "$base/ListReviewByProduct/$productId";
  static const String createReview = "$base/CreateProductReview";
  static const String sliders = "$base/ListProductSlider";
  static const String wishList = "$base/ProductWishList";
  static const String addCart = "$base/CreateCartList";
  static String addWish({required final String productId}) => "$base/CreateWishList/$productId";
  static const String cartList = "$base/CartList";
  static String deleteCart({required final String productId}) => "$base/DeleteCartList/$productId";


}