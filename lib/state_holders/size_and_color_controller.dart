import "package:get/get.dart";

class SizeAndColorController extends GetxController {
  final List<String> _productColors = ["Red", "Green", "White"];

  List<String> get productColors => _productColors;

  final List<String> _productSizes = ["X","2X","3X"];

  List<String> get productSizes => _productSizes;

  int _colorIndex = 0;
  int _sizeIndex = 0;

  int get colorIndex => _colorIndex;

  int get sizeIndex => _sizeIndex;

  void selectColor({required int index}) {
    _colorIndex = index;
    update();
  }

  void selectSize({required int index}) {
    _sizeIndex = index;
    update();
  }
}
