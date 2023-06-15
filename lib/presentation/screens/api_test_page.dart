import 'package:flutter/material.dart';
import '../../data/models/client_list_model.dart';
import '../../data/repositories/services/services.dart';

class ApiTestPage extends StatefulWidget {
  const ApiTestPage({Key? key}) : super(key: key);

  @override
  State<ApiTestPage> createState() => _ApiTestPageState();
}

class _ApiTestPageState extends State<ApiTestPage> {
  late ClientListModel? _clientListModel =
      ClientListModel(count: 1, clientList: []);
  @override
  void initState() {
    _getClientListData();
    super.initState();
  }

  void _getClientListData() async {
    _clientListModel = (await ApiService()
        .getClientList("token ade415e97e21baaec60aa049f00086e2b566e830"));
    print(_clientListModel!.clientList
        .length); //token {{ade415e97e21baaec60aa049f00086e2b566e830}}
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
              itemCount: _clientListModel!.clientList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                        child: ColoredBox(color: Colors.red),
                      ),
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
