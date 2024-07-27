import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main_dashboard.dart';
import 'staffing_page.dart';
import 'payroll_page.dart';
import 'resource_allocation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juan Carlo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // This line removes the debug banner
      home: LoginPage(),
      routes: {
        '/dashboard': (context) => MainDashboard(),
        '/staffing': (context) => StaffingPage(),
        '/payroll': (context) => PayrollPage(),
        '/resources': (context) => ResourceAllocationPage(),
      },
    );
  }
}