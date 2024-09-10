import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_app/presentation/screens/job_detail_screen.dart';
import 'package:jobs_app/presentation/screens/jobs_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

int selectedIndex = 0;
List<Widget> listWidegt = [
  JobsScreen(),
  JobDetailScreen(),
];

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            currentIndex: selectedIndex,
            backgroundColor: Colors.blueAccent.shade200,
            selectedIconTheme: IconThemeData(color: Colors.black),
            elevation: 10,
            selectedItemColor: Colors.black45,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            iconSize: 30,
            selectedFontSize: 20,
            unselectedFontSize: 15,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 26,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.circleInfo,
                    size: 26,
                  ),
                  label: 'Details'),
            ]),
        body: Container(
          child: listWidegt.elementAt(selectedIndex),
        ),
      ),
    );
  }
}
