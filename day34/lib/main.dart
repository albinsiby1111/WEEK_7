import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> contacts = const [
    {"name": "Aarav", "phone": "9876543210"},
    {"name": "Diya", "phone": "9876543211"},
    {"name": "Rahul", "phone": "9876543212"},
    {"name": "Anjali", "phone": "9876543213"},
    {"name": "Kiran", "phone": "9876543214"},
    {"name": "Meera", "phone": "9876543215"},
    {"name": "Vishnu", "phone": "9876543216"},
    {"name": "Nikhil", "phone": "9876543217"},
  ];

  final List<String> categories = const [
    "Family",
    "Friends",
    "Work",
    "College",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // GridView Section
          SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: categories.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Contact List
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        contacts[index]["name"]![0],
                      ),
                    ),
                    title: Text(contacts[index]["name"]!),
                    subtitle: Text(contacts[index]["phone"]!),
                    trailing: const Icon(Icons.call),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}