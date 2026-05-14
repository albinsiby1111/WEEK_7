
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
      home: ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    // MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Dashboard"),
        backgroundColor: Colors.blue,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // Tablet layout
          if (constraints.maxWidth > 700) {
            return Row(
              children: [

                // Sidebar using Expanded
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue.shade100,
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text("Dashboard"),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Profile"),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Settings"),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main content using Expanded
                Expanded(
                  flex: 5,
                  child: GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(
                      6,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Card ${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // Mobile layout
          return Column(
            children: [

              // Flexible widget
              Flexible(
                flex: 1,
                child: Container(
                  width: screenWidth,
                  color: Colors.blue.shade100,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Menu Section",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 4,
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    6,
                    (index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Card ${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}