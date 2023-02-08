import 'package:flutter/material.dart';
import 'package:userprofile/model/userModel.dart';

import '../network/Api.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  final ApiClient _apiClient = ApiClient();
  late Future<List<UserModel>> userList;

  @override
  void initState() {
    super.initState();
    userList = _apiClient.getDataFromApi(); // Calling Api
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                "Hello ReqRes users!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<UserModel>>(
              future: userList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(child: profile(snapshot.data?[index]));
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget profile(userList) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              userList.firstName + " " + userList.lastName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(userList.email),
            SizedBox(
              height: 120,
              width: 120,
              child: Image.network(
                userList.profileUrl,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
