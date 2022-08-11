import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';

// ignore: must_be_immutable
class PatchItem extends StatefulWidget {
  final String name;
  final String simpleName;
  final String description;
  final String version;
  bool isSelected;

  PatchItem({
    Key? key,
    required this.name,
    required this.simpleName,
    required this.description,
    required this.version,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<PatchItem> createState() => _PatchItemState();
}

class _PatchItemState extends State<PatchItem> {
  @override
  Widget build(BuildContext context) {
    bool isDark = getThemeManager(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff1B222B) : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.simpleName,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(widget.version)
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: widget.isSelected,
                  activeColor: Colors.blueGrey[500],
                  onChanged: (newValue) {
                    setState(() {
                      widget.isSelected = newValue!;
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
