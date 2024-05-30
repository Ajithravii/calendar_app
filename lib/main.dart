import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(CalendarApp());

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CalendarHomePage(),
    );
  }
}
class CalendarHomePage extends StatefulWidget {
  const CalendarHomePage({super.key});

  @override
  State<CalendarHomePage> createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  DateTime today =DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today=day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selected day="+today.toString().split(" ")[0]),
            Container(
              child: TableCalendar(
                locale: "en_us",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day)=> isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010,10,16),
                lastDay: DateTime.utc(2050,3,14),
                onDaySelected: _onDaySelected,

              ),
            )
          ],
        )
      ),
    );
  }
}


