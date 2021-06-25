part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GotoSplashPage)) {
        prevPageEvent = GotoSplashPage();
        context.bloc<PagesBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GotoMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GotoMainPage();
        context.bloc<PagesBloc>().add(GotoMainPage());
      }
    }

    return BlocBuilder<PagesBloc, PagesState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : MainPage());
  }
}
