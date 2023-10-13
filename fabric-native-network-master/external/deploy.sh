#!/usr/bin/env bash
set -eux

FABRIC_CFG_PATH=${PWD}/config
CC_NAME=${CC_NAME:="abstore"}
CC_RUNTIME_LANGUAGE=golang
VERSION=${VERSION:="1"}
CHANNEL_NAME="org1channel"

echo "### Package Chaincode ${CC_NAME}"
pushd ./external/config
tar cfz code.tar.gz connection.json
tar cfz ${CC_NAME}.tar.gz code.tar.gz metadata.json
mv ${CC_NAME}.tar.gz ../../
popd

echo "### Deploy Chaincode ${CC_NAME} to ${CHANNEL_NAME}"
peer lifecycle chaincode install ${CC_NAME}.tar.gz

peer lifecycle chaincode queryinstalled >&log.txt
cat log.txt
PACKAGE_ID=$(sed -n "/${CC_NAME}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
echo ${PACKAGE_ID} &> ccid.txt

peer lifecycle chaincode approveformyorg -o orderer.dev.com:7050 --channelID ${CHANNEL_NAME} --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --package-id ${PACKAGE_ID}
peer lifecycle chaincode checkcommitreadiness --channelID ${CHANNEL_NAME} --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

peer lifecycle chaincode commit -o orderer.dev.com:7050 --channelID ${CHANNEL_NAME} --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION}
peer lifecycle chaincode querycommitted --channelID ${CHANNEL_NAME} --name ${CC_NAME}

echo "### Finished to deploy Chaincode ${CC_NAME}"
