import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final List<Map<String, String>> employees = [
    {
      'name': 'Nancy Bayeta',
      'contact': '09066297808',
      'status': 'Yes',
      'reason': '',
    },
    {
      'name': 'Janaica Roblo',
      'contact': '09758550822',
      'status': 'No',
      'reason': 'Personal Emergency',
    },
    {
      'name': 'Lyncel Medrano',
      'contact': '09997160884',
      'status': 'Yes',
      'reason': '',
    },
    {
      'name': 'Angela Rapas',
      'contact': '09932231545',
      'status': 'Yes',
      'reason': '',
    },
    {
      'name': 'Ann Casandra',
      'contact': '09951451916',
      'status': 'No',
      'reason': 'Scheduling confict',
    },
    {
      'name': 'Annuary Panganiban',
      'contact': '09123456789',
      'status': 'No',
      'reason': 'Health Issues',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TC.jpg'), // Make sure to add this image to your assets
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.lighten,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF672525),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text('Employee Name', style: TextStyle(fontWeight: FontWeight.bold))),
                            Expanded(child: Text('Contact Number', style: TextStyle(fontWeight: FontWeight.bold))),
                            Expanded(child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                            Expanded(child: Text('Reason of Unavailability', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                        ),
                        Divider(thickness: 2),
                        Expanded(
                          child: ListView.builder(
                            itemCount: employees.length,
                            itemBuilder: (context, index) {
                              final employee = employees[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(child: Text('${index + 1}. ${employee['name']}')),
                                    Expanded(child: Text(employee['contact'] ?? '')),
                                    Expanded(
                                      child: Text(
                                        employee['status'] ?? '',
                                        style: TextStyle(
                                          color: employee['status'] == 'Yes' ? Colors.green : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Text(employee['reason'] ?? '')),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}