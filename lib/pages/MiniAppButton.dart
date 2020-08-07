import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/models/MainAppProvider.dart';

class MiniAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainAppProvider appProvider = Provider.of(context);

    return appProvider.prevAppService == null
        ? Container()
        : FloatingActionButton(
            heroTag: appProvider.prevAppService.title,
            onPressed: () async {
              String path = appProvider.prevAppService.path;
              appProvider.prevAppService = null;
              await Navigator.pushNamed(
                context,
                path,
              );
              appProvider.prevAppService = appProvider.appService;
            },
            child: Icon(appProvider.prevAppService.icon),
          );
  }
}
