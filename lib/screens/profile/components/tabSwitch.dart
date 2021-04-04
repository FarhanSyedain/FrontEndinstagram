import 'package:flutter/material.dart';

class TabSwitch extends StatelessWidget {
  final Icon icon;
  final bool showBorder;
  final Function chagneTab;
  final int tabIndex;

  const TabSwitch(
      {Key key, this.icon, this.showBorder, this.chagneTab, this.tabIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => chagneTab(tabIndex),
        child: Container(
          child: icon,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: showBorder
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withAlpha(100),
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
