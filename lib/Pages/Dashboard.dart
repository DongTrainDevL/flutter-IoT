import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Hamburger menu clicked')),
              );
            },
            child: Image.asset(
              'assets/icons/log-login.png',
              fit: BoxFit.contain,
            ),
          )
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(child: CurrentTimeWidget()),
              const SizedBox(height: 20),
              const TemperatureHumidityWidget(),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Features'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildImageCard('assets/icons/logo-flid-tech.png', Colors.orange),
                  _buildImageCard('assets/icons/smartfarm.png', Colors.blue),
                  _buildImageCard('assets/icons/logo-flid-tech.png', Colors.red),
                  _buildImageCard('assets/icons/smartfarm.png', Colors.indigo),
                  
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildImageCard(String imagePath, Color color) {
    return Container(
      width: 160,
      height: 160,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: color.withOpacity(0.1),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class CurrentTimeWidget extends StatefulWidget {
  const CurrentTimeWidget({super.key});

  @override
  State<CurrentTimeWidget> createState() => _CurrentTimeWidgetState();
}

class _CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.access_time, size: 36, color: Colors.deepOrange),
            const SizedBox(width: 16),
            Text(
              _currentTime,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperatureHumidityWidget extends StatelessWidget {
  const TemperatureHumidityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double temperature = 28.5;
    double humidity = 60.0;

    return Row(
      children: [
        _buildDataCard(
          icon: Icons.thermostat,
          label: 'Temperature',
          value: '$temperature °C',
          color: Colors.redAccent,
        ),
        const SizedBox(width: 16),
        _buildDataCard(
          icon: Icons.water_drop,
          label: 'Humidity',
          value: '$humidity %',
          color: Colors.blueAccent,
        ),
      ],
    );
  }

  Widget _buildDataCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.15), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 16, color: color)),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
