import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/src/pdf/page_format.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Printing Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format, widget.title),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final bool test = true;

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Demo Printing",
                      style: pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text(
                      "Day 29/9/66",
                      style: pw.TextStyle(fontSize: 20),
                    ),
                  ]),
              pw.SizedBox(height: 20),
              pw.FlutterLogo(),
              pw.SizedBox(height: 20),
              pw.Row(
                children: [
                  pw.Text(
                    "asdasdaslkdlasdsad",
                    style: pw.TextStyle(fontSize: 20),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Text(
                  "sadsadasd",
                  style: pw.TextStyle(fontSize: 20),
                ),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Text(
                  "dsgsdfsdf",
                  style: pw.TextStyle(fontSize: 20),
                ),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Text(
                  "sdgsdfsdfds",
                  style: pw.TextStyle(fontSize: 20),
                ),
              ]),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Text(
                  "dsfdsfdsfdsfdsf",
                  style: pw.TextStyle(fontSize: 20),
                ),
              ]),
              pw.Padding(
                padding: pw.EdgeInsets.all(8.0),
                child: pw.Table(
                  children: [
                    pw.TableRow(children: [
                      pw.Text(
                        "Education",
                        textScaleFactor: 1.5,
                      ),
                      pw.Text("Institution name", textScaleFactor: 1.5),
                      pw.Text("University", textScaleFactor: 1.5),
                    ]),
                    pw.TableRow(children: [
                      pw.Text("B.Tech", textScaleFactor: 1.5),
                      pw.Text("ABESEC", textScaleFactor: 1.5),
                      pw.Text("AKTU", textScaleFactor: 1.5),
                    ]),
                    pw.TableRow(children: [
                      pw.Text("12th", textScaleFactor: 1.5),
                      pw.Text("Delhi Public School", textScaleFactor: 1.5),
                      pw.Text("CBSE", textScaleFactor: 1.5),
                    ]),
                    pw.TableRow(children: [
                      pw.Text("High School", textScaleFactor: 1.5),
                      pw.Text("SFS", textScaleFactor: 1.5),
                      pw.Text("ICSE", textScaleFactor: 1.5),
                    ]),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
