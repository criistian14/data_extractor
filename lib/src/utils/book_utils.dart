import 'dart:typed_data';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class BookUtils {
  List<String> extractParagraphs(
    PdfDocument document,
    int startPage,
    int endPage,
  ) {
    // Extracts the text from all the pages
    final text = PdfTextExtractor(document).extractTextLines(
      startPageIndex: startPage - 1,
      endPageIndex: endPage - 1,
    );

    final paragraphs = <String>[];
    String paragraph = '';

    for (int i = 0; i < text.length; i++) {
      final line = text[i];

      for (int j = 0; j < line.wordCollection.length; j++) {
        final word = line.wordCollection[j];
        final isLastWord = j == line.wordCollection.length - 1;

        if (isLastWord) {
          paragraph += word.text;
          continue;
        }
        final nextWord = line.wordCollection[j + 1];

        if (j == 0) {
          paragraph += word.text;
          continue;
        }

        if ((nextWord.bounds.left - word.bounds.right) > 2) {
          paragraph += '${word.text} ';
        } else {
          paragraph += word.text;
        }
      }

      if (i == text.length - 1) {
        paragraphs.add(paragraph);
        break;
      }

      if (text[i + 1].bounds.top - line.bounds.top < -1) {
        paragraphs.add(paragraph);
        paragraph = '';
        continue;
      }

      if ((text[i + 1].bounds.top - line.bounds.top) < 20) {
        paragraph += ' ';
        continue;
      }

      paragraphs.add(paragraph);
      paragraph = '';
    }

    return paragraphs;
  }

  Uint8List? extractImage(
    PdfDocument document,
    int startPage,
    int endPage,
  ) {
    return null;
  }
}
