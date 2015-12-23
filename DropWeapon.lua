local e={}
function e.OnAllocate()end
function e.OnInitialize()end
function e.Update()
	if (bit.band(PlayerVars.scannedButtonsDirect,PlayerPad.PRIMARY_WEAPON)==PlayerPad.PRIMARY_WEAPON)then
	
		if (Time.GetRawElapsedTimeSinceStartUp() - e.hold_pressed > 1)then

			e.hold_pressed = Time.GetRawElapsedTimeSinceStartUp()

			if (bit.band(PlayerVars.scannedButtonsDirect,PlayerPad.ZOOM_CHANGE)==PlayerPad.ZOOM_CHANGE)then
				if vars.currentInventorySlot == TppDefine.WEAPONSLOT.PRIMARY_BACK then
					Player.UnsetEquip{ slotType = PlayerSlotType.PRIMARY_2, dropPrevEquip = true,}
				elseif vars.currentInventorySlot == TppDefine.WEAPONSLOT.PRIMARY_HIP then
					Player.UnsetEquip{ slotType = PlayerSlotType.PRIMARY_1, dropPrevEquip = true,}
				end
			end
		end
	else
		e.hold_pressed = Time.GetRawElapsedTimeSinceStartUp()
	end

	if (bit.band(PlayerVars.scannedButtonsDirect,PlayerPad.DOWN)==PlayerPad.DOWN)then

		if (Time.GetRawElapsedTimeSinceStartUp() - e.hold_pressed2 > 1)then

			e.hold_pressed2 = Time.GetRawElapsedTimeSinceStartUp()

			if (bit.band(PlayerVars.scannedButtonsDirect,PlayerPad.ZOOM_CHANGE)==PlayerPad.ZOOM_CHANGE)then
				if vars.currentInventorySlot == TppDefine.WEAPONSLOT.SECONDARY then
					Player.UnsetEquip{ slotType = PlayerSlotType.SECONDARY, dropPrevEquip = true,}
				end
			end
		end
	else
		e.hold_pressed2 = Time.GetRawElapsedTimeSinceStartUp()
	end
end
function e.OnTerminate()end
return e