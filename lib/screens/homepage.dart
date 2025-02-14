import 'package:flutter/material.dart';
import 'package:heal_tether/screens/subwidgets/userlistItem.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Lists of Available Users",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
      body: Column(
        children: [
          //search button:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userProvider.searchController,
              onChanged: (query) => userProvider.searchUsers(query),
              decoration: InputDecoration(
                hintText: "Search users by name...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    //to clear input
                    userProvider.clearSearch();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              //refresh indicator widget to refresh
              onRefresh: () async {
                await userProvider.fetchUsers();
              },
              child: userProvider.isLoading
                  ? ListView.builder(
                      itemCount:
                          20, //  we Show 20 skeleton items while loading to maake sure
                      itemBuilder: (context, index) {
                        return const Skeletonizer(
                          //  enabled: userProvider.isLoading,
                          child: ListTile(
                            leading: CircleAvatar(),
                            title:
                                Text("Loading  the user name from the API..."),
                            subtitle:
                                Text("Loading  the user name from the API..."),
                          ),
                        );
                      },
                    )
                  : userProvider.errorMessage != null
                      ? Center(
                          child: Text(
                          userProvider.errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ))
                      : userProvider.users.isEmpty
                          ? const Center(child: Text("No users found."))
                          : AnimatedList(
                              initialItemCount: userProvider.users.length,
                              itemBuilder: (context, index, animation) {
                                if (index >= userProvider.users.length)
                                  return SizedBox();
                                return SlideTransition(
                                  position: animation.drive(
                                    Tween(
                                            begin: const Offset(1, 0),
                                            end: Offset.zero)
                                        .chain(CurveTween(
                                            curve: Curves.easeInOut)),
                                  ),
                                  child: UserListWidget(
                                      user: userProvider.users[index]),
                                );
                              },
                            ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          //this logic also do refresh
          userProvider.fetchUsers();
        },
        child: const Icon(
          Icons.refresh,
          fill: 1.0,
        ),
      ),
    );
  }
}
