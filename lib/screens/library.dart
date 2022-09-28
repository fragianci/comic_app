import 'package:comic_app/widgets/personal_header.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  final Function() goToMyHome;
  const Library(this.goToMyHome);

  @override
  State<Library> createState() => _LibraryState(goToMyHome);
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  final Function() goToMyHome;
  late AnimationController _controller;
  late Duration _duration = Duration(milliseconds: 500);
  bool settingsOpened = false;
  _LibraryState(this.goToMyHome);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            PersonalHeader(true, openSettings, goToMyHome),
          ],
        ),
      ),
    );
  }

  void openSettings(_mycontroller, myduration) {
    setState(() {
      settingsOpened = !settingsOpened;
      _controller = _mycontroller;
      _duration = myduration;
    });
  }
}
