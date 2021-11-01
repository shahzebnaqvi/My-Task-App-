import 'package:flutter/material.dart';

class stat extends StatefulWidget {
  const stat({Key? key}) : super(key: key);

  @override
  _statState createState() => _statState();
}

class _statState extends State<stat> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();

  var gettext = "";
  var gettext1 = "";
  var lst = [];
  var lst1 = [
    "aadjdjjdjdjs",
    "sdsd12AS",
    "ass",
    "Sasas",
    "aas",
    "AS",
    "ass",
    "Sasas",
    "aas",
    "AS",
    "ass",
    "Sasas"
  ];
  submit() {
    setState(() {
      if (gettext != "") {
        lst.add(gettext);
        print(lst);
      }
    });
  }

  delete() {
    setState(() {
      if (gettext != "") {
        lst.remove(gettext);
        print(lst);
      }
    });
  }

  update() {
    setState(() {
      if (gettext != "") {
        var ind = lst.indexOf(gettext);
        lst.replaceRange(ind, ind + 1, [gettext1]);

        print(lst);
        // str1.replaceAll(gettext, "ddsd");
        // String str1 = "Hello World";
        // str1.replaceAll('World', 'ALL');
        // print(lst);
      }
    });
  }

  erase() {
    gettext = "";
  }

  erase1() {
    gettext1 = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: Center(child: Text("Task TODO")),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      gettext = value;
                    },
                    controller: txt,
                    decoration: const InputDecoration(hintText: 'Enter a Task'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[500],
                            ),
                            onPressed: () {
                              submit();
                              txt.clear();
                              erase();
                            },
                            icon: Icon(Icons.add),
                            label: Text("Add")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[500],
                          ),
                          onPressed: () {
                            delete();
                            txt.clear();
                            erase();
                          },
                          icon: Icon(Icons.add),
                          label: Text("Delete")),
                      //update button
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[500],
                          ),
                          onPressed: () {
                            if (gettext != "") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.green[100],
                                    title: Text(
                                      "Update Value",
                                      style:
                                          TextStyle(color: Colors.green[500]),
                                    ),
                                    content: TextField(
                                      onChanged: (value) {
                                        gettext1 = value;
                                      },
                                      controller: txt1,
                                      decoration: const InputDecoration(
                                          hintText: 'Enter updated value'),
                                    ),
                                    actions: [
                                      ElevatedButton.icon(
                                          onPressed: () {
                                            update();
                                            txt.clear();
                                            txt1.clear();
                                            erase();
                                            erase1();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.green[500],
                                          ),
                                          icon: Icon(Icons.check),
                                          label: Text("Update It"))
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: Icon(Icons.add),
                          label: Text("Update")),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: lst.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, right: 10, left: 10),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: Colors.green[500],
                            boxShadow: [
                              // to make elevation
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                              // to make the coloured border
                            ],
                          ),
                          child: Center(
                            child: Text(
                              lst[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
