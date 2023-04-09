E_ASSET_MANAGER_PATH=$ELEMENTUM_PATH"/general/e-asset-manager"

cd $E_ASSET_MANAGER_PATH

if [ $E_ASSET_MANAGER_ENV = "local" ] 
then
    dfx canister create e_asset_manager; >/dev/null
fi

echo $(dfx canister id e_asset_manager);

dfx build --network $E_ASSET_MANAGER_ENV e_asset_manager; >/dev/null

if [ $INSTALL_MODE = "none" ]
then
    dfx canister install --network $E_ASSET_MANAGER_ENV e_asset_manager --argument '(
        record { 
            admins = vec {
                principal "'$ADMINS_PRINCIPAL_0'";
                principal "'$ADMINS_PRINCIPAL_1'";
                principal "'$TURN_MANAGER_PRINCIPAL_0'"
            }
        }
    )' >/dev/null
else
    dfx canister install --mode $INSTALL_MODE --network $E_ASSET_MANAGER_ENV e_asset_manager --argument '(
        record { 
            admins = vec {
                principal "'$ADMINS_PRINCIPAL_0'";
                principal "'$ADMINS_PRINCIPAL_1'";
                principal "'$TURN_MANAGER_PRINCIPAL_0'"
            }
        }
    )' >/dev/null
fi

if [ $INSTALL_MODE = "none" ] || [ $INSTALL_MODE = "reinstall" ]
then
    ./loader.sh >/dev/null
fi

dfx generate e_asset_manager >/dev/null