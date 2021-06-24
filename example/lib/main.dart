import 'package:flutter/material.dart';
import 'package:image_cache_viewer/image_cache_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImageViewer(),
    );
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Cache Viewer",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.5),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(8),
            child: ImageCacheViewer(
              "https://scontent-lga3-1.xx.fbcdn.net/v/t1.6435-9/s960x960/123168779_103125651609423_2095714573425423070_n.png?_nc_cat=109&ccb=1-3&_nc_sid=e3f864&_nc_eui2=AeHHPW9QJeXcmLnnjqVFRiSr0Umn5-hKWzPRSafn6EpbM2Ag4aB4MxWSTLXJMcUPKWgBOKFUoJddUKN2GyUauloa&_nc_ohc=nWileeYGlDAAX_7DOKr&_nc_ht=scontent-lga3-1.xx&tp=30&oh=a5492ef0e2e3d42c61e0a7de801c48b1&oe=60DAD841",
              errorWidget: Column(
                children: [Icon(Icons.error), Text("Error")],
              ),
              loadingWidget: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
