import 'package:flutter/material.dart';
import '../utils/theme_color.dart';

class AddSubtreuct extends StatefulWidget {
  const AddSubtreuct({
    super.key,
  });

  static int itemCount = 1;
  @override
  State<AddSubtreuct> createState() => _AddSubtreuctState();
}

class _AddSubtreuctState extends State<AddSubtreuct> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: (){
          if(AddSubtreuct.itemCount!=1){ AddSubtreuct.itemCount--;}else{return;}
          setState(() {

          });

        },
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
            AddSubtreuct.itemCount.toString(),
            style: TextStyle(
                color: ThemeColor.softBlack, fontWeight: FontWeight.w600),
          ),
        ),
        InkWell(onTap: (){

          AddSubtreuct.itemCount++;
          setState(() {

          });
        },
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
