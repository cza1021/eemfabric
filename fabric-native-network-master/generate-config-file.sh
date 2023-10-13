echo "######generate config file start######"
echo "current path: $(pwd)"
echo "remove crypto-config"
rm -rf ./config/crypto-config

/Users/chenziang/go/src/github.com/hyperledger/Fabric_EMVCC-master/build/bin/cryptogen generate --config=./config/cryptogen/crypto-config.yaml --output=./config/crypto-config
echo "remove channel-artifacts"
rm -rf ./channel-artifacts
export FABRIC_CFG_PATH=$(pwd)/config/
/Users/chenziang/go/src/github.com/hyperledger/Fabric_EMVCC-master/build/bin/configtxgen -profile genesis  -channelID system-channel -outputBlock ./channel-artifacts/genesis.block
/Users/chenziang/go/src/github.com/hyperledger/Fabric_EMVCC-master/build/bin/configtxgen -profile accelerator -outputCreateChannelTx ./channel-artifacts/accelerator.tx -channelID accelerator
/Users/chenziang/go/src/github.com/hyperledger/Fabric_EMVCC-master/build/bin/configtxgen -profile accelerator  -outputAnchorPeersUpdate ./channel-artifacts/accelerator-anchor.tx -channelID  accelerator -asOrg peerorg1msp

echo "######generate config file over######"