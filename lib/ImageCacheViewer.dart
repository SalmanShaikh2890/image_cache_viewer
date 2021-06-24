import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:image_cache_viewer/Loading.dart';

class ImageCacheViewer extends StatefulWidget {
  String url;
  Widget errorWidget,loadingWidget;

  ImageCacheViewer(this.url, {this.errorWidget,this.loadingWidget});

  @override
  _ImageCacheViewerState createState() => _ImageCacheViewerState();
}

class _ImageCacheViewerState extends State<ImageCacheViewer> {
  DefaultCacheManager cacheManager = DefaultCacheManager();
  File file;

  @override
  Widget build(BuildContext context) {
    cacheManager
        .getFile(widget.url)
        .singleWhere((element) => element.originalUrl == widget.url)
        .then((value) {
      if(mounted) {
        setState(() {
          file = value.file;
        });
      }
    });

    return file != null
        ? Image.file(file, errorBuilder: (context, object, trace) {
      return widget.errorWidget??Center(
          child: Icon(
            Icons.error,
            size: 35,
          ));
    })
        : FutureBuilder(
      // Paste your image URL inside the htt.get method as a parameter
      future: http.get(widget.url),
      builder:
          (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return widget.loadingWidget??Loading();
          case ConnectionState.done:
            cacheManager.putFile(widget.url, snapshot.data.bodyBytes);
            if (snapshot.hasError || snapshot.data.bodyBytes == null)
              return widget.errorWidget??Center(
                  child: Icon(
                    Icons.error,
                    size: 35,
                  ));
            return Image.memory(
              snapshot.data.bodyBytes,
              errorBuilder: (context, object, trace) {
                return widget.errorWidget??Center(
                    child: Icon(
                      Icons.error,
                      size: 35,
                      color: widget.url.contains("unselected")?Colors.black:Colors.white,
                    ));
              },
            );
        }
        return null; // unreachable
      },
    );
  }
}
