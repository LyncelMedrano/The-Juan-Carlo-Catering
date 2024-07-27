import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemNavigator.pop()
import 'home_tab.dart';
import 'staffing_page.dart';
import 'payroll_page.dart';
import 'resource_allocation_page.dart';
import 'account_page.dart';
import 'events_calendar_page.dart';
import 'messages_page.dart';
import 'login_page.dart'; // Import the login page

class MainDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.people), text: 'Staffing'),
              Tab(icon: Icon(Icons.payment), text: 'Payroll'),
              Tab(icon: Icon(Icons.settings), text: 'Resource Allocation'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Juan Carlo', style: TextStyle(color: Colors.white, fontSize: 24)),
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Account'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Events Calendar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsCalendarPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessagesPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/TC.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TabBarView(
              children: [
                HomeTab(),
                StaffingPage(),
                PayrollPage(),
                ResourceAllocationPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ); // Navigate to login screen
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}