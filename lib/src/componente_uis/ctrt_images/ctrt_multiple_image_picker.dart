import 'dart:typed_data';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtMultipleImagePicker extends StatefulWidget {
  final String? title;
  final Widget empty;
  final Function(CtrtFilePickerModel) onImagesChanged;
  final Function(int) onRemoveImages;

  const CtrtMultipleImagePicker({super.key, required this.empty, this.title, required this.onImagesChanged, required this.onRemoveImages});

  @override
  State<CtrtMultipleImagePicker> createState() => _CtrtMultipleImagePickerState();
}

class _CtrtMultipleImagePickerState extends State<CtrtMultipleImagePicker> {
  List<Uint8List> images = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            CtrtText.regular(text:widget.title??"Images Documents", textSize: 12.5),
            InkWell(
              child: Icon(
                Icons.add_circle_outlined,
                color: CtrtColors.primary,
                size: 35,
              ),
              onTap: () async {
                var newImage = (await CtrtFilePicker.pickImageFromGalery());
                if (newImage != null && newImage.uint8List != null) {
                  setState(() => images.add(newImage.uint8List!));
                  widget.onImagesChanged(newImage);
                }
              },
            )
          ],
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 90,
          child: images.isEmpty?  widget.empty : ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < images.length; i++)
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    color: CtrtColors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: CtrtColors.lightGrey,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: MemoryImage(images[i]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.cancel_outlined,
                      size: 30,
                      color: CtrtColors.btnError,
                    ),
                    onTap: () {
                      widget.onRemoveImages(i);
                      setState(() => images.remove(images[i]));
                    },
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
