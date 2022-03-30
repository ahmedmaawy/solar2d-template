--
-- For more information on config.lua see the Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--

application =
{
	content =
	{
		width = 640,
		height = 1152, 
		scale = "letterbox",
        xAlign = "center",  -- Possible values are "left", "center", or "right"
		yAlign = "center",  -- Possible values are "top", "center", or "bottom"
		fps = 60,
		
		imageSuffix =
		{
			    ["@2x"] = 2,
			    ["@4x"] = 4,
		},
	},
}
