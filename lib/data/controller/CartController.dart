import 'package:first/methods/Product_methods.dart';
import 'package:get/get.dart';
import '../../methods/CartMethod.dart';
import '../Repository/CartRepo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartMethod> _items = {};
  Map<int, CartMethod> get items => _items;
  List<CartMethod> StorageList = [];
  void getItem(ProductMethod product, int quantity) {
    var totalQuantityInside = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantityInside = value.quantity! + quantity;
        return CartMethod(
            id: value.id!,
            name: value.name,
            time: DateTime.now().toString(),
            isExist: false,
            img: value.img,
            price: value.price,
            quantity: quantity + value.quantity!,
            product: value.product);
      });
      update();
    }
    if (totalQuantityInside <= 0) {
      _items.remove(product.id);
    }
    update();
    if (quantity > 0) {
      _items.putIfAbsent(product.id!, () {
        return CartMethod(
            id: product.id!,
            name: product.name,
            time: DateTime.now().toString(),
            isExist: false,
            img: product.img,
            price: product.price,
            quantity: quantity,
            product: product);
      });
      cartRepo.addToCartList(getItems);
      update();
    }

    // else if (quantity < 0) {
    //   Get.snackbar("Item Count", "Please add some items",
    //       colorText: Colors.white, backgroundColor: AppColors.maincolor);
    // }
    update();
  }

  bool isExisted(ProductMethod product) {
    if (_items.containsKey(product.id!)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductMethod product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItem {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartMethod> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalPrice {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartMethod> getCartData() {
    setCartData = cartRepo.getCartList();
    return StorageList;
  }

  set setCartData(List<CartMethod> items) {
    StorageList = items;
    for (int i = 0; i < StorageList.length; i++) {
      _items.putIfAbsent(StorageList[i].id!, () => StorageList[i]);
    }
  }

  void addToHistory() {
    _items = {};
    cartRepo.addCartHistory();
    print(cartRepo.getCartHistoryList().toString());
    update();
  }

  List<CartMethod> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  var CartPerOrderItem = Map<String, int>();

  void perItemMap() {
    CartPerOrderItem = Map<String, int>();
    for (var element in getCartHistoryList()) {
      print(element.time);
    }
    for (int i = 0; i < getCartHistoryList().length; i++) {
      var key = getCartHistoryList()[i].time.toString();
      if (CartPerOrderItem.containsKey(key)) {
        CartPerOrderItem.update(key, (value) => ++value);
      } else {
        CartPerOrderItem.putIfAbsent(key, () => 1);
      }
    }
    print(CartPerOrderItem.toString());
  }

  List<int> get PerItemList {
    perItemMap();
    return CartPerOrderItem.entries.map((e) => e.value).toList();
  }
}
