import 'package:disaster_management/src/features/authentication/screens/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class DisasterReportedScreen extends StatelessWidget {
  final String area;
  final String disasterType;
  final String currentStatus;

  const DisasterReportedScreen({
    Key? key,
    required this.area,
    required this.disasterType,
    required this.currentStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Perform custom action here
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        appBar: AppBar(
          title: Text('Disaster Reported'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 80,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Disaster Reported',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Area:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                area,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Disaster Type:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                disasterType,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Current Status:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                currentStatus,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => Dashboard(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Back to Home screen'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
