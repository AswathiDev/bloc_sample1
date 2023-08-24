import 'dart:async';

enum CounterAction { Increament, Decrement, Reset }

class CounterBloc {

 late int counter;
  final stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => stateStreamController.sink;
  Stream<int> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventStreamController.sink;
  Stream<CounterAction> get eventStream => eventStreamController.stream;

  CounterBloc() {
    counter=0;
    //Whenever a counter class is created ,we are going to listen for changes in the eventstream

    eventStream.listen((event) {
      if (event == CounterAction.Increament) {
             print('adding');

        counter ++;
      } else if (event == CounterAction.Decrement) {
        // if(counter>0){
        counter --;

        // }
      } else if (event == CounterAction.Reset) {
        counter = 0;
      }
//from the stream end of event controller we are passing the output of  event controller to state stream controller as input 
//we are passing the counter here this will be return to the textfield
       counterSink.add(counter);
    });
   
   
  }
}
