import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/presentation/bloc/fact_bloc.dart';

class FactScreen extends StatefulWidget {
  const FactScreen({Key? key}) : super(key: key);

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  _getStatus(state)
              ],
            ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<FactBloc>().add(GetFactEvent());

            },
            child: Icon(Icons.download),

          ),
        );
      },
    );
  }
}

Widget _getStatus(FactState state){
  if(state is FactInitial){
    return Center(child: Text("waiting for loading"),);
  }
  else if(state is FactLoading){
    return Center(child: CircularProgressIndicator(),);
  }
  else if(state is FactFailed){
    return Center(child: Text(state.message.toString()??"error"),);
  }
  else if(state is FactLoaded){
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: state.facts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              trailing: Text(
                "${state.facts[index].sId}",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text("List item $index"));
        });
  }
  else{
    return Center(child: Text("just nothing!"),);
  }
}