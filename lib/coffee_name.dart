import 'package:flutter/material.dart';

class CoffeeName extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Coffeename;
  final bool isSelected;
  final VoidCallback onTap;
  CoffeeName({
    required this.Coffeename,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Coffeename,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.yellowAccent : Colors.white,
                ),
                ),
          ],
        ),
      ),
    );
  }
}
