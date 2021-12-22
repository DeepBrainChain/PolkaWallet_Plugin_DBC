import 'package:polkawallet_plugin_dbc/store/accounts.dart';
import 'package:polkawallet_plugin_dbc/store/cache/storeCache.dart';
import 'package:polkawallet_plugin_dbc/store/gov/governance.dart';
import 'package:polkawallet_plugin_dbc/store/staking/staking.dart';

class PluginStore {
  PluginStore(StoreCache cache)
      : staking = StakingStore(cache),
        gov = GovernanceStore(cache);
  final StakingStore staking;
  final GovernanceStore gov;
  final AccountsStore accounts = AccountsStore();
}
