import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final double width;
  String dropdownValue;
  final String hint;
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
    required this.hint,
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
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: Text(widget.hint),
        value: initialValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        isExpanded: true,
        dropdownColor: Colors.white,
        items: widget.items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
        elevation: 16,
        style: TextStyle(color: widget.colorText),
        underline: const SizedBox(),
        onChanged: (String? value) {
          setState(() {
            changeValue = value!;
          });
        },
      ),
    );
  }
}
