import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_starter/theme/colors.dart';

import 'farmer_chat_viewmodel.dart';

class FarmerChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouteData routeData = RouteData.of(context);
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<FarmerChatViewModel>.reactive(
      viewModelBuilder: () => FarmerChatViewModel(
        farmerId: routeData.pathParams['farmerId'].intValue,
      ),
      builder: (
        BuildContext context,
        FarmerChatViewModel model,
        Widget child,
      ) {
        Size size = MediaQuery.of(context).size;

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: model.isBusy
                  ? Text('Loading...')
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(model.data.image),
                        ),
                        SizedBox(width: 10),
                        Text(
                          model.data.fullName,
                          style: TextStyle(
                            color: getColor(type: ColorType.primary),
                          ),
                        ),
                      ],
                    ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => null,
                ),
              ],
              elevation: 0,
              // backgroundColor: Colors.grey[50],
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: getColor(type: ColorType.primary),
              ),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ChatMessages(
                          model: model,
                          size: size,
                          isFarmer: false,
                          messages: ['What do you have for sale?'],
                        ),
                        ChatMessages(
                          model: model,
                          size: size,
                          isFarmer: true,
                          messages: [
                            'We have some potatoes available',
                          ],
                        ),
                        ChatMessages(
                          model: model,
                          size: size,
                          isFarmer: false,
                          messages: ['How much for per kg of potatoes'],
                        ),
                        ChatMessages(
                          model: model,
                          size: size,
                          isFarmer: true,
                          messages: ['50 per kg'],
                        ),
                        if (model.hasNewMessage)
                          ChatMessages(
                            model: model,
                            size: size,
                            isFarmer: false,
                            messages: model.newMessages,
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: UserChatInput(model: model),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class UserChatInput extends StatelessWidget {
  UserChatInput({
    Key key,
    this.model,
  }) : super(key: key);

  final FarmerChatViewModel model;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                // onChanged: (String value) => model.setMessageInput(value),
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Aa',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => model.newMessage(textEditingController.text),
            icon: Icon(
              Icons.send,
              color: getColor(type: ColorType.primary),
            ),
          )
        ],
      ),
    );
  }
}

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key key,
    @required this.size,
    @required this.model,
    @required this.messages,
    @required this.isFarmer,
  }) : super(key: key);

  final FarmerChatViewModel model;
  final bool isFarmer;
  final List<String> messages;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        // color: Colors.blue,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isFarmer) ...farmerChat() else ...userChat(),
          ],
        ),
      ),
    );
  }

  List<Widget> farmerChat() {
    return [
      CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(
          model.data.image,
        ),
      ),
      SizedBox(width: 10),
      Flexible(
        child: Container(
          margin: EdgeInsets.only(
            right: size.width * 0.40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text((size.width * 0.30).toString()),
              for (int index = 0; index < messages.length; index++)
                chatMessageItem(
                  text: messages[index],
                  color: Colors.grey[200],
                ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> userChat() {
    return [
      Flexible(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width * 0.40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                (size.width * 0.535).toString(),
                style: TextStyle(color: Colors.transparent),
              ),
              for (int index = 0; index < messages.length; index++)
                chatMessageItem(
                  text: messages[index],
                  color: getColor(
                    type: ColorType.accent,
                  ),
                ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10),
      CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(
          'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f47d4de7637290765bce495%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1398%26cropX2%3D3908%26cropY1%3D594%26cropY2%3D3102',
        ),
      ),
    ];
  }

  Container chatMessageItem({String text, Color color}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
      ),
    );
  }
}
