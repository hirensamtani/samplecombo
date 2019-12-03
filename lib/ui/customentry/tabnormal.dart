import 'package:flutter/material.dart';


class TabNormal extends StatefulWidget {

  TabNormal({Key key}) : super(key: key);

  @override
  _TabNormalState createState() => _TabNormalState();
}

class _TabNormalState extends State<TabNormal> {
  List _appraiserNameList =
  ["Appraiser1", "Appraiser2", "Appraiser3", "Appraiser4", "Appraiser5"];

  List _appraiserValueList =
  ["AppVal1", "AppVal2", "AppVal3", "AppVal4", "AppVal5"];

  List<DropdownMenuItem<String>> _appraiserDropDownMenuItems;
  String _currentAppraiser;


  List _examinerNameList =
  ["Examiner1", "Examiner2", "Examiner3", "Examiner4", "Examiner5"];

  List _examinerValueList =
  ["ExaminerVal1", "ExaminerVal2", "ExaminerVal3", "ExaminerVal4", "ExaminerVal5"];

  List<DropdownMenuItem<String>> _examinerDropDownMenuItems;
  String _currentExaminer;


  @override
  void initState() {
    // TODO: implement initState
    _appraiserDropDownMenuItems = getAppraiserDropDownMenuItems();
    _currentAppraiser = _appraiserDropDownMenuItems[0].value;

    _examinerDropDownMenuItems = getExaminerDropDownMenuItems();
    _currentExaminer = _examinerDropDownMenuItems[0].value;

    super.initState();
  }
  List<DropdownMenuItem<String>> getAppraiserDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for(int i=0;i<_appraiserNameList.length;i++) {
      items.add(new DropdownMenuItem(
          value: _appraiserValueList[i],
          child: new Text(_appraiserNameList[i])
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getExaminerDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for(int i=0;i<_examinerNameList.length;i++) {
      items.add(new DropdownMenuItem(
          value: _examinerValueList[i],
          child: new Text(_examinerNameList[i])
      ));
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    return new Container (
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container (
              padding: EdgeInsets.all(10),
              child: Table(children: [
                TableRow(children: [
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Inv_nm'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Appraiser'),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Examiner'),
                        ),
                      ],
                    ),
                  ),
                ]),
              ])
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: new ConstrainedBox(
              constraints: new BoxConstraints(),
              child: Container (
                  padding: EdgeInsets.all(10),
                  child: Table(children: [
                    TableRow(children:[
                      Text("Inv_nm1"),
                      new DropdownButton(
                        value: _currentAppraiser,
                        items: _appraiserDropDownMenuItems,
                        onChanged: changedAppraiserDropDownItem,
                      ),
                      new DropdownButton(
                        value: _currentExaminer,
                        items: _examinerDropDownMenuItems,
                        onChanged: changedExaminerDropDownItem,
                      ),
                    ]),

                  ])
              ),
            ),
          ),
          Expanded (
            child:  Align (
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(80.0))
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: const Text(
                              'Save',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),),

        ],
      ),

    );
  }
  void changedAppraiserDropDownItem(String selectedAppraiser) {
    setState(() {
      _currentAppraiser = selectedAppraiser;
      // print("hbs _selVal ${_currentAppraiser}");
    });
  }
  void changedExaminerDropDownItem(String selectedExaminer) {
    setState(() {
      _currentExaminer = selectedExaminer;
      // print("hbs _selVal ${_currentAppraiser}");
    });
  }

}
