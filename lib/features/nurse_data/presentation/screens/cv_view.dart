import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/features/nurse_data/presentation/manager/cv_manager.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class CvView extends StatefulWidget {
  const CvView({super.key, required this.resumeUrl});
  final String resumeUrl;

  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  // String localPath = "";
  // bool isResumeValid = true;
  // @override
  // void initState() {
  //   super.initState();
  //   downLoadPdf();
  // }
  //
  // void downLoadPdf() async {
  //   try {
  //     final Dio dio = Dio();
  //     var dir = await getTemporaryDirectory();
  //     String tempPath = '${dir.path}/temp.pdf'; // Set temporary file path
  //     await dio.download(widget.resumeUrl, tempPath);
  //     if (mounted) {
  //       setState(() {
  //         localPath = tempPath;
  //       });
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       setState(() {
  //         isResumeValid = false;
  //       });
  //     }
  //     debugPrint(e.toString());
  //   }
  // }

  CvManager cvManager = CvManager();

  @override
  void initState() {
    cvManager.downloadPdf(resumeUrl: widget.resumeUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(S.of(context).view_resume),
        ),
        body: ListenableBuilder(
            listenable: cvManager,
            builder: (context, child) => cvManager.isValidResume
                ? cvManager.localPath.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : PDFView(
                        filePath: cvManager.localPath,
                      )
                : const NoResultWidget()));
  }
}
