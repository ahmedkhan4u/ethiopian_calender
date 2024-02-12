import 'package:abushakir/abushakir.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class EhiopianDateTime extends StatefulWidget {
  const EhiopianDateTime({super.key});

  @override
  State<EhiopianDateTime> createState() => _EhiopianDateTimeState();
}

class _EhiopianDateTimeState extends State<EhiopianDateTime> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('European to Ethiopian Date & Time'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 24,),
            const Text(
              'Ethiopian Date & Time:',
              style: TextStyle(fontSize: 18),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  formatDateTime(DateTime.now()),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(height: 32,),

            const Divider(),
            const SizedBox(height: 32,),
            const Text(
              'European Date to Ethiopian:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8,),

            ElevatedButton(onPressed: () async {
              await selectDate(context);
            }, child:
            Text(DateFormat('yyyy-dd-MM').format(selectedDate))),
            Text(
              formatDate(selectedDate),
              style: const TextStyle(fontSize: 20),
            )

          ],
        ),
      ),
    ));
  }

  String formatDateTime(DateTime dateTime) {
    // Convert to Ethiopian calendar

    // EthiopianDateTime ethiopianDateTimeC = EthiopianDateConverter.
    // convertToEthiopianDate(DateTime.now());
    EtDatetime ethiopian1 = EtDatetime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
    DateTime ethopainDate = DateTime(ethiopian1.year, ethiopian1.month, ethiopian1.day, ethiopian1.hour, ethiopian1.minute, ethiopian1.second);
     DateFormat ethiopianFormat = DateFormat('EEEE, MMMM d, y h:mm:ss a', 'am');
    String ethiopianDateTime = ethiopianFormat.format(ethopainDate);
    return ethiopianDateTime.toString();
  }

  String formatDate(DateTime dateTime) {
    // Convert to Ethiopian calendar
    // EthiopianDateTime ethiopianDateTimeC =
    // EthiopianDateConverter.convertToEthiopianDate(dateTime);
    EtDatetime ethiopian1 = EtDatetime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
    DateTime ethopainDate = DateTime(ethiopian1.year, ethiopian1.month, ethiopian1.day);
    DateFormat ethiopianFormat = DateFormat('EEEE, MMMM d, y', 'am');
    String ethiopianDateTime = ethiopianFormat.format(ethopainDate);

    return ethiopianDateTime;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
