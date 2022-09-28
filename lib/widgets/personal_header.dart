import 'package:comic_app/widgets/popup_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonalHeader extends StatefulWidget {
  final Function(AnimationController, Duration) openSettings;
  final Function() goToMyHome;
  bool isItInLibrary;
  PersonalHeader(this.isItInLibrary, this.openSettings, this.goToMyHome);
  @override
  State<PersonalHeader> createState() =>
      _PersonalHeaderState(isItInLibrary, openSettings, goToMyHome);
}

class _PersonalHeaderState extends State<PersonalHeader>
    with SingleTickerProviderStateMixin {
  final Function(AnimationController, Duration) openSettings;
  final Function() goToMyHome;
  bool isItInLibrary;
  Duration _duration = Duration(milliseconds: 500);
  late AnimationController _controller;

  _PersonalHeaderState(this.isItInLibrary, this.openSettings, this.goToMyHome);
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: !isItInLibrary ? profileHeader() : libraryHeader(),
    );
  }

  Row profileHeader() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: Size(0, 0),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                elevation: 0,
                // shadowColor: Colors.transparent
              ),
              onPressed: goToMyHome,
              child: Image.asset(
                'assets/left-arrow-icon.jpeg',
                height: 30,
                width: 30,
              )),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              'My Profile',
              style: TextStyle(fontSize: 15),
            ),
            margin: const EdgeInsets.only(left: 68),
          ),
        ),
        // Container(
        //   width: 100,
        // ),
        Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: Size(0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_controller.isDismissed) {
                    _controller.forward();
                    openSettings(_controller, _duration);
                  } else if (_controller.isCompleted) _controller.reverse();
                },
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(90 / 360),
                  child: Image.asset(
                    'assets/more-512.webp',
                    height: 30,
                    width: 30,
                  ),
                )))
      ],
    );
  }

  Row libraryHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: Size(0, 0),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                elevation: 0,
                // shadowColor: Colors.transparent
              ),
              onPressed: goToMyHome,
              child: Image.asset(
                'assets/left-arrow-icon.jpeg',
                height: 30,
                width: 30,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(left: 100),
          child: Text(
            'My Library',
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
