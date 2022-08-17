import 'package:data_extractor/src/features/not_found/not_found.dart';
import 'package:fluro/fluro.dart';

class NotPageFoundHandlers {
  static Handler get notFound {
    return Handler(
      handlerFunc: (context, params) => const NotFoundPage(),
    );
  }
}
