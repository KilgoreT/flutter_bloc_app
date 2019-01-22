
import 'dart:async';

Stream<int> createFromScratch(Duration interval, [int maxCount]) async* {
  int i = 1;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

Stream<int> createFromController(Duration interval, [int maxCount]) {
  StreamController<int> controller;
  Timer timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter);
    if (counter == 7) controller.addError(new Error());
    if (maxCount != null && counter >= maxCount) {
      timer.cancel();
      controller.close();
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  controller = StreamController<int>(
   onListen: startTimer,
   onPause: stopTimer,
   onResume: startTimer,
   onCancel: stopTimer);

  return controller.stream;
}

void main() {

  /*createFromScratch(new Duration(seconds: 1))
       .listen((i) {
         print(i);
       });*/

 /*  createFromController(new Duration(seconds: 1), 18)
     .listen(print);*/
   someStream(createFromController(new Duration(seconds: 1), 99));
}

Future<int> someStream(Stream<int> stream) async {
  try {
    await for (var value in stream) {
      print(value);
    }
  } catch (e) {
    print(e.toString());
  }
}