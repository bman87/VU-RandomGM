local usedWeapons = {}

local weaponsetTypeList = {
	'pistol',
	'pistol',
	'shotgun',
	'shotgun',
	'SMG',
	'SMG',
	'rifle',
	'rifle',
	'rifle',
	'rifle',
	'LMG',
	'LMG',
	'LMG',
	'sniper',
	'sniper',
	'explosive',
	'knife'
}


local weaponsTable_pistol = {
	'Gameplay/XP2/GM_Glock17',
	'Gameplay/XP2/GM_Glock17_Silenced',
	'Gameplay/XP2/GM_Glock18',
	'Gameplay/XP2/GM_M1911',
	'Gameplay/XP2/GM_M1911_Silenced',
	'Gameplay/XP2/GM_M9',
	'Gameplay/XP2/GM_M93',
	'Gameplay/XP2/GM_M9_Silenced',
	'Gameplay/XP2/GM_MP12REX',
	'Gameplay/XP2/GM_MP443',
	'Gameplay/XP2/GM_T44'
}

local weaponsTable_smg = {
	'Gameplay/XP2/GM_M5K',
	'Gameplay/XP2/GM_MP7',
	'Gameplay/XP2/GM_P90',
	'Gameplay/XP2/GM_PDW-R',
	'Gameplay/XP2/GM_PP-19',
	'Gameplay/XP2/GM_PP-2000',
	'Gameplay/XP2/GM_UMP45'
}

local weaponsTable_shotgun = {
	'Gameplay/XP2/GM_870',
	'Gameplay/XP2/GM_DAO-12',
	'Gameplay/XP2/GM_Jackhammer',
	'Gameplay/XP2/GM_Jackhammer_Slugs',
	'Gameplay/XP2/GM_M1014',
	'Gameplay/XP2/GM_SAIGA12',
	'Gameplay/XP2/GM_SPAS-12',
	'Gameplay/XP2/GM_SPAS-12_Slugs'
}

local weaponsTable_sniper = {
	'Gameplay/XP2/GM_JNG90',
	'Gameplay/XP2/GM_L96',
	'Gameplay/XP2/GM_M40A5',
	'Gameplay/XP2/GM_M98B',
	'Gameplay/XP2/GM_MK11',
	'Gameplay/XP2/GM_QBU88',
	'Gameplay/XP2/GM_SKS',
	'Gameplay/XP2/GM_SV98',
	'Gameplay/XP2/GM_SVD',
	'Gameplay/XP2/GM_Crossbow_Bolt'
}

local weaponsTable_lmg = {
	'Gameplay/XP2/GM_L86',
	'Gameplay/XP2/GM_LSAT',
	'Gameplay/XP2/GM_M240',
	'Gameplay/XP2/GM_M249',
	'Gameplay/XP2/GM_M60',
	'Gameplay/XP2/GM_MG36',
	'Gameplay/XP2/GM_RPK74'
}

local weaponsTable_explosive = {
	'Gameplay/XP2/GM_C4',
	'Gameplay/XP2/GM_M320',
	'Gameplay/XP2/GM_M320_GL',
	'Gameplay/XP2/GM_RPG7',
	'Gameplay/XP2/GM_SMAW'
}

local weaponsTable_knife = {
	'Gameplay/XP2/GM_Knife',
	'Gameplay/XP2/GM_Knife_Razor'
}

local weaponsTable_rifle = {
	'Gameplay/XP2/GM_ACR',
	'Gameplay/XP2/GM_AK74M',
	'Gameplay/XP2/GM_AKS74u',
	'Gameplay/XP2/GM_ASVal',
	'Gameplay/XP2/GM_AUG',
	'Gameplay/XP2/GM_F2000',
	'Gameplay/XP2/GM_FAMAS',
	'Gameplay/XP2/GM_G36C',
	'Gameplay/XP2/GM_G3A3',
	'Gameplay/XP2/GM_L85',
	'Gameplay/XP2/GM_M16',
	'Gameplay/XP2/GM_M416',
	'Gameplay/XP2/GM_M417',
	'Gameplay/XP2/GM_M4A1',
	'Gameplay/XP2/GM_MTAR',
	'Gameplay/XP2/GM_QBB-95',
	'Gameplay/XP2/GM_SCAR-L'
}

function GetRandomWeapon(wepType)
	if wepType == 'pistol' then
		local value = math.random(1,#weaponsTable_pistol)
		return weaponsTable_pistol[value]
	end
	
	if wepType == 'shotgun' then
		local value = math.random(1,#weaponsTable_shotgun)
		return weaponsTable_shotgun[value]
	end
	
	if wepType == 'SMG' then
		local value = math.random(1,#weaponsTable_smg)
		return weaponsTable_smg[value]
	end
	
	if wepType == 'rifle' then
		local value = math.random(1,#weaponsTable_rifle)
		return weaponsTable_rifle[value]
	end
	
	if wepType == 'LMG' then
		local value = math.random(1,#weaponsTable_lmg)
		return weaponsTable_lmg[value]
	end
	
	if wepType == 'sniper' then
		local value = math.random(1,#weaponsTable_sniper)
		return weaponsTable_sniper[value]
	end
	
	if wepType == 'explosive' then
		local value = math.random(1,#weaponsTable_explosive)
		return weaponsTable_explosive[value]
	end
	
	if wepType == 'knife' then
		local value = math.random(1,#weaponsTable_knife)
		return weaponsTable_knife[value]
	end
end

function GenWeaponSet()
	local newWeaponSet = {}
	
	for _, wepType in pairs(weaponsetTypeList) do
		local newGun = GetRandomWeapon(wepType)
		
		while (usedWeapons[newGun] ~= nil) do
			newGun = GetRandomWeapon(wepType)
		end
		
		usedWeapons[newGun] = true
		table.insert(newWeaponSet, newGun)
	end
	
	return newWeaponSet
end


Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    usedWeapons = {}
	currentWeaponSet = {}
	currentWeaponSet = GenWeaponSet()
	
	for k, v in pairs(currentWeaponSet) do
	  print('Wep#' .. tostring(k) .. ' wep: ' .. v)
	end

end)

NetEvents:Subscribe('GMWeaponsListRequest', function(player, data)
	NetEvents:SendTo('GMWeaponsList', player, currentWeaponSet)
end)