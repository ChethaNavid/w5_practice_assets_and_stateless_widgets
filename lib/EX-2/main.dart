import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Custom buttons", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              CustomButton(label: "Submit", icon: Icons.check),
              CustomButton(
                label: "Time", 
                icon: Icons.access_time, 
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary, 
              ),
              CustomButton(
                label: "Account", 
                icon: Icons.account_circle, 
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled, 
              ),
            ]
          )
        ),
      ),
    );
  }
}

enum IconPosition { left, right }

enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color _buttonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _buttonColor(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, color: Colors.purple, size: 18),
                Text(
                  label,
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
              ]
            : [
                Text(
                  label,
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                Icon(icon, color: Colors.purple, size: 18),
              ],
      ),
    );
  }
}
