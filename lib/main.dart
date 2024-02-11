import 'package:ethiopian_calender/ehiopian_datetime.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Initialize date formatting for the Amharic locale
  await initializeDateFormatting('am');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EhiopianDateTime(),
    );
  }

}
