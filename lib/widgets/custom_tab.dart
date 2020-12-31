import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  
  final String label;
  final bool isSelected;
  final Function() onTap;
  
  const CustomTab({
    Key key,
    @required this.label,
    this.isSelected=false,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const SizedBox(height: 10.0),
            Container(
              height: 3.0,
              width: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: isSelected ? const Color(0xFF630BFF) : Colors.white,
              ),
            )
          ],
        ),      
      ),
    );
  }
}