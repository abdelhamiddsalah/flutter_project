import 'package:flutter/material.dart';
import 'package:flutter_project/Core/constantsWidgets/Text.dart';

class RowAppBar extends StatelessWidget {
  const RowAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Maintext(text: 'PrimePick', fontWeight: FontWeight.w500, size: 27),
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}