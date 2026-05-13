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
      home: const SocialMediaCard(),
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 32 Task"),
      ),
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Profile Section (Row)
              Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "John Doe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Caption
              const Text(
                "Enjoying the beautiful sunset at the beach 🌅✨",
                maxLines: 2,
              ),

              const SizedBox(height: 10),

              /// Image + Like Button (Stack)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Positioned Like Button
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.red,
                      onPressed: () {},
                      child: const Icon(Icons.favorite),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}