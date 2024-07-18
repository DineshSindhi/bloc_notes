import 'package:bloc_list/event.dart';
import 'package:bloc_list/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent,ListState>{

   ListBloc():super(ListState(mData: [])) {
  on<addNotes>((event, emit) {
   var  myData=state.mData;
   myData.add({
     'title':event.title,
     'desc':event.desc,
   });
   emit(ListState(mData: myData));
  });
  on<upNotes>((event, emit) {
    var  myData=state.mData;
    myData[event.index]={
      'title':event.title,
      'desc':event.desc,
    };
    emit(ListState(mData: myData));
  });
  on<deleteNotes>((event, emit) {
    var myData=state.mData;
    myData.removeAt(event.index);
    emit(ListState(mData: myData));
  });
  }
  }
