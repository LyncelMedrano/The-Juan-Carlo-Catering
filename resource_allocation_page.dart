import 'package:flutter/material.dart';

class ResourceAllocationPage extends StatelessWidget {
  final List<Map<String, dynamic>> banquetFurnitures = [
    {'item': 'Round Tables', 'quantity': 11, 'reserve': 2},
    {'item': 'Rec. Tables', 'quantity': 4, 'reserve': 0},
    {'item': 'Chairs', 'quantity': 150, 'reserve': 20},
  ];

  final List<Map<String, dynamic>> platesAndServingware = [
    {'item': 'Dinner Plate', 'quantity': 150, 'reserve': 50},
    {'item': 'Salad Plate', 'quantity': 150, 'reserve': 50},
    {'item': 'Bowls', 'quantity': 150, 'reserve': 50},
    {'item': 'Glasses', 'quantity': 150, 'reserve': 50},
  ];

  final List<Map<String, dynamic>> equipmentsAndUtensils = [
    {'item': 'Knives', 'quantity': 150, 'reserve': 50},
    {'item': 'Spoons', 'quantity': 150, 'reserve': 50},
    {'item': 'Forks', 'quantity': 150, 'reserve': 50},
    {'item': 'Soup Spoon', 'quantity': 150, 'reserve': 50},
    {'item': 'Salad Fork', 'quantity': 150, 'reserve': 50},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Allocation'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/TC.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryTable('Banquet Furnitures', banquetFurnitures),
                SizedBox(height: 20),
                _buildCategoryTable('Plates & Servingware', platesAndServingware),
                SizedBox(height: 20),
                _buildCategoryTable('Equipments & Utensils', equipmentsAndUtensils),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTable(String categoryTitle, List<Map<String, dynamic>> items) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.brown[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(82, 151, 147, 147),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Item')),
                DataColumn(label: Text('Quantity')),
                DataColumn(label: Text('Reserve')),
              ],
              rows: items
                  .map(
                    (item) => DataRow(
                      cells: [
                        DataCell(Text(item['item'])),
                        DataCell(Text(item['quantity'].toString())),
                        DataCell(Text(item['reserve'].toString())),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}