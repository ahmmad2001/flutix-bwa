part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(
                        userState.users.email,
                        style: TextStyle(fontSize: 20),
                      )
                    : SizedBox()),
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(
                        userState.users.name,
                        style: TextStyle(fontSize: 20),
                      )
                    : SizedBox()),
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Text(
                        userState.users.id,
                        style: TextStyle(fontSize: 20),
                      )
                    : SizedBox()),
            ElevatedButton(
                onPressed: () {
                  AuthServices.signOut();
                },
                child: Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
