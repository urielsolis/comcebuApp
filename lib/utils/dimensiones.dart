import 'package:flutter/material.dart';

final vwidth = (BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
};

final vheight = (BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
};

final vheightSAB = (BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).padding;
  double height1 = height - padding.top - padding.bottom;
  return height1;
};

final vheightSSB = (BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).padding;
  double height2 = height - padding.top;
  return height2;
};

final vheightSSBTB = (BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).padding;
  double height3 = height - padding.top - kToolbarHeight;
  return height3;
};

final vpadding = (BuildContext context) {
  var padding = MediaQuery.of(context).padding;
  return padding;
};

final vpaddingTop = (BuildContext context) {
  var padding = MediaQuery.of(context).padding.top;
  return padding;
};

double vw(BuildContext context) {
  return vwidth(context);
}

double vh(BuildContext context) {
  return vheight(context);
}

double vhSAB(BuildContext context) {
  return vheightSAB(context);
}

double vhSSB(BuildContext context) {
  return vheightSSB(context);
}

double vhSSBTB(BuildContext context) {
  return vheightSSB(context);
}

double vp(BuildContext context) {
  return vheight(context);
}

double vpt(BuildContext context) {
  return vpaddingTop(context);
}
