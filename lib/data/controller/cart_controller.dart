import 'package:first/methods/product_methods.dart';
import 'package:get/get.dart';
import '../../methods/cart_method.dart';
import '../Repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartMethod> _items = {};
  Map<int, CartMethod> get items => _items;
  List<CartMethod> storageList = [];
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
    return storageList;
  }

  set setCartData(List<CartMethod> items) {
    storageList = items;
    for (int i = 0; i < storageList.length; i++) {
      _items.putIfAbsent(storageList[i].id!, () => storageList[i]);
    }
  }

  void addToHistory() {
    _items = {};
    cartRepo.addCartHistory();
    update();
  }

  List<CartMethod> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  var cartPerOrderItem = <String, int>{};

  void perItemMap() {
    cartPerOrderItem = <String, int>{};
    for (int i = 0; i < getCartHistoryList().length; i++) {
      var key = getCartHistoryList()[i].time.toString();
      if (cartPerOrderItem.containsKey(key)) {
        cartPerOrderItem.update(key, (value) => ++value);
      } else {
        cartPerOrderItem.putIfAbsent(key, () => 1);
      }
    }
  }

  List<int> get perItemList {
    perItemMap();
    return cartPerOrderItem.entries.map((e) => e.value).toList();
  }

  List<String> get cartPerOrderTimeDate {
    return cartPerOrderItem.entries.map((e) => e.key).toList();
  }

  List<List<Map>> nestedCartMethods = [];
  void pictureListGenerator() {
    nestedCartMethods = [];
    for (var i = 0; i < cartPerOrderItem.length; i++) {
      List<Map> temp = [];
      for (var j = 0; j < getCartHistoryList().length; j++) {
        if (cartPerOrderItem.keys.elementAt(i) ==
            getCartHistoryList()[j].time) {
          // ignore: iterable_contains_unrelated_type
          if (!temp.contains(getCartHistoryList()[j].img)) {
            Map tempMap = {
              getCartHistoryList()[j].img: getCartHistoryList()[j]
            };
            temp.add(tempMap);
          }
        }
      }
      nestedCartMethods.add(temp);
    }
  }

  Map<int, CartMethod> reCartItem = <int, CartMethod>{};
  void constructReCartMap(String date) {
    reCartItem.clear();
    for (var i = 0; i < getCartHistoryList().length; i++) {
      if (getCartHistoryList()[i].time == date) {
        reCartItem.putIfAbsent(
            getCartHistoryList()[i].id!, () => getCartHistoryList()[i]);
      }
    }
  }

  void setItems() {
    _items = {};
    _items = reCartItem;
    update();
  }

  clearCartHistory() {
    cartRepo.removeCartHistoryList();
    update();
  }
}
