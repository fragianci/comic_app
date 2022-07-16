import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopupSettings extends StatefulWidget {
  // AnimationController _controller;
  PopupSettings();

  @override
  State<PopupSettings> createState() => _PopupSettingsState();
}

class _PopupSettingsState extends State<PopupSettings> with SingleTickerProviderStateMixin{
  Duration _duration = Duration(milliseconds: 500);
  late AnimationController _controller;
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  // _PopupSettingsState();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
          elevation: 5,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () async {
            if (_controller.isDismissed)
              _controller.forward();
             else if (_controller.isCompleted)
              _controller.reverse();
          },
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            FlutterLogo(size: 500),
            SizedBox.expand(
              child: SlideTransition(
                position: _tween.animate(_controller),
                child: DraggableScrollableSheet(
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      color: Colors.blue[800],
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text('Item $index'));
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ]
        )

      )
    );
  }
}

// class PopupSettings extends StatelessWidget {
//   Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

//   PopupSettings();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox.expand(
//         child: Stack(
//           children: <Widget>[
//             FlutterLogo(size: 500),
//             SizedBox.expand(
//               child: SlideTransition(
//                 position: _tween.animate(_controller),
//                 child: DraggableScrollableSheet(
//                   builder: (BuildContext context, ScrollController scrollController) {
//                     return Container(
//                       color: Colors.blue[800],
//                       child: ListView.builder(
//                         controller: scrollController,
//                         itemCount: 25,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(title: Text('Item $index'));
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),


//     );
//   }

// }