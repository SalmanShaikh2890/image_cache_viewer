

![digitaldoor](https://user-images.githubusercontent.com/64697477/123335015-4e769080-d55d-11eb-9eac-8cc8999ad755.png)

# image_cache_viewer

A package to cache the network image with place holder and error handling

## Features
* Cache the network image in device
* Error handling if the network is not available
* Support the Place holder if the network image takes time to appear

## Preview
https://user-images.githubusercontent.com/64697477/123336101-d610cf00-d55e-11eb-9a34-9e048f85cc07.mp4

## Installation
 First depend on the library by adding this to your packages `pubspec.yaml`:

```yaml
dependencies:
  image_cache_viewer:
```

Now inside your Dart code you can import it.

```dart
import 'package:image_cache_viewer/image_cache_viewer.dart';
```
<br />

## Sample Code
```dart
ImageCacheViewer(
  "https://scontent-lga3-1.xx.fbcdn.net/v/t1.6435-9/s960x960/123168779_103125651609423_2095714573425423070_n.png?_nc_cat=109&ccb=1-3&_nc_sid=e3f864&_nc_eui2=AeHHPW9QJeXcmLnnjqVFRiSr0Umn5-hKWzPRSafn6EpbM2Ag4aB4MxWSTLXJMcUPKWgBOKFUoJddUKN2GyUauloa&_nc_ohc=nWileeYGlDAAX_7DOKr&_nc_ht=scontent-lga3-1.xx&tp=30&oh=a5492ef0e2e3d42c61e0a7de801c48b1&oe=60DAD841",
  errorWidget: Column(
    children: [Icon(Icons.error), Text("Error")],
  ),
  loadingWidget: CircularProgressIndicator(),
)
```
