import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  const VideoReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        Text(
          releaseDate.toString().split(' ').first,
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
