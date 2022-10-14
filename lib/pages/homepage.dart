import 'package:flutter/material.dart';
import 'package:tester/pages/account.dart';
import 'package:tester/pages/notification.dart';
import 'package:tester/pages/bookrides.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userEmail});

  final String? userEmail;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late List<Widget> _allPages;

  void _navigatebottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    final List<Widget> pages = [
      // UserHome(email: widget.userEmail),
      UserRides(email: widget.userEmail),
      UserChat(
        email: widget.userEmail,
      ),
      const UserAccount(),
    ];
    _allPages = pages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _allPages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _navigatebottombar,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Book a Ride',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'View Booked Rides'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Sign Out'),
            ]));
  }
}
