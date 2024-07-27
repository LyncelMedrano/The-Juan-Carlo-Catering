import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final List<Map<String, Map<String, String>>> services = [
    {
      'Weddings': {
        'Title': 'Weddings',
        'Venue': 'Brittany Palazzo',
        'Time': '3 PM to 10 PM',
        'Guest Count': '150',
        'Theme': 'Classic Elegance',
        'Menu': 'Appetizers: Bruschetta, Caprese Skewers\nMain Course: Grilled Salmon, Beef Tenderloin\nSides: Roasted Vegetables, Garlic Mashed Potatoes\nDessert: Wedding Cake, Assorted Pastries\nDrinks: Open Bar with Signature Cocktails'
      }
    },
     {
      'Special Occasions': {
        'Title': 'Special Occasions',
        'Venue': 'Villa Milagros',
        'Time': 'Flexible',
        'Occasion Type': 'Birthday, Anniversary, Reunion',
        'Guest Count': '50-100',
        'Special Requirements': 'Customizable decorations and menu'
      }
    },
    {
      'Debuts': {
        'Title': 'Debuts',
        'Venue': 'La Bella Tagaytay',
        'Time': '6 PM to 12 AM',
        'Guest Count': '100',
        'Theme': 'Enchanted Garden',
        'Program': 'Grand Entrance, 18 Roses, 18 Candles, First Dance'
      }
    },
    {
      'Children\'s Party': {
        'Title': 'Children\'s Party',
        'Venue': 'Acuaverde Beach Resorts',
        'Time': '2 PM to 6 PM',
        'Age Group': '5-12 years old',
        'Theme': 'Under the Sea Adventure',
        'Activities': 'Face Painting, Balloon Twisting, Magic Show, Games'
      }
    },
    {
      'Corporate Events': {
        'Title': 'Corporate Events',
        'Venue': 'Almond Garden Tagaytay',
        'Time': '9 AM to 5 PM',
        'Attendees': '50-200',
        'Event Type': 'Conference, Team Building, Product Launch',
        'Catering Style': 'Buffet with coffee breaks'
      }
    },
    {
      'Event Styling': {
        'Title': 'Event Styling',
        'Service': 'Custom event decoration and design',
        'Themes': 'Modern, Rustic, Elegant, Bohemian, Vintage',
        'Elements': 'Floral arrangements, Lighting, Table settings, Backdrops',
        'Customization': 'Tailored to client preferences and event type',
        'Setup Time': 'Varies based on event size and complexity'
      }
    },
  ];
  

  final List<String> images = [
    'assets/service1.jpg',
    'assets/service5.jpg',
    'assets/service2.jpg',
    'assets/service3.jpg',
    'assets/corporate_event.jpg',
    'assets/events_styling.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'JUAN CARLO THE CATERER',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 0, 0),
              ),
            ),
            Text(
              'The Heart of Tasteful Celebration',
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 71, 0, 0),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  final serviceName = service.keys.first;
                  final serviceDetails = service.values.first;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 71, 0, 0), width: 5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: 400,
                          height: 300,
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        color: Color.fromARGB(255, 179, 133, 133),
                        child: InkWell(
                          onTap: () {
                            _showServiceDetails(context, serviceName, serviceDetails);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              serviceName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Serif',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showServiceDetails(BuildContext context, String serviceName, Map<String, String> details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(serviceName),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "${entry.key}: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: entry.value),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}