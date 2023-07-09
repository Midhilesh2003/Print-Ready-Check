import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() {
  runApp(const PrinterReadinessApp());
}

class PrinterReadinessApp extends StatelessWidget {
  const PrinterReadinessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Printer Readiness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrinterReadinessScreen(),
    );
  }
}

class PrinterReadinessScreen extends StatefulWidget {
  const PrinterReadinessScreen({Key? key}) : super(key: key);

  @override
  _PrinterReadinessScreenState createState() => _PrinterReadinessScreenState();
}

class _PrinterReadinessScreenState extends State<PrinterReadinessScreen> {
  String _pdfPath = '';
  String _errorMessage = '';
  bool _isLoading = false;
  int _totalPages = 0;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pdf_flutter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Printer Readiness'),
      ),
      body: Column(
        children: [
          if (kIsWeb)
            Expanded(
              child: _pdfPath.isNotEmpty
                  ? pdf_flutter.PdfViewer.openFile(_pdfPath)
                  : const Center(
                child: Text(
                  'No PDF file selected',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          else if (_pdfPath.isNotEmpty)
            Expanded(
              child: PDFView(
                filePath: _pdfPath,
                onPageChanged: (page, total) {
                  setState(() {
                    _currentPage = page!;
                    _totalPages = total!;
                  });
                },
              ),
            )
          else if (_errorMessage.isNotEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text(
                    'No PDF file selected',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
          if (!kIsWeb)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Page ${_currentPage + 1} of $_totalPages',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _isLoading ? null : _selectPDF,
                child: const Text('Select PDF'),
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : _checkPrinterReadiness,
                child: const Text('Check Readiness'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<void> _selectPDF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _pdfPath = result.files.first.path!;
          _errorMessage = '';
        });
      }
    } catch (e) {
      setState(() {
        _pdfPath = '';
        _errorMessage = 'Error selecting PDF file: $e';
      });
    }
  }
  Future<void> _checkPrinterReadiness() async {
    // Implement readiness checks logic
  }
}
