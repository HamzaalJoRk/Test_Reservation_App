import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SubMenuItem {
  final String title;
  final VoidCallback onPress;

  SubMenuItem({required this.title, required this.onPress});
}

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    this.subItems,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final List<SubMenuItem>? subItems;

  @override
  _ProfileMenuWidgetState createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends State<ProfileMenuWidget> {
  bool showSubItems = false;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Color(0xFF8857F1) : Color(0xFF8857F1);

    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              showSubItems = !showSubItems;
            });
            widget.onPress();
          },
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: iconColor.withOpacity(0.1),
            ),
            child: Icon(widget.icon, color: iconColor),
          ),
          title: Text(widget.title,
              // style: Theme.of(context)
              //     .textTheme
              //     .bodyText1
              //     ?.apply(color: widget.textColor)
              ),
          trailing: widget.endIcon
              ? Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.angle_right,
                      size: 18.0, color: Colors.grey))
              : null,
        ),
        if (showSubItems && widget.subItems != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.subItems!.map((subItem) {
              return GestureDetector(
                onTap: () {
                  subItem.onPress();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFF8857F1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        subItem.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
