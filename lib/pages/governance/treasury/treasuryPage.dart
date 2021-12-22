import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:polkawallet_plugin_dbc/pages/governance/treasury/spendProposals.dart';
import 'package:polkawallet_plugin_dbc/pages/governance/treasury/tips.dart';
import 'package:polkawallet_plugin_dbc/polkawallet_plugin_dbc.dart';
import 'package:polkawallet_plugin_dbc/utils/i18n/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/utils/i18n.dart';
import 'package:polkawallet_ui/components/topTaps.dart';
import 'package:polkawallet_ui/ui.dart';

class TreasuryPage extends StatefulWidget {
  TreasuryPage(this.plugin, this.keyring);
  final PluginDBC plugin;
  final Keyring keyring;

  static const String route = '/gov/treasury/index';

  @override
  _TreasuryPageState createState() => _TreasuryPageState();
}

class _TreasuryPageState extends State<TreasuryPage> {
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      widget.plugin.service.gov.queryCouncilInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    var dic = I18n.of(context)!.getDic(i18n_full_dic_dbc, 'gov')!;
    var tabs = [dic['treasury'], dic['treasury.tip']];
    return Scaffold(
      body: PageWrapperWithBackground(SafeArea(
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
              Observer(
                builder: (_) {
                  return Expanded(
                    child: widget.plugin.store.gov.council.members == null
                        ? CupertinoActivityIndicator()
                        : _tab == 0
                            ? SpendProposals(widget.plugin, widget.keyring)
                            : MoneyTips(widget.plugin, widget.keyring),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
