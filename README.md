### Node


```bash
./sidechain.sh install-node --name MyName --database my_db --token MyToken --symbol MT
./sidechain.sh start-node --name MyName
```

#### Optional Parameters

    --path - Path to install Side Chain 
    --name - Name of Side Chain 
    --database - Database Name 
    --token - Token Name [MINE]
    --symbol - Symbol for Token [M]
    --prefix - Address Prefix [M]
    --forgers - How many forgers for the network [51]
    --max-votes - Max Votes per Wallet [1]
    --blocktime - Time per block (seconds) [8]
    --transactions-per-block - Max Transaciton count per Block [50]
    --reward-height-start - Block Height when Forgers receive Rewards [75600]
    --reward-per-block - How many Rewarded Tokens per Forged Block [200000000 (2)]
    --skip-deps - Skips check for installing dependencies

*Note: Below Parameters do not work with standard wallets (with hardcoded values)*

    --fee-send - Fee for sending Transaction [10000000 (0.1)]
    --fee-vote - Fee for Vote Transaction [100000000 (1)]
    --fee-second-passphrase - Fee for Second Passphrase Transaction [500000000 (5)]
    --fee-delegate - Fee for Register Delegate Transaction [2500000000 (25)]
    --fee-multisig - Fee for Multisignature Transaction [500000000 (5)]
    --update-epoch - Set Epoch based on time the chain was created

Node API: `http://127.0.0.1:14100/api/`

## Credits

- [Alex Barnsley]
- [Brian Faust]
- [Léo Pechin]
