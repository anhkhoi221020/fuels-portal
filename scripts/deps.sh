#!/bin/bash

# User should define here the Dependencies to link locally
# we support linking "@fuel-ui" , "@fuels-ts" , "@fuels"(fuels-npm-packs)
# LINK_FUELS=true
# LINK_FUEL_UI=true
# LINK_FUEL_TS=true

# Figure out dependencies to link
deps=""
if [ "$LINK_FUEL_TS" = true ]; then
	fuel_ts_deps="fuels"
	deps="$deps $fuel_ts_deps"
fi

if [ "$LINK_FUEL_UI" = true ]; then
	fuel_ui_deps="@fuel-ui/react @fuel-ui/css"
	deps="$deps $fuel_ui_deps"
fi

if [ "$LINK_FUELS" = true ]; then
	fuels_deps="@fuels/react-xstore @fuels/local-storage @fuels/ts-config @fuels/eslint-plugin @fuels/jest @fuels/prettier-config @fuels/tsup-config"
	deps="$deps $fuels_deps"
fi

if [ -n "$deps" ]; then
	# Link dependencies to local pnpm store
	pnpm link --global $deps &&
		pnpm -r exec pnpm link --global $deps
fi

echo "$deps"
