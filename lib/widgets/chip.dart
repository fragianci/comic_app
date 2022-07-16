import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChipWidget extends StatelessWidget {
  final String description;
  final dynamic myLabel;

  ChipWidget(this.description, this.myLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: Text('$description: $myLabel'),
      ),
    );
  }
}