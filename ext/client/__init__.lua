NetEvents:Subscribe('GMWeaponsList', function(data)
	currentWeaponSet = nil
	currentWeaponSet = data
	print('Got new GM weapon list')
end)

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    NetEvents:Send('GMWeaponsListRequest', true)
end)

