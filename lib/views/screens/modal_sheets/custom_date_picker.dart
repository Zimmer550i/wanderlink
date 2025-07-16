import 'package:flutter/material.dart';
import 'package:wanderlink/utils/custom_svg.dart';
import 'package:wanderlink/utils/formatter.dart';
import 'package:wanderlink/views/base/custom_button.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? initial;
  final void Function(DateTime) onSubmit;
  const CustomDatePicker({super.key, this.initial, required this.onSubmit});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime date = DateTime.now();
  DateTime? selected;

  @override
  void initState() {
    super.initState();
    if (widget.initial != null) {
      selected = widget.initial;
      date = DateTime(selected!.year, selected!.month, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(height: 26),

          Text(
            "Birthday",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    date = DateTime(date.year, date.month - 1, date.day);
                  });
                },
                borderRadius: BorderRadius.circular(99),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CustomSvg(asset: "assets/icons/date_arrow_left.svg"),
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    date.year.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Color(0xff007AFF),
                      height: 1,
                    ),
                  ),
                  Text(
                    Formatter.monthName(date.month),
                    style: TextStyle(color: Color(0xff007AFF)),
                  ),
                ],
              ),
              Spacer(),

              InkWell(
                onTap: () {
                  setState(() {
                    date = DateTime(date.year, date.month + 1, date.day);
                  });
                },
                borderRadius: BorderRadius.circular(99),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CustomSvg(asset: "assets/icons/date_arrow_right.svg"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            children: [
              for (int i = 0; i < monthLengthCount(date); i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selected == DateTime(date.year, date.month, i + 1)) {
                        selected = null;
                      } else {
                        selected = DateTime(date.year, date.month, i + 1);
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 82) / 7,
                    height: (MediaQuery.of(context).size.width - 82) / 7,
                    decoration: BoxDecoration(
                      color: isSelected(i)
                          ? Color(0xff007AFF)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${i + 1}",
                        style: isSelected(i)
                            ? TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              text: "Save",
              isDisabled: selected == null,
              onTap: () {
                widget.onSubmit(selected!);
              },
            ),
          ),
        ],
      ),
    );
  }

  int monthLengthCount(DateTime date) {
    date = DateTime(date.year, date.month + 1, 1);
    date = date.subtract(Duration(days: 1));
    return date.day;
  }

  bool isSelected(int i) {
    return date.year == selected?.year && (i + 1) == selected?.day;
  }
}
