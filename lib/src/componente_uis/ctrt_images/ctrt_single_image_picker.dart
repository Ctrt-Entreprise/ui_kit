import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtSingleImagePicker extends StatefulWidget {
  final double width, height;
  final Function(CtrtFilePickerModel) getImage;
  final String? imageUrl;
  final String? baseUrlImage;
  const CtrtSingleImagePicker({
    super.key,
    required this.width,
    required this.height,
    required this.getImage,
    this.baseUrlImage,
    this.imageUrl,
  });

  @override
  State<CtrtSingleImagePicker> createState() => _CtrtSingleImagePickerState();
}

class _CtrtSingleImagePickerState extends State<CtrtSingleImagePicker> {
  Uint8List? images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var newImage = (await CtrtFilePicker.pickImageFromGalery());
        if (newImage != null) {
          widget.getImage(newImage);
          setState(() => images = newImage.uint8List);
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: CtrtColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: CtrtColors.lightGrey, width: 2),
          image: images != null
          ? DecorationImage(
            image: MemoryImage(images!),
            fit: BoxFit.fill,
          ) :null,
        ),
        child: images == null && widget.imageUrl != null && widget.baseUrlImage != null ?
        ImageNetwork(
          onTap: () async {
            var newImage = (await CtrtFilePicker.pickImageFromGalery());
            if (newImage != null) {
              widget.getImage(newImage);
              setState(() => images = newImage.uint8List);
            }
          },
          image: '${widget.baseUrlImage??""}/${widget.imageUrl??""}',
          height: widget.height,
          width: widget.width,
          onLoading: CircularProgressIndicator(),
          onError: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.error),
              if(kDebugMode)
                Text('${widget.baseUrlImage??""}/${widget.imageUrl??""}')
            ],
          ),
        ) 
        : Center(child: Icon(Icons.photo)),
      ),
    );
  }
}
