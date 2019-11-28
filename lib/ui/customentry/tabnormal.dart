import 'package:flutter/material.dart';


class TabNormal extends StatefulWidget {

  TabNormal({Key key}) : super(key: key);

  @override
  _TabNormalState createState() => _TabNormalState();
}

class _TabNormalState extends State<TabNormal> {
  List _cities =
  ["Cluj-Napoca", "Bucuresti", "Timisoara", "Brasov", "Constanta"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
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
            child: Container (
                padding: EdgeInsets.all(10),
                child: Table(children: [
                  TableRow(children:[
                    Text("Inv_nm1"),
                    new DropdownButton(
                      value: _currentCity,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem,
                    ),
                    Text("Examiner Combo Here")
                  ]),
                ])
            ),),
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
  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

}
