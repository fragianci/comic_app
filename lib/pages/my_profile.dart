import 'package:comic_app/model/models.dart';
import 'package:comic_app/widgets/profile_header.dart';
import 'package:comic_app/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyProfile extends StatefulWidget {
  final Function() goToMyHome;
  const MyProfile(this.goToMyHome);

  @override
  State<MyProfile> createState() => _MyProfileState(goToMyHome);
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  final Function() goToMyHome;
  bool settingsOpened = false;
  late AnimationController _controller;
  late Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  final List<ButtonSettingsData> buttonsSettings = [
    ButtonSettingsData(
      title: 'Privacy',
      label: 'Private data',
      icon: Icons.lock,
    ),
    ButtonSettingsData(
        title: 'Address',
        label: 'Address data',
        icon: Icons.location_on_outlined),
  ];
  _MyProfileState(this.goToMyHome);

  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ProfileHeader(openSettings, goToMyHome),
            UserInfo(),
            settings()
          ],
        ),
      ),
    );
  }

  Expanded settings() {
    return Expanded(
      child: SizedBox.expand(
        child: Stack(children: <Widget>[
          SizedBox.expand(
            child: SlideTransition(
              position: _tween.animate(_controller),
              child: DraggableScrollableSheet(
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 0,
                    height: 566,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 255, 149, 100),
                          Color.fromARGB(255, 247, 103, 103),
                        ],
                      ),
                    ),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: buttonsSettings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: 50,
                            child: buttonSetting(buttonsSettings[index]));
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Container buttonSetting(buttonSettings) {
    return Container(
      width: 0,
      margin: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.transparent,
          minimumSize: Size(0, 80),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onPressed: () {
          print(buttonSettings.title);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 149, 100),
                    Color.fromARGB(255, 247, 103, 103),
                  ],
                ),
              ),
              child: Icon(
                buttonSettings.icon,
                color: Colors.white,
                size: 23.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  Text(
                    buttonSettings.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    buttonSettings.label,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
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
