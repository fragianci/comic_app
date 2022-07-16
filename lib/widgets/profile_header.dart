import 'package:comic_app/widgets/popup_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileHeader extends StatefulWidget {
  final Function(AnimationController, Duration) openSettings;
  final Function() goToMyHome;
  ProfileHeader(this.openSettings, this.goToMyHome);
  @override
  State<ProfileHeader> createState() => _ProfileHeaderState(openSettings, goToMyHome);
}

class _ProfileHeaderState extends State<ProfileHeader> with SingleTickerProviderStateMixin{
  final Function(AnimationController, Duration) openSettings;
  final Function() goToMyHome;
  Duration _duration = Duration(milliseconds: 500);
  late AnimationController _controller;
  

  _ProfileHeaderState(this.openSettings, this.goToMyHome);
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 30),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: 
              ElevatedButton(
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
                )
              ),
            
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 15
                  ),
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
                onPressed: (){
                  if (_controller.isDismissed){
                    _controller.forward();
                    openSettings(_controller, _duration);
                  }
                  else if (_controller.isCompleted)
                    _controller.reverse();
                },
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(90 / 360),
                  child: Image.asset(
                    'assets/more-512.webp',
                    height: 30,
                    width: 30,
                  ),
                )
              )
            ),
          ],
        )
    );
  }
}

// class ProfileHeader extends StatelessWidget {
//   final Function() openSettings;
//   final Function() goToMyHome;
//   Duration _duration = Duration(milliseconds: 500);
//   late AnimationController _controller;


//   ProfileHeader(this.openSettings, this.goToMyHome);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only( top: 30),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: 
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   minimumSize: Size(0, 0),
//                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                   elevation: 0,
//                   // shadowColor: Colors.transparent
//                 ),
//                 onPressed: goToMyHome,
//                 child: Image.asset(
//                   'assets/left-arrow-icon.jpeg',
//                   height: 30,
//                   width: 30,
//                 )
//               ),
            
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 child: Text(
//                   'My Profile',
//                   style: TextStyle(
//                     fontSize: 15
//                   ),
//                 ),
//                 margin: const EdgeInsets.only(left: 68),
//               ),
//             ),
//             // Container(
//             //   width: 100,
//             // ),
//             Expanded(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                   minimumSize: Size(0, 0),
//                   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                   elevation: 0,
//                 ),
//                 onPressed: (){
//                   if (_controller.isDismissed){
//                     _controller.forward();
//                     openSettings();
//                   }
//                   else if (_controller.isCompleted)
//                     _controller.reverse();
//                 },
//                 child: RotationTransition(
//                   turns: const AlwaysStoppedAnimation(90 / 360),
//                   child: Image.asset(
//                     'assets/more-512.webp',
//                     height: 30,
//                     width: 30,
//                   ),
//                 )
//               )
//             ),
//           ],
//         )
//     );
//   }
// }