


import 'package:flutter/material.dart';

class OverlayItem{
    final Offset position;
    final Widget Function() buildOverlay;


    OverlayItem(this.position, this.buildOverlay);

}