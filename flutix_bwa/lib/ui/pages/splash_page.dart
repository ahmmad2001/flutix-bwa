part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                'New Experiece',
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              'Watch a new movie much \n easier than any before',
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 19),
              child: ElevatedButton(
                  onPressed: () {
                    context.bloc<PagesBloc>().add(GotoLoginPage());
                  },
                  child: Text(
                    'Get Started',
                    style: whiteTextFont,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.deepPurple)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account ?',
                  style: greyTextFont,
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    context.bloc<PagesBloc>().add(GotoLoginPage());
                  },
                  child: Text(
                    'Sign in',
                    style: purpleTextFont,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
