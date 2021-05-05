// import 'dart:io';
// import 'package:path/path.dart';

// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';

// class PostMediaBody {
//   final File file;
//   final String code;
//   final int template;

//   PostMediaBody({
//     @required this.file,
//     @required this.code,
//     this.template = 1,
//   });

//   Future<FormData> toApi() async {
//     final FormData formData = FormData.fromMap({
//       'file': await MultipartFile.fromFile(
//         file.path,
//         filename: "$code${extension(file.path)}",
//       ),
//       'code': code,
//       'template': template,
//     });
//     print(formData.fields);
//     return formData;
//   }
// }
