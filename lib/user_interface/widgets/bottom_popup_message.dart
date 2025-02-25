import 'package:flutter/material.dart';

import '../utils/theme_color.dart';

void bottomPopupMessage (BuildContext context, String message, bool isError){



  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: isError?Colors.red:ThemeColor.aqua,content: Text(message, textAlign: TextAlign.center,style: TextStyle(color: ThemeColor.white),)));

}