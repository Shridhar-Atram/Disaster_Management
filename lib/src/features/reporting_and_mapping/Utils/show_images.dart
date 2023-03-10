import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ShowImages extends StatefulWidget {
  List<Asset> imagesList;
  ShowImages({required this.imagesList});

  @override
  _ShowImagesState createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(widget.imagesList.length, (index) {
        Asset asset = widget.imagesList[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.imagesList.isEmpty
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Show Images"),
              backgroundColor: Colors.green,
            ),
            body: const Center(
              child: Text("No Images Selected"),
            ),
          )
        : ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Selected Images"),
                backgroundColor: Colors.green,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: buildGridView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
