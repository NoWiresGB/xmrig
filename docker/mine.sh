#!/bin/sh

echo "Project:  xmrig ${MINERV}"
echo "Author:   lnxd"
echo "Base:     Ubuntu 20.04"
echo "Target:   Unraid"
echo "Donation: ${DONATE}%"
echo ""
echo "Running xmrig with the following flags:"
echo "--url=${POOL} --coin=${COIN} --user=${WALLET}.${WORKER} --randomx-wrmsr=-1 --randomx-no-rdmsr ${ADDITIONAL}"

cd /xmrig
./xmrig --url=${POOL} --coin=${COIN} --user=${WALLET}.${WORKER} --donate-level=${DONATE} --randomx-wrmsr=-1 --randomx-no-rdmsr ${ADDITIONAL}
