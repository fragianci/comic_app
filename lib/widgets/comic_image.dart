import 'package:flutter/material.dart';

class ComicImage extends StatefulWidget {
  dynamic comicDetail;
  ComicImage(this.comicDetail);

  @override
  State<ComicImage> createState() {
    // TODO: implement createState
    return _ComicImageState();
  }

  // final Animation<double> animation;
}

class _ComicImageState extends State<ComicImage> {
  dynamic comicDetail;
  // late Animation<double> animation;
  // late AnimationController controller;

  _ComicImageState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller =
    //     AnimationController(duration: const Duration(seconds: 3), vsync: this);
    // animation = Tween<double>(begin: 0, end: 3000).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       print('animation');
    //     });
    //   });
    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          margin: EdgeInsets.only(top: 30),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                // width: animation.value,
                height: 220,
                child: Image.network(
                  comicDetail.imageUrl,
                  fit: BoxFit.cover,
                  alignment: AlignmentGeometry.lerp(
                      Alignment.topCenter, Alignment.center, 0.5)!,
                ),
              ))),
    );
  }
}
