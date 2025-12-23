import 'package:get/get.dart';
import '../models/product.dart';

class RestaurantController extends GetxController {
  //This ensures that when a value changes in the controller
  final products = <Product>[
    Product(
      id: "1",
      name: "Chicken Pasta",
      image:
          "https://lemonsandzest.com/wp-content/uploads/2024/11/Crock-Pot-Creamy-Chicken-Pasta-25.jpg",
      rating: 4.6,
      reviews: "10k+",
      price: 750,
      originalPrice: 1500,
      isVeg: false,
      isDiscounted: true,
    ),
    Product(
      id: "2",
      name: "Chicken Tagine",
      image:
          "https://middlebury.coop/wp-content/uploads/2023/01/Chicken-Tagine.-SS.-Low-Res-476x476.jpg",
      rating: 4.6,
      reviews: "10k+",
      price: 1500,
      isVeg: false,
      isDiscounted:
          false, // Image doesn't show discount badge for this one? Wait, screenshot 1 shows badge for all 4 items?
      // Checking Image 1: Chicken Pasta (Yes), Chicken Tagine (No), Zrig Milk (Yes), Thiebou (No).
    ),
    Product(
      id: "3",
      name: "Zrig Milk Dessert",
      image: "https://www.cheftariq.com/wp-content/uploads/2019/03/MP2.jpg",
      rating: 4.6,
      reviews: "10k+",
      price: 750,
      originalPrice: 1500,
      isVeg: true,
      isDiscounted: true,
    ),
    Product(
      id: "4",
      name: "Thieboudienne",
      image:
          "https://www.remitly.com/blog/wp-content/uploads/2023/09/senegal-thieboudienne-scaled.jpg",
      rating: 4.6,
      reviews: "10k+",
      price: 1500,
      isVeg: false,
      isDiscounted: false,
    ),
  ].obs;

  final categories = <Category>[
    Category(
      name: "All",
      image:
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=200&q=60",
    ),
    Category(
      name: "Meals",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjzn3pq5EclsEIKd1ITHIlmDolEpr4-X_7iQ&s",
    ),
    Category(
      name: "Breakfast",
      image:
          "https://assets.epicurious.com/photos/5c4b7ab537d8ef4605419f1d/1:1/w_2560%2Cc_limit/St.-Patrick's-Day-Breakfast-Hash-012319.jpg",
    ),
    Category(
      name: "Drinks",
      image:
          "https://images.unsplash.com/photo-1544145945-f90425340c7e?auto=format&fit=crop&w=200&q=60",
    ),
    Category(
      name: "Desserts",
      image:
          "https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=200&q=60",
    ),
    Category(
      name: "Cafes",
      image:
          "https://images.unsplash.com/photo-1554118811-1e0d58224f24?auto=format&fit=crop&w=200&q=60",
    ),
    Category(
      name: "Salads",
      image:
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=200&q=60",
    ),
    Category(
      name: "Seafoods",
      image:
          "https://img.freepik.com/free-photo/seafood-plate-with-shrimps-mussels-lobsters-served-with-lemon_140725-8798.jpg?semt=ais_hybrid&w=740&q=80",
    ),
  ].obs;

  // Rx Variables for the Item Detail Sheet
  var selectedPortion = "Full".obs; // Full or Half
  var selectedBeverages = <String>[].obs;
  var itemQuantity = 1.obs;

  final beverageOptions = [
    {"name": "Coca-Cola (330 ml)", "price": 75},
    {"name": "Pepsi (330)", "price": 75},
    {"name": "Sprite (330)", "price": 75},
    {"name": "Fanta (330)", "price": 75},
  ];

  void resetSelection() {
    selectedPortion.value = "Full";
    selectedBeverages.clear();
    itemQuantity.value = 1;
  }

  int get currentTotal {
    int basePrice = selectedPortion.value == "Full" ? 1500 : 750;
    int beverageTotal =
        selectedBeverages.length *
        75; // Assuming all are 75 for simplicity as per screenshot
    return (basePrice + beverageTotal) * itemQuantity.value;
  }
}
