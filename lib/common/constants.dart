import 'package:flutter/material.dart';

const int SECONDS_OF_DAY = 24 * 60 * 60; // seconds of one day
const int SECONDS_OF_YEAR = 365 * 24 * 60 * 60; // seconds of one year

const node_list_dbc = [
  {
    'name': 'DBC (DeepBrainChain Mainnet, hosted by DBC Team)',
    'ss58': 42,
    'endpoint': 'wss://info.dbcwallet.io',
  },
];

const home_nav_items = ['staking', 'governance'];

const MaterialColor dbc_black = const MaterialColor(
  0xFF222222,
  const <int, Color>{
    50: const Color(0xFF555555),
    100: const Color(0xFF444444),
    200: const Color(0xFF444444),
    300: const Color(0xFF333333),
    400: const Color(0xFF333333),
    500: const Color(0xFF222222),
    600: const Color(0xFF111111),
    700: const Color(0xFF111111),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

const String genesis_hash_dbc =
    "0xd523fa2e0581f069b4f0c7b5944c21e9abc72305a08067868c91b898d1bf1dff";
const String network_name_dbc = 'dbc';
