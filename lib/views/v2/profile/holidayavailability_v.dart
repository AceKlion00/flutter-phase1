import 'package:accordion/accordion.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class V2ProfileHolidayAvailabilityView extends StatefulWidget {
  const V2ProfileHolidayAvailabilityView({Key? key}) : super(key: key);

  @override
  _V2ProfileHolidayAvailabilityViewState createState() =>
      _V2ProfileHolidayAvailabilityViewState();
}

class _V2ProfileHolidayAvailabilityViewState
    extends State<V2ProfileHolidayAvailabilityView> {
  bool _isLoading = false;
  int _selectedIndex = 2;
  bool value = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // abV2GotoBottomNavigation(index, 2);
  }

  Widget getContent() {
    final List<String> yearList = [
      "Update Availability",
      "Request time off",
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            itemCount: yearList.length,
            itemBuilder: (context, index) {
              String year = yearList[index];
              return Column(
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  CheckboxListTile(
                    title: Text('Monday'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: false, // Replace with the appropriate value
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue != null) {
                          value = newValue;
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Tuesday'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: true, // Replace with the appropriate value
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue != null) {
                          value = newValue;
                        }
                      });
                    },
                  ),
                  // Add more CheckboxListTile widgets for other days of the week
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    // abV2AppBar(context, 'Holiday Availability');
    return AppBar(
      title: Text('Holiday Availability'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, _isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}
