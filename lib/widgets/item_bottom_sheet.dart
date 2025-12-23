import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/restaurant_controller.dart';
import '../models/product.dart';

class ItemBottomSheet extends StatelessWidget {
  final Product product;
  const ItemBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantController>();
    controller.resetSelection();
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quantity Section
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Obx(
                          //widgets to listen for changes in quantity or selected beverages.
                          () => Column(
                            children: [
                              _buildCustomRadioOption(
                                "Full portion",
                                "1500 MRU",
                                "Full",
                                controller.selectedPortion.value == "Full",
                                () => controller.selectedPortion.value = "Full",
                              ),
                              _buildCustomRadioOption(
                                "Half portion",
                                "750 MRU",
                                "Half",
                                controller.selectedPortion.value == "Half",
                                () => controller.selectedPortion.value = "Half",
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Beverages Section
                      const Text(
                        "Beverages",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Obx(
                          () => Column(
                            children: [
                              for (
                                int i = 0;
                                i < controller.beverageOptions.length;
                                i++
                              ) ...[
                                _buildCustomCheckboxOption(
                                  controller.beverageOptions[i],
                                  controller,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 100), // Space for bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Positioned Bottom Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.40),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _buildQtyBtn(Icons.remove, () {
                          if (controller.itemQuantity.value > 1) {
                            controller.itemQuantity.value--;
                          }
                        }),
                        Obx(
                          () => Text(
                            "${controller.itemQuantity.value}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF5722),
                            ),
                          ),
                        ),
                        _buildQtyBtn(
                          Icons.add,
                          () => controller.itemQuantity.value++,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Add Item Button
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () =>
                            Get.back(), //close the bottom sheet once the user clicks "Add Item".
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5722),
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Add Item | ${controller.currentTotal} MRU",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Close button
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.black, size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: const Color(0xFFFF5722), size: 18),
    );
  }

  Widget _buildCustomRadioOption(
    String title,
    String price,
    String value,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                _buildRadioCircle(isSelected),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCheckboxOption(
    Map<String, Object> option,
    RestaurantController controller,
  ) {
    String name = option["name"] as String;
    int price = option["price"] as int;
    bool isSelected = controller.selectedBeverages.contains(name);

    return InkWell(
      onTap: () {
        if (isSelected) {
          controller.selectedBeverages.remove(name);
        } else {
          controller.selectedBeverages.add(name);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                Text(
                  "$price MRU",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                _buildRadioCircle(isSelected),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioCircle(bool isSelected) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF5722) : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFFFF5722) : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
    );
  }
}
