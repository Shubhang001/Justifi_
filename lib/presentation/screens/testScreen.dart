import 'package:flutter/material.dart';
import 'package:jusitfi_admin/data/models/client_list_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  late ClientListModel? _clientListModel;
  @override
  void initState() {
    super.initState();
    _getClientListData();
  }

  void _getClientListData() async {
    //_clientListModel = (await ApiService().getClientList())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _clientListModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _clientListModel?.clientList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_clientListModel!.clientList[index].email
                              .toString()),
                          Text(_clientListModel!.clientList[index].firstName
                              .toString()),
                          //Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_clientListModel!.clientList[index].dob
                              .toString()),
                          Text(_clientListModel!.clientList[index].isActive
                              .toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
