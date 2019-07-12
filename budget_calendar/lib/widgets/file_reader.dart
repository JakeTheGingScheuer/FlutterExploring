import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileReader{
  Future<String> get localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    String path = await localPath;
    return File(path+'/data.txt');
  }

  Future<File> writeContent() async {
    File file = await localFile;
    return file.writeAsString('writing something here');
  }

  Future<String> readContent() async {
    try {
      File file = await localFile;
      String contents = await file.readAsString();
      return contents;
    } catch(e){
      return 'Error';
    }
  }
}