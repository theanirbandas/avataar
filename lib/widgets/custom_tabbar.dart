import 'package:avtaar/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatefulWidget {

  final void Function(int) onTabSelected;

  CustomTabbar({Key key, this.onTabSelected}) : super(key: key);

  @override
  _CustomTabbarState createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {

  final List<String> _tabLabels = [
    'Design',
    'Environment',
    'Technology',
    'Research',
    'Education',
    'Sports'
  ];

  int _selectedTab = 0;

  void _onTabSelected(int position) {
    setState(() => _selectedTab=position);
    widget.onTabSelected?.call(position);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for(int i= 0;i<_tabLabels.length;i++)
              ...[
                CustomTab(
                  label: _tabLabels[i], 
                  isSelected: i==_selectedTab,
                  onTap: () => _onTabSelected(i),
                ),
                if(i<_tabLabels.length-1)
                  _dot(),
              ],
          ],
        ),
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: 5.0,
      height: 5.0,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}