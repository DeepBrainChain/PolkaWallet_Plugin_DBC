import 'package:flutter/material.dart';
import 'package:polkawallet_plugin_dbc/pages/governance/democracy/democracy.dart';
import 'package:polkawallet_plugin_dbc/pages/governance/democracy/proposals.dart';
import 'package:polkawallet_plugin_dbc/polkawallet_plugin_dbc.dart';
import 'package:polkawallet_plugin_dbc/utils/i18n/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/utils/i18n.dart';
import 'package:polkawallet_ui/components/topTaps.dart';
import 'package:polkawallet_ui/ui.dart';

class DemocracyPage extends StatefulWidget {
  DemocracyPage(this.plugin, this.keyring);
  final PluginDBC plugin;
  final Keyring keyring;

  static const String route = '/gov/democracy/index';

  @override
  _DemocracyPageState createState() => _DemocracyPageState();
}

class _DemocracyPageState extends State<DemocracyPage> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final dic = I18n.of(context)!.getDic(i18n_full_dic_dbc, 'gov')!;
    final tabs = [dic['democracy.referendum'], dic['democracy.proposal']];

    return Scaffold(
      body: PageWrapperWithBackground(
        SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).cardColor,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(child: Container(width: 8))
                  ],
                ),
                TopTabs(
                  names: tabs as List<String>?,
                  activeTab: _tab,
                  onTab: (v) {
                    setState(() {
                      if (_tab != v) {
                        _tab = v;
                      }
                    });
                  },
                ),
                Expanded(
                  child: _tab == 0
                      ? Democracy(widget.plugin, widget.keyring)
                      : Proposals(widget.plugin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
