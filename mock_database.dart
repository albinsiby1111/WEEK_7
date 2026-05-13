
import 'dart:async';

// Async function to simulate fetching data
Future<String> fetchData() async {
  // Simulate 3-second delay
  await Future.delayed(Duration(seconds: 3));

  // Simulated error
  throw Exception("Connection Timeout");

  // If no error:
  // return "Data fetched successfully!";
}

void main() async {
  print("Fetching data from mock database...");

  try {
    String data = await fetchData();
    print(data);
  } catch (e) {
    print("Error: $e");
  } finally {
    print("Process completed.");
  }
}