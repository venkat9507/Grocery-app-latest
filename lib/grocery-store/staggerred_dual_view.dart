import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StaggeredDualView extends StatelessWidget {

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;

  const StaggeredDualView({Key key, this.itemBuilder, this.itemCount, this.spacing = 0.0, this.aspectRatio = 0.5, this.offsetPercent = 0.5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
      final width = constraints.maxWidth;
      final itemheight = (width * 0.5) /aspectRatio;
      final height = constraints.maxHeight + itemheight;
     return  OverflowBox(
       maxWidth: width,
        minWidth: width,
        minHeight: height,
        maxHeight:height ,
        child: GridView.builder(
          controller: ScrollController(initialScrollOffset: 50.0),
            padding: EdgeInsets.only(top: itemheight/2,bottom: itemheight,),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
            itemCount: itemCount,
            itemBuilder: (context,index){
          return Transform.translate(offset: Offset(0.0, index.isOdd ? itemheight * offsetPercent : 0.0),
          child: itemBuilder(context,index),);
        }),
      );
    },
    );
  }
}
