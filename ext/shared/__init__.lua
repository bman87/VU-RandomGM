--vars.gunMasterWeaponsPreset 3

currentWeaponSet = {}

function EditGMGuns(instance)
	print('Editing Guns')
	local GMKEntData = GunMasterKillCounterEntityData(instance)
	GMKEntData:MakeWritable()

	for _, wepPreset in pairs(GMKEntData.weaponsPreset) do
	
		local GMWepPreset = GunMasterWeaponsPreset(wepPreset)
		
		for _, levelinfo in pairs(GMWepPreset.gunMasterLevelInfos) do
			local levelData = CustomizeSoldierData(levelinfo.customizeData)
			
			if (levelData.name == 'Gameplay/XP2/GM_MP12REX') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[1]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_T44') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[2]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_SPAS-12_Slugs') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[3]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_Jackhammer_Slugs') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[4]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_AK74M') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[5]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_F2000') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[6]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_G3A3') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[7]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_FAMAS') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[8]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_SCAR-L') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[9]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_AUG') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[10]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_M249') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[11]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_M60') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[12]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_QBB-95') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[13]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_MG36') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[14]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_LSAT') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[15]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_C4') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[16]))
				levelinfo.customizeData = newgun
			end
			
			if (levelData.name == 'Gameplay/XP2/GM_Knife') then
				local newgun = CustomizeSoldierData(ResourceManager:SearchForDataContainer(currentWeaponSet[17]))
				levelinfo.customizeData = newgun
			end
			
		end
		
	end
end


ResourceManager:RegisterInstanceLoadHandler(Guid('F71EE45B-1BB0-4442-A46D-5B079A722230'), Guid('F0D72AE2-9243-43D4-9070-E97B53430FB8'), EditGMGuns)
ResourceManager:RegisterInstanceLoadHandler(Guid('F58C83A7-C753-4360-A9C0-4E44C79836F8'), Guid('2D869E35-5D5F-4256-B876-C85911F0A7D6'), EditGMGuns)