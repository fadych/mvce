import 'package:flutter/material.dart';
import 'package:mvce/controller/provider/user_details_provider.dart';
import 'package:mvce/global_widget/loading_widget/loading_widget.dart';
import 'package:provider/provider.dart';

class UsersDetailsPage extends StatefulWidget {
  const UsersDetailsPage({Key? key}) : super(key: key);

  @override
  State<UsersDetailsPage> createState() => _UsersDetailsPageState();
}

class _UsersDetailsPageState extends State<UsersDetailsPage> {
  @override
  void initState() {
    getAllUsersMethod();
    super.initState();
  }

  getAllUsersMethod() async {
    var usersDetailsProvider =
        Provider.of<UsersDetailsProvider>(context, listen: false);
    await Future.delayed(Duration.zero, () {
      usersDetailsProvider.getListOfusersFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Consumer<UsersDetailsProvider>(
                  builder: (context, usersDetailsProvider, _) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: usersDetailsProvider.listOfUsers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(usersDetailsProvider
                                  .listOfUsers[index].id!
                                  .toString()),
                            ),
                            title: Text(usersDetailsProvider
                                .listOfUsers[index].lastName!),
                          ),
                          ElevatedButton(
                            child: Text('submit'),
                            onPressed: () {
                              usersDetailsProvider.handleSubmitButton(
                                  usersDetailsProvider.counter);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.center,
              child: Consumer<UsersDetailsProvider>(
                  builder: (context, usersDetailsProvider, _) {
                return usersDetailsProvider.isLoading
                    ? LoadingWidget()
                    : SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
