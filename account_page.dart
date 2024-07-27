import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  // List to store employee accounts
  final List<Map<String, String>> _employeeAccounts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TC.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.1),
              BlendMode.lighten,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF672525),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF672525),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextField('NAME:', _nameController),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField('AGE:', _ageController),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: _buildTextField('SEX:', _sexController),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            _buildTextField('ADDRESS:', _addressController),
                            SizedBox(height: 10),
                            _buildTextField('EMAIL:', _emailController),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Card(
                            color: Color(0xFF672525),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.orange,
                                    child: Icon(Icons.person, size: 50, color: Colors.white),
                                  ),
                                  SizedBox(height: 50),
                                  Text(
                                    'Name: Cristine Macatangay',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Administrator',
                                    style: TextStyle(color: Colors.amber),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              _showAddEmployeeDialog(context);
                            },
                            icon: Icon(Icons.add, color: Colors.amber),
                            label: Text('Add employee account', style: TextStyle(color: Colors.amber)),
                            style: ElevatedButton.styleFrom(
                              disabledBackgroundColor: Color(0xFF672525),
                              minimumSize: Size(double.infinity, 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  void _showAddEmployeeDialog(BuildContext context) {
    final TextEditingController _employeeNameController = TextEditingController();
    final TextEditingController _employeeEmailController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Employee Account"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogTextField('Name', _employeeNameController),
              SizedBox(height: 10),
              _buildDialogTextField('Email', _employeeEmailController),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  _employeeAccounts.add({
                    'name': _employeeNameController.text,
                    'email': _employeeEmailController.text,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}