import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemDone extends StatelessWidget {
  const ItemDone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3.0),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/item_done.svg',
            height: 80,
            width: 80,
          ),
        ));
  }
}
