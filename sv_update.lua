if not EnsureResourceName("b_advancedweaponsystem") then return end

AddEventHandler('onResourceStart', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	lib.versionCheck('xBandoz/b_advancedweaponsystem')
end)
