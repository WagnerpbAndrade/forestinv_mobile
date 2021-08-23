import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final double width;
  String dropdownValue;
  final IconData icon;
  final Color? colorText;
  final Color? underlineColor;
  final List<String> items;
  CustomDropdownButton({
    Key? key,
    required this.width,
    required this.dropdownValue,
    required this.icon,
    this.colorText = Colors.black,
    required this.items,
    this.underlineColor = Colors.deepPurpleAccent,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String get initialValue => widget.dropdownValue;
  set changeValue(String value) => widget.dropdownValue = value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: DropdownButton<String>(
        value: initialValue,
        icon: const Icon(Icons.arrow_downward),
        items: widget.items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        elevation: 16,
        style: TextStyle(color: widget.colorText),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          setState(() {
            changeValue = value!;
          });
        },
      ),
    );
  }
}
