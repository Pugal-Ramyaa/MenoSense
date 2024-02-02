// CalendarComponent.dart
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/intl.dart';
import 'package:menopausal_app/constants.dart';

class CalendarComponent extends StatefulWidget {
  @override
  _CalendarComponentState createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  late CalendarCarousel _calendarCarouselNoHeader;

  static Widget _eventIcon = Container(
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    child: Icon(
      Icons.person,
      color: Colors.black,
    ),
  );

  EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2020, 2, 10): [
        Event(
          date: DateTime(2020, 2, 14),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        Event(
          date: DateTime(2020, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        Event(
          date: DateTime(2020, 2, 15),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
       thisMonthDayBorderColor: Colors.transparent,
      weekFormat: false,
      markedDatesMap: _markedDateMap,
      height: 370.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
      todayButtonColor: kPrimaryColor,
      todayBorderColor: kPrimaryColor,
      selectedDayTextStyle: TextStyle(
        color: Colors.black,
      ),
      selectedDayButtonColor: Colors.transparent,
      selectedDayBorderColor: kPrimaryColor,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text(
                  'PREV',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  setState(() {
                    _targetDateTime = DateTime(
                      _targetDateTime.year,
                      _targetDateTime.month - 1,
                    );
                    _currentMonth = DateFormat.yMMM().format(
                      _targetDateTime,
                    );
                  });
                },
              ),
              Expanded(
                child: Text(
                  _currentMonth,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                child: Text(
                  'NEXT',
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  setState(() {
                    _targetDateTime = DateTime(
                      _targetDateTime.year,
                      _targetDateTime.month + 1,
                    );
                    _currentMonth = DateFormat.yMMM().format(
                      _targetDateTime,
                    );
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 370.0,  // Set a specific height here
            child: _calendarCarouselNoHeader,
          ),
        ],
      ),
    );
  }
}
