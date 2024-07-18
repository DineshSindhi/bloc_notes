import 'package:bloc_list/event.dart';
import 'package:bloc_list/secondPage.dart';
import 'package:bloc_list/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc List'),
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder<ListBloc,ListState>(
        builder: (_,state){
          return ListView.builder(
            itemCount: state.mData.length,
            itemBuilder: (context, index) {

            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(isUpdate: true,index: index,),));
              },
              title: Text(state.mData[index]['title']),
              subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.mData[index]['desc']),
                  InkWell(
                    onTap: (){
                      context.read<ListBloc>().add(deleteNotes(index: index));
                    },
                      child: Icon(Icons.delete,color: Colors.orange,))
                ],
              ),
            );
          },);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}