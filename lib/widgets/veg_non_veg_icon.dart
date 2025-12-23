import 'package:flutter/material.dart';

class VegNonVegIcon extends StatelessWidget {
  final bool isVeg;
  final double size;

  const VegNonVegIcon({super.key, required this.isVeg, this.size = 16});

  @override
  Widget build(BuildContext context) {
    Color color = isVeg ? const Color(0xFF0F8A3D) : const Color(0xFFD32F2F);
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
