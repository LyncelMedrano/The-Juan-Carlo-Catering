import 'package:flutter/material.dart';

class StaffingPage extends StatefulWidget {
  @override
  _StaffingPageState createState() => _StaffingPageState();
}

class _StaffingPageState extends State<StaffingPage> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, Map<String, dynamic>> clientData = {
    'ann': {
      'menu': [
        {'category': 'Appetizers', 'items': 'Spring Roll'},
        {'category': 'Soup', 'items': 'Creamy Pumpkin Soup'},
        {'category': 'Entrees', 'items': 'Roasted Chicken, Beed Caldereta'},
        {'category': 'Desserts', 'items': 'Mango Surprise, Galaxy Delight'},
        {'category': 'Drinks', 'items': 'Water, Cucumber lemonade'}
      ],
      'staff': [
        {'role': 'Chefs', 'available': 7},
        {'role': 'Buffet Attendant', 'available': 10},
        {'role': 'Soup/Salad/Dessert', 'available': 4},
        {'role': 'Bartenders', 'available': 3},
        {'role': 'Roving/VIP', 'available': 8}
      ],
    },
    'tin': {
      'menu': [
        {'category': 'Appetizers', 'items': 'Spring Roll'},
        {'category': 'Soup', 'items': 'Creamy Pumpkin Soup'},
        {'category': 'Entrees', 'items': 'Roasted Chicken, Beed Caldereta'},
        {'category': 'Desserts', 'items': 'Mango Surprise, Galaxy Delight'},
        {'category': 'Drinks', 'items': 'Water, Cucumber lemonade'}
      ],
      'staff': [
        {'role': 'Chefs', 'available': 10},
        {'role': 'Buffet Attendant', 'available': 5},
        {'role': 'Soup/Salad/Dessert', 'available': 2},
        {'role': 'Bartenders', 'available': 2},
        {'role': 'Roving/VIP', 'available': 5}
      ],
    },
  };

  Map<String, dynamic>? _selectedClientData;

  void _searchClient(String clientName) {
    setState(() {
      _selectedClientData = clientData[clientName];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Juan Carlo The Caterer ♔',
                  style: TextStyle(
                    fontFamily: 'Cursive',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Client',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(96, 161, 163, 156),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => _searchClient(_searchController.text),
                    ),
                    ),
                ),
                SizedBox(height: 20),
                if (_selectedClientData != null) ...[
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Items')),
                      ],
                      rows: _selectedClientData!['menu']
                          .map<DataRow>((item) => DataRow(cells: [
                                DataCell(Text(item['category'])),
                                DataCell(Text(item['items'])),
                              ]))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Staff',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Role')),
                        DataColumn(label: Text('Available')),
                      ],
                      rows: _selectedClientData!['staff']
                          .map<DataRow>((item) => DataRow(cells: [
                                DataCell(Text(item['role'])),
                                DataCell(Text(item['available'].toString())),
                              ]))
                          .toList(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}