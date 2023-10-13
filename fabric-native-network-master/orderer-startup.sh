echo "######orderer startup start######"
echo "current path: $(pwd)"
echo "remove data/orderer"
rm -rf ./data/orderer
export FABRIC_CFG_PATH=$(pwd)/config/
export RDERER_HOST=orderer1.ordererorg1
export ORDERER_GENERAL_LOGLEVEL=DEBUG
export ORDERER_GENERAL_TLS_ENABLED=false
export ORDERER_GENERAL_TLS_PRIVATEKEY=$(pwd)/config/crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE=$(pwd)/config/crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/server.crt
export ORDERER_GENERAL_TLS_ROOTCAS=[$(pwd)/config/crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/ca.crt]
export ORDERER_GENERAL_ROOTCAS=[$(pwd)/config/crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/ca.crt]

export ORDERER_GENERAL_PROFILE_ENABLED=false
export ORDERER_GENERAL_LISTENADDRESS=0.0.0.0
export ORDERER_GENERAL_LISTENPORT=7050
export ORDERER_GENERAL_GENESISMETHOD=file
export ORDERER_GENERAL_GENESISFILE=$(pwd)/channel-artifacts/genesis.block

export ORDERER_GENERAL_LOCALMSPDIR=$(pwd)/config/crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/msp
export ORDERER_GENERAL_LOCALMSPID=ordererorg1msp
export ORDERER_FILELEDGER_LOCATION=$(pwd)/data/orderer

export ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE=crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/server.crt
export ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY=crypto-config/ordererOrganizations/ordererorg1/orderers/orderer1.ordererorg1/tls/server.key
export ORDERER_GENERAL_CLUSTER_ROOTCAS=crypto-config/ordererOrganizations/ordererorg1/ca/ca.ordererorg1-cert.pem

/Users/chenziang/go/src/github.com/hyperledger/Fabric_EMVCC-master/build/bin/orderer

