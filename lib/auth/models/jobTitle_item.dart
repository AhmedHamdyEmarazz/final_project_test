import 'package:flutter/material.dart';

class JobtiteItem extends StatefulWidget {
  final String pic;
  final String text;

  const JobtiteItem({required this.pic, required this.text, super.key});

  @override
  State<JobtiteItem> createState() => _JobtiteItemState();
}

bool press = false;

class _JobtiteItemState extends State<JobtiteItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final size = MediaQuery.of(context).size;
    const appbarheight = kToolbarHeight;
    return InkWell(
      onTap: () {
        setState(() {
          press = !press;
        });
        print(widget.text);
      },
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          // height: size.height * 0.17,
          // width: size.width * 33,
          decoration: BoxDecoration(
            border: Border.all(color: press ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
            color: press ? Colors.blue.shade100 : Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                    backgroundColor: press ? Colors.blue : Colors.white,
                    radius: 20,
                    backgroundImage: AssetImage(widget.pic) as ImageProvider),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3),
                child: Text(widget.text),
              )
            ],
          )),
    );
  }
}
