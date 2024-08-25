import 'package:flutter/material.dart';
import 'package:hygwellapp/screens/Addson.dart';
import 'package:hygwellapp/screens/passengerinput.dart';

class PassengerDetailsScreen extends StatelessWidget {
  final String name;

  const PassengerDetailsScreen({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  color: Colors.lightBlueAccent,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                // Floating rectangle container------------------------
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            const Text("7:00 AM", style: TextStyle(fontSize: 16)),
                            const Text("From", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.directions_boat, color: Colors.grey),
                            Container(
                              height: 50,
                              width: 2,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("3:00 PM", style: TextStyle(fontSize: 16)),
                            Text("To", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Passenger Info---------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Your ticket information will be sent on this number',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.person, color: Colors.white),
                                  SizedBox(width: 10,),
                                  Text('911234567898',style: TextStyle(
                                    color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),)
                                ],
                              ),
                              TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: const Text('Edit',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 16)),
                          ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Passenger 1 details-----------------
                  const Text(
                    'Passenger Details',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  const PassengerInputSection(
                    passengerNumber: 1,
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Colors.grey),
                  const SizedBox(height: 10),
                  // Passenger 2 details----------------
                  const PassengerInputSection(
                    passengerNumber: 2,
                  ),
                  const SizedBox(height: 20),
                  // Continue button
                  SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                   onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddsOn()));
                      },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
