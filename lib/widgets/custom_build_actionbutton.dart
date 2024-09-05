import 'package:flutter/material.dart';

Widget customBuildButton({
  required String label,
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: color,
      minimumSize: Size(double.infinity, 50), // Make buttons stretch horizontally
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: onPressed,
    icon: Icon(icon, size: 28),
    label: Text(label, style: TextStyle(fontSize: 18)),
  );
}