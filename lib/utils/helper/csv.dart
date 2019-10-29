/*
import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Csv {
  read() async {
    final File file = await StorageObservation.localFile;
    final csvCodec = new CsvCodec();
    Stream<List> inputStream = file.openRead();
    final fields = await inputStream
        .transform(utf8.decoder)
        .transform(csvCodec.decoder)
        .toList();
    print(fields);
  }

  static save(List data) async {
    final csvCodec = new CsvCodec();
    int _no = 1;
    final stream = new Stream.fromIterable([
      ['a', 'b'],
      [1, 2]
    ]);
    List<List> item = new List();
    List field;
    for (field in await StorageObservation.readData()) {
      item.add(field);
    }
    print(field.first);
    if (field.first.runtimeType == int) {
      _no = field.first;
      _no++;
    }
    data.insert(0, _no);
    item.add(data);
    final csvRowStream = stream.transform(csvCodec.encoder);
    String csv =
        const ListToCsvConverter(fieldDelimiter: ',').convert(item.toList());
    return StorageObservation.create(csv);
  }
}

var ic = false;

class StorageObservation {
  static Future create(data) async {
    final file = await localFile;
    ic = false;
    // Write the file
    await file.writeAsString('$data').then((_) => ic = true);
    return ic;
  }

  static Future readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsString();
      final csvCodec = new CsvCodec();
      Stream<List> inputStream = file.openRead();
      final fields = await inputStream
          .transform(utf8.decoder)
          .transform(csvCodec.decoder)
          .toList();

      return fields;
    } catch (e) {
      return [];
    }
  }

  static Future<String> get localPath async {
    await createDir();
    final dir = await getExternalStorageDirectory();
    return dir.path + "/Sc";
  }

  static Future<File> get localFile async {
    final path = await localPath;
    File file = File('$path/portofolio.csv');
    if (!file.existsSync()) {
      await createFile();
      file.writeAsString("No,Kecerdasan,Pertanyaan,enjoy,easy,excellent,earn");
    }
    return file;
  }

  static createDir() async {
//  PermissionStatus res = await SimplePermissions.requestPermission(
//      Permission.WriteExternalStorage);
    Directory baseDir = await getExternalStorageDirectory();
    String dirToBeCreated = "Sc";
    String finalDir = join(baseDir.path, dirToBeCreated);
    var dir = Directory(finalDir);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      dir.create();
    }
  }

  static createFile() async {
//    PermissionStatus res = await SimplePermissions.requestPermission(
//        Permission.WriteExternalStorage);
//    print(res);
    Directory baseDir = await getExternalStorageDirectory();
    String fileName = "portofolio.csv";
    String finalDir = join(baseDir.path + '/Sc/', fileName);
    var dir = new File(finalDir);
    dir.create();
  }
}
*/
