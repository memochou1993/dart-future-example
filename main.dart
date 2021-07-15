import 'dart:async';

void main() async {
  try {
    print(await delay(3));
    print(await delayWithError(3));
  } catch (e) {
    print(e);
  }
}

Future<String> delay(int seconds) async {
  return Future.delayed(Duration(seconds: seconds), () {
    return 'done';
  });
}

Future<String> delayWithError(int seconds) async {
  var completer = new Completer<String>();
  Timer(Duration(seconds: seconds), () {
    completer.completeError('error');
  });
  return completer.future;
}

Future<String> usesAwait(Future<String> later) async {
  return await later;
}

Future<void> asyncError() async {
  throw 'Error!';
}

Future<void> asyncValue() async => 'value';
