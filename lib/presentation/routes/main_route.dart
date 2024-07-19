import 'package:flutter/material.dart';
import 'package:flutter_homework/presentation/router/routes.dart';
import 'package:flutter_homework/presentation//widgets/app_back_button.dart';
import 'package:go_router/go_router.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("NetGlade's Flutter homework"),
          leading: AppBackButton(),
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '''
For the details of the take-home task,
read README.md file in the root of the repository.
''',
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(RoutesInfo.charactersRouteInfo);
                  },
                  child: Text('to characters'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('coming soon'),
                ),
                Expanded(child: Container()),
                Text('You can follow @netglade on Twitter.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
