import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/models/chat/chat.dart';
import 'package:provider/provider.dart';

class InputBar extends StatefulWidget {
  @override
  _InputBarState createState() => _InputBarState();

  String replyTo = '';
  final Function prepareReply;
  final scroll;
  InputBar({
    this.replyTo = '',
    this.prepareReply,
    this.scroll,
  });
}

class _InputBarState extends State<InputBar> {
  var showSendButton = false;
  final TextEditingController inputTextController = TextEditingController();

  void sendMessage(IndidualChat provider) {
    if (inputTextController.value.text.trim().length != 0) {
      provider.sendMessage(
        inputTextController.value.text,
        DateTime.now(),
      );
      inputTextController.clear();
      widget.scroll(0.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    final indidualChat = Provider.of<IndidualChat>(context);
    final spaceTakenByKeyboard = MediaQuery.of(context).viewInsets.bottom;

    return Column(
      children: [
        if (widget.replyTo.length > 0)
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 80,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 2),
                  child: Text(
                    'Reply to:',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 40, top: 2),
                        child: Text(
                          widget.replyTo,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(8),
                      onPressed: () => widget.prepareReply(''),
                      icon: Icon(
                        Icons.cancel_outlined,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {},
                color: Colors.blue,
              ),
              Expanded(
                child: TextField(
                  controller: inputTextController,
                  onChanged: (e) {
                    if (e.trim().length == 0 && showSendButton) {
                      setState(() {
                        showSendButton = false;
                      });
                    } else if (!showSendButton) {
                      setState(() {
                        showSendButton = true;
                      });
                    }
                  },
                  autofocus: widget.replyTo.isNotEmpty ? true : false,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Message',
                    hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withAlpha(200)),
                  ),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              showSendButton
                  ? IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        sendMessage(indidualChat);
                      },
                      color: Colors.blue,
                    )
                  : IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
