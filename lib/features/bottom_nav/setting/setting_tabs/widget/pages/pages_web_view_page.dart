import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting_tabs/widget/pages/pages_web_view_initial_params.dart';
import 'pages_web_view_cubit.dart';
import 'pages_web_view_state.dart';
import 'pages_web_view_state.dart';
import '/core/status_switcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PagesWebViewPage extends StatefulWidget {
  final PagesWebViewCubit cubit;
  final PagesWebViewInitialParams initialParams;

  const PagesWebViewPage({
    super.key,
    required this.cubit,
    required this.initialParams,
  });

  @override
  State<PagesWebViewPage> createState() => _PagesWebViewState();
}

class _PagesWebViewState extends State<PagesWebViewPage> {
  PagesWebViewCubit get cubit => widget.cubit;
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.initialParams.url));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.initialParams.url);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialParams.title),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
