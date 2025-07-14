import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:ui_kit/src/componente_uis/ctrt_texts/ctrt_text.dart';
import 'package:ui_kit/src/themes/ctrt_colors.dart';

class CtrtPdfViewer extends StatefulWidget {
  final String? pdfUrl, fullScreenTitle;
  final double width;
  final double height;
  final double? fullScreenTitleSize;
  final Color? uploadColor,
      saveColor,
      fullScreenAppBarColor,
      fullScreenTitleColor;
  final Function(CtrtFilePickerModel)? onPdfSaved;

  const CtrtPdfViewer({
    super.key,
    this.pdfUrl,
    this.width = 300,
    this.height = 400,
    this.onPdfSaved,
    this.saveColor,
    this.uploadColor,
    this.fullScreenTitle,
    this.fullScreenAppBarColor,
    this.fullScreenTitleColor,
    this.fullScreenTitleSize,
  });

  @override
  State<CtrtPdfViewer> createState() => _CtrtPdfViewerState();
}

class _CtrtPdfViewerState extends State<CtrtPdfViewer> {
  String? _currentPdfUrl;
  CtrtFilePickerModel? _uploadedPdfPath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialiser _currentPdfUrl ici
    _currentPdfUrl = widget.pdfUrl;
  }

  @override
  void didUpdateWidget(CtrtPdfViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Mettre à jour _currentPdfUrl si widget.pdfUrl change
    if (oldWidget.pdfUrl != widget.pdfUrl) {
      setState(() {
        _currentPdfUrl = widget.pdfUrl;
      });
    }
  }

  Future<void> _uploadNewPdf() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _uploadedPdfPath = await CtrtFilePicker.pickImageFromGalery(
        type: TypeFile.pdf,
        allowedExtensions: ['pdf'],
      );
      setState(() {});

      // Mettre à jour _currentPdfUrl avec le nouveau PDF
      // if (_uploadedPdfPath != null && _uploadedPdfPath!.path != null) {
      //   setState(() {
      //     _currentPdfUrl = _uploadedPdfPath!.path;
      //   });
      // }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showFullScreenPdf() {
    if (_currentPdfUrl == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: CtrtText.medium(
                  text: widget.fullScreenTitle ?? "PDF",
                  textSize: widget.fullScreenTitleSize ?? 15.spMin,
                  textColor: widget.fullScreenTitleColor,
                ),
                backgroundColor: widget.fullScreenAppBarColor ?? Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: widget.fullScreenTitleColor,
                    size: 30.spMin,
                  ),
                ),
              ),
              body: Container(
                color: CtrtColors.white,
                child: SfPdfViewer.network(
                  _currentPdfUrl!,
                  canShowScrollHead: true,
                  canShowScrollStatus: true,
                  enableDoubleTapZooming: true,
                ),
              ),
            ),
      ),
    );
  }

  void _savePdf() {
    if (_uploadedPdfPath != null) {
      widget.onPdfSaved?.call(_uploadedPdfPath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ne jamais appeler setState() dans build() !
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: _currentPdfUrl != null ? _showFullScreenPdf : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child:
                  _currentPdfUrl != null
                      ? SfPdfViewer.network(
                        _currentPdfUrl!,
                        canShowScrollHead: false,
                        canShowScrollStatus: false,
                        enableDoubleTapZooming: false,
                      )
                      : Container(
                        color: Colors.grey.shade100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                size: 30.spMin,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10.h),
                              CtrtText.regular(
                                text: 'Aucun PDF',
                                textSize: 10.spMin,
                              ),
                            ],
                          ),
                        ),
                      ),
            ),
          ),

          // Indicateur d'agrandissement
          if (_currentPdfUrl != null)
            Positioned(
              bottom: 10.h,
              right: 10.w,
              child: InkWell(
                onTap: _showFullScreenPdf,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 20.spMin,
                  ),
                ),
              ),
            ),

          // Boutons d'action
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.uploadColor ?? Colors.blue,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.upload_file, color: Colors.white),
                    onPressed: _isLoading ? null : _uploadNewPdf,
                    tooltip: 'Charger un PDF',
                  ),
                ),
                SizedBox(width: 10.w),
                if (_uploadedPdfPath != null)
                  Container(
                    decoration: BoxDecoration(
                      color: widget.saveColor ?? Colors.green,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.save, color: Colors.white),
                      onPressed: _savePdf,
                      tooltip: 'Enregistrer',
                    ),
                  ),
              ],
            ),
          ),

          // Indicateur de chargement
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
