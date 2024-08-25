// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddsOn extends StatefulWidget {
  const AddsOn({super.key});

  @override
  State<AddsOn> createState() => _AddsOnState();
}

class _AddsOnState extends State<AddsOn> {
  int passengerCount = 2;
  double totalCost = 2500;
  Map<String, double> additionalCosts = {
    'Private Car (4 Seater)': 500,
    'Private Car (7 Seater)': 500,
    'Shared Rides': 500,
    'Breakfast and snacks': 500,
    'Pure Veg Lunch': 500,
    'Nonveg lunch': 500,
    'Tour Guide': 500,
  };
  Map<String, bool> selectedServices = {};

  void toggleService(String service) {
    setState(() {
      if (selectedServices[service] ?? false) {
        selectedServices.remove(service);
        totalCost -= additionalCosts[service]!;
      } else {
        selectedServices[service] = true;
        totalCost += additionalCosts[service]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add-Ons',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 8.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Boat Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text("7:00 AM", style: TextStyle(fontSize: 16)),
                            Text("From", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.directions_boat,
                                color: Colors.grey),
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
                    const Divider(color: Colors.grey),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.black),
                            SizedBox(width: 5),
                            Text("2 Passengers",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.currency_rupee, color: Colors.black),
                            Text("2500",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Additional Services",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                "Transportation Options",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Cab service pickUp and dropOff at Station; driver details will be shared via WhatsApp.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              buildServiceRow("Private Car (4 Seater)", 500),
              const SizedBox(height: 10),
              buildServiceRow("Private Car (7 Seater)", 500),
              const SizedBox(height: 10),
              buildServiceRow("Shared Rides", 500),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                "Meals Section",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              buildMealRow("Breakfast and snacks", 500),
              const SizedBox(height: 10),
              buildMealRow("Pure Veg Lunch", 500),
              const SizedBox(height: 10),
              buildMealRow("Nonveg lunch", 500),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                "Other Recommendations",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              buildRecommendationRow("Tour Guide", 500),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              const Text(
                "Bill Breakdown",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              buildBillRow("2 Passengers", 2500),
              ...selectedServices.keys
                  .map((service) =>
                      buildBillRow(service, additionalCosts[service]!))
                  .toList(),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              buildBillRow("Total (taxes included)", totalCost),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceRow(String service, double cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "₹ $cost",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(140), color: Colors.blue),
          child: IconButton(
            icon: Icon(
              selectedServices[service] ?? false ? Icons.remove : Icons.add,
              color: selectedServices[service] ?? false
                  ? Colors.red
                  : Colors.white,
            ),
            onPressed: () => toggleService(service),
          ),
        ),
      ],
    );
  }

  Widget buildMealRow(String meal, double cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "₹ $cost",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () => toggleService(meal),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                selectedServices[meal] ?? false ? Colors.red : Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            selectedServices[meal] ?? false ? 'Remove' : 'Add',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget buildRecommendationRow(String service, double cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "₹ $cost",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            selectedServices[service] ?? false ? Icons.remove : Icons.add,
            color:
                selectedServices[service] ?? false ? Colors.red : Colors.blue,
          ),
          onPressed: () => toggleService(service),
        ),
      ],
    );
  }

  Widget buildBillRow(String label, double cost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            const Icon(Icons.currency_rupee, color: Colors.black),
            Text(
              cost.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
