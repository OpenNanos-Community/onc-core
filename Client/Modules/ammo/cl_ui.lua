Character.Subscribe("PickUp", function(self, object)
	print(object:IsA(Weapon))
    if object:IsA(Weapon) then
        print("picked up weapon")
        ONC.BaseHUD:CallEvent("ONC::ShowAmmo", true)
        ONC.BaseHUD:CallEvent("ONC::UpdateAmmo", object:GetAmmoClip(), object:GetAmmoBag())

        object:Subscribe("Fire", function(weapon)
            ONC.BaseHUD:CallEvent("ONC::UpdateAmmo", weapon:GetAmmoClip(), weapon:GetAmmoBag())
        end)

		object:Subscribe("Reload", function(weapon)
			ONC.BaseHUD:CallEvent("ONC::UpdateAmmo", weapon:GetAmmoClip(), weapon:GetAmmoBag())
		end)

		object:Subscribe("AmmoBagChange", function(weapon)
			ONC.BaseHUD:CallEvent("ONC::UpdateAmmo", weapon:GetAmmoClip(), weapon:GetAmmoBag())
		end)

		object:Subscribe("AmmoClipChange", function(weapon)
			ONC.BaseHUD:CallEvent("ONC::UpdateAmmo", weapon:GetAmmoClip(), weapon:GetAmmoBag())
		end)
    end
end)

Character.Subscribe("Drop", function(self, object)
    if object:IsA(Weapon) then
        print("dropped weapon")
        ONC.BaseHUD:CallEvent("ONC::ShowAmmo", false)
    end
end)