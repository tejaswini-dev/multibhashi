import 'package:flutter/material.dart';
import 'package:flutter_app_multibashi/main.dart';

class InteractiveImageViewScreen extends StatelessWidget {
  final String imageURL;

  const InteractiveImageViewScreen({Key key, this.imageURL}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: EdgeInsets.all(50),
        minScale: 1.5,
        maxScale: 3,
        child: Image.network(
          imageURL ?? '',
          fit: BoxFit.fill,
//          height: screenUtil.screenHeight,
//          width: screenUtil.screenWidth,
          filterQuality: FilterQuality.low,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
//              height: screenUtil.screenHeight ,
//              width: screenUtil.screenWidth,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage(
                      'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
//              height: screenUtil.screenHeight ,
//              width: screenUtil.screenWidth,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage(
                      'https://wtwp.com/wp-content/uploads/2015/06/placeholder-image.png'),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
