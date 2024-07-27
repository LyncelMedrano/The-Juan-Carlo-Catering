import 'package:flutter/material.dart';

class PayrollPage extends StatefulWidget {
  @override
  _PayrollPageState createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, Map<String, dynamic>> payrollData = {
    'lyn': {
      'setup': 170.00,
      'function': 300.00,
      'packup': 180.00,
      'medical': 0.00,
      'breakages': 5.00,
      'uniform': 0.00,
      'inv': 50.00,
      'vip': 0.00,
      'tip': 225.00,
      'inc': 0.00,
    },
    'jan': {
      'setup': 160.00,
      'function': 290.00,
      'packup': 170.00,
      'medical': 10.00,
      'breakages': 0.00,
      'uniform': 20.00,
      'inv': 40.00,
      'vip': 30.00,
      'tip': 200.00,
      'inc': 10.00,
    },
  };

  Map<String, dynamic>? _selectedPayrollData;

  void _searchEmployee(String employeeName) {
    setState(() {
      _selectedPayrollData = payrollData[employeeName];
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
                    hintText: 'Search Employee',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(96, 161, 163, 156),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => _searchEmployee(_searchController.text),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (_selectedPayrollData != null)
                  Card(
                    color: Color.fromARGB(34, 238, 236, 236),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payroll Summary',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildPayrollRow('Set-up:', _selectedPayrollData!['setup']),
                          _buildPayrollRow('Function:', _selectedPayrollData!['function']),
                          _buildPayrollRow('Pack-up:', _selectedPayrollData!['packup']),
                          _buildPayrollRow('Medical:', _selectedPayrollData!['medical']),
                          _buildPayrollRow('Breakages:', _selectedPayrollData!['breakages']),
                          _buildPayrollRow('Uniform:', _selectedPayrollData!['uniform']),
                          _buildPayrollRow('INV:', _selectedPayrollData!['inv']),
                          _buildPayrollRow('VIP:', _selectedPayrollData!['vip']),
                          _buildPayrollRow('TIP:', _selectedPayrollData!['tip']),
                          _buildPayrollRow('INC:', _selectedPayrollData!['inc']),
                          SizedBox(height: 10),
                          _buildPayrollRow('Net Pay:', _calculateNetPay(_selectedPayrollData!)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPayrollRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }

  double _calculateNetPay(Map<String, dynamic> payrollData) {
    double totalEarnings = payrollData['setup'] + payrollData['function'] + payrollData['packup'];
    double totalDeductions = payrollData['medical'] + payrollData['breakages'] + payrollData['uniform'];
    double totalAdditional = payrollData['inv'] + payrollData['vip'] + payrollData['tip'] + payrollData['inc'];
    return totalEarnings - totalDeductions + totalAdditional;
  }
}