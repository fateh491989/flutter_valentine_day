import 'package:flutter/material.dart';

class ForumNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      margin: EdgeInsets.only(top: 0),
      height: 200,
      width: 200,
      child: ClipPath(
        clipper: HeartClipper(),
        child: Image.network(
          'https://firebasestorage.googleapis.com/v0/b/angel-study-circle.appspot.com/o/111.jpeg?alt=media&token=a2b4c6a6-62af-43f6-bf4d-6f92c98e17ad',
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.moveTo(size.width / 2, size.height / 3.5);

    clippedPath.quadraticBezierTo(
        size.width * 0.15, size.height * 0, size.width * 0.1, size.height / 4);

    clippedPath.quadraticBezierTo(size.width * 0.2, size.height * 0.7,
        size.width / 2, size.height * 0.85);

    clippedPath.quadraticBezierTo(
        size.width * 0.8, size.height * 0.7, size.width * 0.9, size.height / 4);
    clippedPath.quadraticBezierTo(
        size.width * 0.85, size.height * 0, size.width / 2, size.height / 3.5);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CustomShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(Size(200.0, 150.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  Path getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.moveTo(size.width / 2, size.height / 3.5);

    clippedPath.quadraticBezierTo(
        size.width * 0.15, size.height * 0, size.width * 0.1, size.height / 4);

    clippedPath.quadraticBezierTo(
        size.width * 0.2, size.height * 0.7, size.width / 2, size.height);

    clippedPath.quadraticBezierTo(
        size.width * 0.8, size.height * 0.7, size.width * 0.9, size.height / 4);
    clippedPath.quadraticBezierTo(
        size.width * 0.85, size.height * 0, size.width / 2, size.height / 3.5);
//    clippedPath.moveTo(0 + distanceFromWall, 0);
//    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
//        0 + controlPointDistanceFromWall, 0, 0 + distanceFromWall);
//    clippedPath.lineTo(0, size.height - distanceFromWall);
//    clippedPath.quadraticBezierTo(
//        0 + controlPointDistanceFromWall,
//        size.height - controlPointDistanceFromWall,
//        0 + distanceFromWall,
//        size.height);
//    clippedPath.lineTo(size.width - distanceFromWall, size.height);
//    clippedPath.quadraticBezierTo(
//        size.width - controlPointDistanceFromWall,
//        size.height - controlPointDistanceFromWall,
//        size.width,
//        size.height - distanceFromWall);
//    clippedPath.lineTo(size.width, size.height * 0.6);
//    clippedPath.quadraticBezierTo(
//        size.width - 1,
//        size.height * 0.6 - distanceFromWall,
//        size.width - distanceFromWall,
//        size.height * 0.6 - distanceFromWall - 3);
//    clippedPath.lineTo(0 + distanceFromWall + 6, 0);
    clippedPath.close();
    return clippedPath;
  }
}
