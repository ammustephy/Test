import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/restaurant_header.dart';
import '../widgets/item_bottom_sheet.dart';
import '../widgets/veg_non_veg_icon.dart';
import '../controllers/restaurant_controller.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<RestaurantController>(); //to access the list of products

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: RestaurantHeader(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFEEEEEE)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Find something from this restaurant",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.grey.shade400,
                              size: 28,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Filter Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildFilterChip("Filter", icon: Icons.tune_rounded),
                          const SizedBox(width: 10),
                          _buildFilterChip(
                            "Non Veg",
                            dotColor: const Color(0xFFD32F2F),
                          ),
                          const SizedBox(width: 10),
                          _buildFilterChip(
                            "Veg",
                            dotColor: const Color(0xFF0F8A3D),
                          ),
                          const SizedBox(width: 10),
                          _buildFilterChip("Offers"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    // Section Title
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "All Items from This Restaurant",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Products Grid
                    Obx(
                      () => GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.72,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 15,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image Section
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.network(
                                              product.image,
                                              height: 105,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          if (product.isDiscounted)
                                            Positioned(
                                              top: 4,
                                              left: 4,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.95),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.08),
                                                      blurRadius: 8,
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      // padding:
                                                      //     const EdgeInsets.all(
                                                      //       1,
                                                      //     ),
                                                      child: Image.asset(
                                                        "Assets/icons/offer.png",
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    const Text(
                                                      "Upto 50% OFF",
                                                      style: TextStyle(
                                                        fontSize: 9.5,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(
                                                          228,
                                                          20,
                                                          77,
                                                          16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      // Name & Icon Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              product.name,
                                              style: const TextStyle(
                                                fontSize: 16.5,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                                height: 1.1,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          VegNonVegIcon(isVeg: product.isVeg),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      // Rating Row
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xFFFF9100),
                                            size: 14,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${product.rating}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "(10k + reviews)",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey.shade400,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      // Price Row
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${product.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} MRU",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          if (product.originalPrice != null)
                                            Text(
                                              "${product.originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} MRU",
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey.shade400,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                // Optimized "Add" Button
                                Positioned(
                                  bottom: 0,
                                  right: 15,
                                  left: 70,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                        //open the item customization modal when a product icon is clicked.
                                        ItemBottomSheet(product: product),
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.06,
                                            ),
                                            blurRadius: 40,
                                            spreadRadius: 5,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 4.0,
                                        ),
                                      ),
                                      child: Container(
                                        alignment: const Alignment(0, -0.3),
                                        child: const Text(
                                          "Add",
                                          style: TextStyle(
                                            color: Color(0xFFFF5722),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {IconData? icon, Color? dotColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: Colors.black87),
            const SizedBox(width: 8),
          ],
          if (dotColor != null) ...[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
