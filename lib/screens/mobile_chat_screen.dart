import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/chat/widgets/bottom_chat_field.dart';
import 'package:whatsapp_ui/models/user_model.dart';
import 'package:whatsapp_ui/widgets/brand_colors.dart';
import 'package:whatsapp_ui/features/chat/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName="mobileChatScreen";
  const MobileChatScreen({Key? key,required this.uid,required this.name}) : super(key: key);

  final String name;
  final String uid;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
          stream: ref.read(authControllerProvider).userDataById(uid),
          builder:(context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Loader();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(snapshot.data!.isOnline?"online":"offline",style: myStyle(14,Colors.white70,FontWeight.w400),),

              ],
            );
          }) ,



        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
            Expanded(
            child: ChatList(receiverUserId: uid),
          ),
          BottomChatField(
            isGroupChat:false ,
            recieverUserId: uid,
          )
        ],
      ),
    );
  }
}
