/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_hijri_calendar/islamic_hijri_calendar.dart';
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1, title: const Text("Islamic Hijri Calendar")),
      body:IslamicHijriCalendar(
        highlightBorder : Theme.of(context).colorScheme.primary, // Set selected date border color
        defaultBorder : Theme.of(context).colorScheme.onSurface.withOpacity(.1), // Set default date border color
        highlightTextColor : Theme.of(context).colorScheme.surface, // Set today date text color
        defaultTextColor : Theme.of(context).colorScheme.onSurface, //Set others dates text color
        defaultBackColor : Theme.of(context).colorScheme.surface, // Set default date background color
        adjustmentValue: 0, // Set hijri calendar adjustment value which is set  by user side
        isGoogleFont: true, // Set it true if you want to use google fonts else false
        fontFamilyName: "Lato", // Set your custom font family name or google font name
        getSelectedEnglishDate: (selectedDate){}, // returns the date selected by user
        getSelectedHijriDate: (selectedDate){}, // returns the date selected by user in Hijri format
        isDisablePreviousNextMonthDates: true, // Set dates which are not included in current month should show disabled or enabled
      ),
    );
  }
}
*/
