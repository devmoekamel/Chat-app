import 'package:bloc/bloc.dart';
import 'package:chatapp/model/messagemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  void sendMessage({required String message, required String email}) {
    try {
      messages
          .add({"message": message, "CreatedAt": DateTime.now(), 'id': email});
    } on Exception catch (e) {
      //code
    }
  }
  void Readmessage(){
    messages.orderBy('CreatedAt',descending:true).snapshots().listen((event) { 
      print("success");
      List<MessageModel>messagelist  =[];
      print(event.docs);
      for(var doc in event.docs){

        messagelist.add(MessageModel.fromFirestore(doc));

      }

      emit(ChatSuccess(messagelist:messagelist));
    });
  }
}
