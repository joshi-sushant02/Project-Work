import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

import 'fileUpload.dart';

class FileDownload extends StatefulWidget {
  const FileDownload({Key? key}) : super(key: key);

  @override
  State<FileDownload> createState() => _FileDownloadState();
}

class _FileDownloadState extends State<FileDownload> {
  late Future<List<FirebaseFile>> _future;
  @override
  void initState() {
    super.initState();

    _future = FirebaseApi.listAll('/files11');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("click on the item to download")),
      body: FutureBuilder<List<FirebaseFile>>(
          future: _future,
          builder: (cxt, data) {
            switch (data.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (data.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final files = data.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];

                            return buildFile(context, file);
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
          }),
    );
  }
}
