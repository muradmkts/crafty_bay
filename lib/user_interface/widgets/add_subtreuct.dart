import 'package:flutter/material.dart';
import '../utils/theme_color.dart';

class AddSubtreuct extends StatelessWidget {
  const AddSubtreuct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: ThemeColor.aqua.withAlpha(100),
                borderRadius: BorderRadius.circular(3)),
            child: Center(
                child: Icon(
              Icons.horizontal_rule,
              size: 12,
              color: Colors.white,
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "01",
            style: TextStyle(
                color: ThemeColor.softBlack, fontWeight: FontWeight.w600),
          ),
        ),
        InkWell(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: ThemeColor.aqua, borderRadius: BorderRadius.circular(3)),
            child: Center(
                child: Icon(
              Icons.add,
              size: 12,
              color: Colors.white,
            )),
          ),
        )
      ],
    );
  }
}
