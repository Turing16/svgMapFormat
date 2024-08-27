import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:svg_navmap/overlay.dart';

class InteractiveMap extends StatefulWidget {

  final String floorPlanSvg;
  // final List<OverlayItem> overlays;

  InteractiveMap({required this.floorPlanSvg});


  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {


 
  double _scale = 1.0; // Defines the zoom
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _previousOffset = Offset.zero;
  double _rotation = 0.0;
  double _previousRotation = 0.0;
  final double _minZoom = 0.5; // Minimum zoom level
  final double _maxZoom = 3.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details){
        _previousScale = _scale;
        _previousOffset = details.focalPoint - _offset;
         _previousRotation = _rotation;
      },
      onScaleUpdate: (ScaleUpdateDetails details){
        setState(() {
          // Calculate new scale
          double newScale = _previousScale * details.scale;
          // Clamp scale to min and max values
          _scale = newScale.clamp(_minZoom, _maxZoom);
          // Update rotation
          _rotation = _previousRotation + details.rotation;
          // Update offset
          _offset = details.focalPoint - _previousOffset;
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        _previousScale = 1.0;
        _previousOffset = Offset.zero;
         _previousRotation = _rotation;
      },
      child: Transform(
        transform: Matrix4.identity()
        ..translate(_offset.dx, _offset.dy)
        ..scale(_scale)
        ..rotateZ(_rotation),
        alignment: FractionalOffset.center,
        child: Stack(
          children: [
            SvgPicture.asset(widget.floorPlanSvg, fit: BoxFit.contain,)
          ],
        ),
        ),
    );
  }
}