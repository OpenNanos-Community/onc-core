-- ONC Core HUD
ONC.BaseHUD = WebUI("ONC_Core HUD", "file:///UI/index.html")

Package.Subscribe("Load", function()
	Input.SetMouseEnabled(false)
	Input.SetInputEnabled(true)
end)