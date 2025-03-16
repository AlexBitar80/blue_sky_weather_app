import 'package:flutter/material.dart';

class WeeklyItemWidget extends StatelessWidget {
  final String day;
  final IconData icon;
  final IconData humidityIcon;
  final String humidity;
  final String tempHigh;
  final String tempLow;
  final String windSpeed;
  final IconData windSpeedIcon;

  const WeeklyItemWidget({
    super.key,
    required this.day,
    required this.icon,
    required this.tempHigh,
    required this.tempLow,
    required this.humidityIcon,
    required this.humidity,
    required this.windSpeed,
    required this.windSpeedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                humidityIcon,
                color: Colors.lightBlue,
                size: 14.0,
              ),
              const SizedBox(width: 5),
              Text(
                humidity,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Spacer(),
          Row(
            spacing: 5.0,
            children: [
              Icon(
                windSpeedIcon,
                color: Colors.lightBlue,
                size: 14.0,
              ),
              const SizedBox(width: 8),
              Text(
                windSpeed,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Spacer(),
          Icon(
            icon,
            color: Colors.black,
            size: 14.0,
          ),
          SizedBox(
            width: 55.0,
            child: Text(
              '$tempHigh/$tempLow',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
