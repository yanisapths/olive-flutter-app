import 'package:flutter/material.dart';
import '../../app_theme.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            shadowColor: Theme.of(context).colorScheme.shadow,
            backgroundColor: AppTheme.nearlyWhite,
            title: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(children: [
                Text(
                  'สร้างนัดดูแล ',
                  style: TextStyle(
                      color: AppTheme.pureBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text('Appointment',
                    style: TextStyle(
                        color: AppTheme.pureBlack,
                        fontSize: 30,
                        fontWeight: FontWeight.w500))
              ]),
            )),
        body: SizedBox());
  }
}
