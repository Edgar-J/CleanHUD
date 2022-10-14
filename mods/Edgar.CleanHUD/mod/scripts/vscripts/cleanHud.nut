global function customHudInit
#if CLIENT

// SETTINGS
//===============================================================================================================================================================================================================================
struct	// health counter
{
	// text color & transparency
	vector color = Vector(1.0, 1.0, 1.0)				// RGB format where (1 = 255) and (0 = 0)
	vector lowHpColor = Vector(0.427, 0.058, 0.050)		// Colour when on low health
	float  alpha = 1.0 									// transparency

	// size and position
	vector position = Vector(0.327, 0.666, 0.0)			// X: 0 = right edge, 1 = left edge  |  Y: 0 = top edge, 1 = bottom edge  |  Z: dont change it
	float fontSize = 100.0								// change size of text
	float thickness = 0.75								// change thickness (default = 0)

    float lowHpPercent = 33                           // at what health percentage the number changes color
	var healthNumRui
}health

struct	// ammo counter
{
	// text color & transparency
	vector color = Vector(1.0, 1.0, 1.0)				// RGB format where (1 = 255) and (0 = 0)
	vector lowAmmocolor = Vector(1.0, 1.0, 0.0)			// Colour when ammo is low
	float  alpha = 1.0 									// transparency

	// size and position
	vector position = Vector(0.6, 0.666, 0.0)			// X: 0 = right edge, 1 = left edge  |  Y: 0 = top edge, 1 = bottom edge  |  Z: dont change it
	float fontSize = 100.0								// change size of text
	float thickness = 0.75								// change thickness (default = 0)

    float lowAmmoPercent = 33                           // at what ammo percentage the number changes color
	var ammoNumRui
}ammo

struct	// boost counter
{
	// text color & transparency
	vector color = Vector(1.0, 1.0, 1.0)				// RGB format where (1 = 255) and (0 = 0)
	float  alpha = 1.0 									// transparency

	// size and position
	vector position = Vector(0.489, 0.82, 0.0)			// X: 0 = right edge, 1 = left edge  |  Y: 0 = top edge, 1 = bottom edge  |  Z: dont change it
	float fontSize = 70.0								// change size of text
	float thickness = 0.60								// change thickness (default = 0)

	var boostNumRui
}boost

struct	// grenade bars
{
	// size & position  (1 segment)
	float xTransform = 0		// skew horizontaly
	float yTransform = 0		// skew verticaly
    float xPos = 33 		    // 0 = centre  |  -100 = left edge  |  100 = right edge
    float yPos = 45		        // 0 = centre  |  -50  = top edge   |  50  = bottom edge
    float barHeight = 0.02		// 1 = full screen height | 0.1 = 10% of screen height
    float barWidth = 0.15	    // 1 = full screen width  | 0.1 = 10% of screen width
	float bg_barWidth = 0.145   // smaller so edges dont stick out

	// size & position  (2 segments)
	float smallBar1xPos = 25.5
	float smallBar2xPos = 40.5
	float smallBarWidth = 0.0675
	float bg_smallBarWidth = 0.063

	// colors: RGB format where (1 = 255) and (0 = 0)
	vector chargeColor = Vector(0.5, 0.5, 0.5)					// color while charging
	vector fullChargeColor = Vector(0.1, 0.2, 0.3)				// color when ready to use
	vector bg_color  = Vector(0.0, 0.0, 0.0)					// background bar colour
	float  alpha = 1.0
	float  chargeAlpha = 0.5
    float  bg_alpha = 0.5

	// toplologies and ruis
	var bar1Topo
	var bar2Topo
	var bg_bar1Topo
	var bg_bar2Topo
	var bar1Rui
	var bar2Rui
	var bg_bar1Rui
	var bg_bar2Rui
}grenade

struct // ability bars
{
	// size & position  (1 segment)
	float xTransform = 0		// skew horizontaly
	float yTransform = 0		// skew verticaly
    float xPos = -33 		    // 0 = centre  |  -100 = left edge  |  100 = right edge
    float yPos = 45		        // 0 = centre  |  -50  = top edge   |  50  = bottom edge
    float barHeight = 0.02     	// 1 = full screen height | 0.1 = 10% of screen height
    float barWidth = 0.15	    // 1 = full screen width  | 0.1 = 10% of screen width
	float bg_barWidth = 0.145	// smaller so edges dont stick out

	// size & position  (2 segments)
	float smallBar1xPos = -40.5
	float smallBar2xPos = -25.5
	float smallBarWidth = 0.0675
	float bg_smallBarWidth = 0.063

	// colors: RGB format where (1 = 255) and (0 = 0)
	vector chargeColor = Vector(0.5, 0.5, 0.5)			// color while charging
	vector fullChargeColor = Vector(1.0, 1.0, 1.0)		// color when ready to use
	vector bg_color  = Vector(0.0, 0.0, 0.0)			// background bar colour
	float  alpha = 1.0 									// transparency
	float  chargeAlpha = 0.5 							// transparency
    float  bg_alpha = 0.5 								// transparency

	// toplologies and ruis
	var bar1Topo
	var bar2Topo
	var bg_bar1Topo
	var bg_bar2Topo
	var bar1Rui
	var bar2Rui
	var bg_bar1Rui
	var bg_bar2Rui
}ability

struct // boost/titan meter
{
	// size & position
	float xTransform = 0		// skew horizontaly
	float yTransform = 0		// skew verticaly
    float xPos = 0 		    	// 0 = centre  |  -100 = left edge  |  100 = right edge
    float yPos = 55		        // 0 = centre  |  negative values = up   |  positive values = down
    float barHeight = 0.02     	// 1 = full screen height | 0.1 = 10% of screen height
    float barWidth = 0.1	    // 1 = full screen width  | 0.1 = 10% of screen width
	float bg_barWidth = 0.093	// smaller so edges dont stick out

	float markerXpos = -10
    float markerYpos = 55
    float markerHeight = 0.0275
    float markerWidth = 0.0025

	// colors: RGB format where (1 = 255) and (0 = 0)
	vector bar1Color = Vector(0.052, 0.187, 0.528)
	vector bar2Color = Vector(0.9, 0.35, 0.05)
	vector fullChargeColor = Vector(0.9, 0.35, 0.05)		// color when ready to use
	vector bg_color  = Vector(0.0, 0.0, 0.0)				// background bar colour
	float  alpha = 1.0
	float  chargeAlpha = 1.0
    float  bg_alpha = 0.5
	vector markerColor = Vector(1.0, 1.0, 1.0)

	// toplologies and ruis
	var bar1Topo
	var bg_bar1Topo
	var bar1Rui
	var bg_bar1Rui
	var bar2Topo
	var bar2Rui
	var markerTopo
	var markerRui
}earnMeter

struct	// colors
{
	// grenades
	vector frag = Vector(0.306, 1.0, 0.035)
    vector arc = Vector(0.2, 0.2, 1.0)
    vector firestar = Vector(1.0, 0.35, 0.05)
    vector gravstar = Vector(0.1, 0.1, 0.3)
    vector eSmoke = Vector(0.6, 0.4, 0.0)
    vector satchel = Vector(0.1, 0.3, 0.1)

	// abilites
	vector cloak = Vector(0.4, 0.075, 0.09)
    vector pulse = Vector(1.0, 0.75, 0.15)
    vector grapple = Vector(0.05, 0.4, 0.5)
    vector stim = Vector(0.4, 0.5, 0.05)
    vector aWall = Vector(0.5, 0.04, 0.01)
    vector phase = Vector(0.0, 0.35, 0.25)
    vector holo = Vector(0.1, 0.2, 0.3)
}barColors

void function AddCallbacks()
{
	AddCallback_PlayerClassChanged(OnPlayerClassChanged)
}


void function customHudInit()
{
	health.healthNumRui = InitTextRui(health.position, "000", health.fontSize, health.alpha, health.thickness, health.color)
	ammo.ammoNumRui   = InitTextRui(ammo.position, "000", ammo.fontSize, ammo.alpha, ammo.thickness, ammo.color)
	boost.boostNumRui   = InitTextRui(boost.position, "", boost.fontSize, 0, boost.thickness, boost.color)

	// grenade bar (create topology then use it to create the rui)
	grenade.bar1Topo    = CreateRuiTopo(grenade.xPos, grenade.yPos, grenade.yTransform, grenade.xTransform, grenade.barWidth, grenade.barHeight)
	grenade.bg_bar1Topo = CreateRuiTopo(grenade.xPos, grenade.yPos, grenade.yTransform, grenade.xTransform, grenade.bg_barWidth, grenade.barHeight)
	grenade.bar2Topo    = CreateRuiTopo(grenade.smallBar2xPos, grenade.yPos, grenade.yTransform, grenade.xTransform, grenade.smallBarWidth, grenade.barHeight)
	grenade.bg_bar2Topo = CreateRuiTopo(grenade.smallBar2xPos, grenade.yPos, grenade.yTransform, grenade.xTransform, grenade.bg_smallBarWidth, grenade.barHeight)

	grenade.bar1Rui    = RuiCreate( $"ui/basic_image.rpak", grenade.bar1Topo, RUI_DRAW_COCKPIT, 1)
	grenade.bar2Rui    = RuiCreate( $"ui/basic_image.rpak", grenade.bar2Topo, RUI_DRAW_COCKPIT, 1)
	grenade.bg_bar1Rui = RuiCreate( $"ui/basic_image.rpak", grenade.bg_bar1Topo, RUI_DRAW_COCKPIT, 0)
	grenade.bg_bar2Rui = RuiCreate( $"ui/basic_image.rpak", grenade.bg_bar2Topo, RUI_DRAW_COCKPIT, 0)
	InitImageRui(grenade.bar1Rui, grenade.bar2Rui, grenade.bg_bar1Rui, grenade.bg_bar2Rui, grenade.chargeColor, grenade.bg_color, grenade.alpha, grenade.bg_alpha)

	// ability bar
	ability.bar1Topo    = CreateRuiTopo(ability.xPos, ability.yPos, ability.yTransform, ability.xTransform, ability.barWidth, ability.barHeight)
	ability.bg_bar1Topo = CreateRuiTopo(ability.xPos, ability.yPos, ability.yTransform, ability.xTransform, ability.bg_barWidth, ability.barHeight)
	ability.bar2Topo    = CreateRuiTopo(ability.smallBar2xPos, ability.yPos, ability.yTransform, ability.xTransform, ability.smallBarWidth, ability.barHeight)
	ability.bg_bar2Topo = CreateRuiTopo(ability.smallBar2xPos, ability.yPos, ability.yTransform, ability.xTransform, ability.bg_smallBarWidth, ability.barHeight)

	ability.bar1Rui    = RuiCreate( $"ui/basic_image.rpak", ability.bar1Topo, RUI_DRAW_COCKPIT, 1)
	ability.bar2Rui    = RuiCreate( $"ui/basic_image.rpak", ability.bar2Topo, RUI_DRAW_COCKPIT, 1)
	ability.bg_bar1Rui = RuiCreate( $"ui/basic_image.rpak", ability.bg_bar1Topo, RUI_DRAW_COCKPIT, 0)
	ability.bg_bar2Rui = RuiCreate( $"ui/basic_image.rpak", ability.bg_bar2Topo, RUI_DRAW_COCKPIT, 0)
	InitImageRui(ability.bar1Rui, ability.bar2Rui, ability.bg_bar1Rui, ability.bg_bar2Rui, ability.chargeColor, ability.bg_color, ability.alpha, ability.bg_alpha)

	// boost/titan meter
	earnMeter.bar1Topo = CreateRuiTopo(earnMeter.xPos, earnMeter.yPos, earnMeter.yTransform, earnMeter.xTransform, earnMeter.barWidth, earnMeter.barHeight)
	earnMeter.bar1Rui  = RuiCreate( $"ui/basic_image.rpak", earnMeter.bar1Topo, RUI_DRAW_COCKPIT, 2)
	InitEarnMeterRui(earnMeter.bar1Rui, earnMeter.bar1Color, 0)

	earnMeter.bg_bar1Topo = CreateRuiTopo(earnMeter.xPos, earnMeter.yPos, earnMeter.yTransform, earnMeter.xTransform, earnMeter.bg_barWidth, earnMeter.barHeight)
	earnMeter.bg_bar1Rui  = RuiCreate( $"ui/basic_image.rpak", earnMeter.bg_bar1Topo, RUI_DRAW_COCKPIT, 0)
	InitEarnMeterRui(earnMeter.bg_bar1Rui, earnMeter.bg_color, 0)

	earnMeter.bar2Topo = CreateRuiTopo(earnMeter.xPos, earnMeter.yPos, earnMeter.yTransform, earnMeter.xTransform, earnMeter.barWidth, earnMeter.barHeight)
	earnMeter.bar2Rui  = RuiCreate( $"ui/basic_image.rpak", earnMeter.bar2Topo, RUI_DRAW_COCKPIT, 1)
	InitEarnMeterRui(earnMeter.bar2Rui, earnMeter.bar2Color, 0)

	earnMeter.markerTopo = CreateRuiTopo(earnMeter.markerXpos, earnMeter.markerYpos, earnMeter.yTransform, earnMeter.xTransform, earnMeter.markerWidth, earnMeter.markerHeight)
	earnMeter.markerRui  = RuiCreate( $"ui/basic_image.rpak", earnMeter.markerTopo, RUI_DRAW_COCKPIT, 3)
	InitEarnMeterRui(earnMeter.markerRui, earnMeter.markerColor, 0)

	AddCallbacks()
    thread Update()
}


// UPDATE
//===============================================================================================================================================================================================================================
void function Update()
{
	WaitFrame()

	while(true)
	{
		WaitFrame()
		if(!IsLobby() && !IsMenuLevel() && !IsWatchingKillReplay())
		{
			entity player = GetLocalClientPlayer()
			if (player.GetPlayerClass() == "pilot")
			{
				entity activeWeapon = player.GetActiveWeapon()
				entity grenade = player.GetOffhandWeapon(0)
				entity ability = player.GetOffhandWeapon(1)

				UpdateHealthNum(player, health.healthNumRui)
				UpdateAmmoNum(player, activeWeapon, ammo.ammoNumRui)
				UpdateGrenadeBar(grenade)
				UpdateAbilityBar(player, ability)

				if(player.GetPlayerNetFloat((EARNMETER_REWARDFRAC)) > 0)
				{
					UpdateEarnMeter(player, boost.boostNumRui)
				}
			}
		}
 	}
}


// MAIN FUNCTIONS
//===============================================================================================================================================================================================================================
void function UpdateHealthNum(entity player, var healthRui)
{
	if(GetHealthFrac(player) <= 0.33)
	{
		RuiSetFloat3(healthRui, "msgColor", health.lowHpColor)	// change colour when bellow 33 health
	}
	else
	{
		RuiSetFloat3(healthRui, "msgColor", health.color)		// set back to main color
	}

	RuiSetString(healthRui, "msgText", player.GetHealth().tostring())
}

void function UpdateAmmoNum(entity player, entity weapon, var ammoRui)
{
	if(IsValid(weapon))
	{
		foreach(entity ent in player.GetOffhandWeapons())
		{
			if(weapon == ent)
			{
				return
			}
		}

		float currAmmo = float(weapon.GetWeaponPrimaryClipCount())
		float maxAmmo = float(weapon.GetWeaponPrimaryClipCountMax())

		// set number
		RuiSetString(ammoRui, "msgText", currAmmo.tostring())
		if(maxAmmo <= 1) // for showing stockpile ammo for single shot antititan weapons
		{
			RuiSetString(ammoRui, "msgText", weapon.GetWeaponPrimaryAmmoCount().tostring())
		}

		// set color
		float percentLeft = (currAmmo / maxAmmo) * 100
		if(percentLeft <= 40)
		{
			RuiSetFloat3(ammoRui, "msgColor", ammo.lowAmmocolor)		// change colour when bellow 40% ammo
		}
		else
		{
			RuiSetFloat3(ammoRui, "msgColor", ammo.color)			// set back to main color
		}
	}


}

void function UpdateGrenadeBar(entity grenadeEnt)
{
	if(IsValid(grenadeEnt))
	{
		vector color = SelectBarColor(grenadeEnt)
		float chargePercent = grenadeEnt.GetWeaponPrimaryClipCount().tofloat() / grenadeEnt.GetWeaponPrimaryClipCountMax().tofloat()

		if(grenadeEnt.GetWeaponClassName() == "mp_weapon_frag_grenade" || grenadeEnt.GetWeaponClassName() == "mp_weapon_satchel")	// two use nades
		{
			SwitchBarMode(grenade.bg_bar1Topo, grenade.bar2Rui, grenade.bg_bar2Rui,
			grenade.bg_smallBarWidth, grenade.barHeight, grenade.smallBar1xPos, grenade.yPos, grenade.alpha, grenade.bg_alpha)

			float bar1Percent = min((chargePercent * 2), 1)
			float bar2Percent = max((chargePercent - 0.5) * 2, 0)
			UpdateBar(grenade.bar1Topo, grenade.bar1Rui, bar1Percent, grenade.smallBarWidth, grenade.barHeight, grenade.smallBar1xPos, grenade.yPos, grenade.chargeColor, color, grenade.chargeAlpha)
			UpdateBar(grenade.bar2Topo, grenade.bar2Rui, bar2Percent, grenade.smallBarWidth, grenade.barHeight, grenade.smallBar2xPos, grenade.yPos, grenade.chargeColor, color, grenade.chargeAlpha)
		}
		else
		{
			SwitchBarMode(grenade.bg_bar1Topo, grenade.bar2Rui, grenade.bg_bar2Rui,
			grenade.bg_barWidth, grenade.barHeight, grenade.xPos, grenade.yPos, 0, 0)

			UpdateBar(grenade.bar1Topo, grenade.bar1Rui, chargePercent, grenade.barWidth, grenade.barHeight, grenade.xPos, grenade.yPos, grenade.chargeColor, color, grenade.chargeAlpha)
		}
	}
}

void function UpdateAbilityBar(entity player, entity abilityEnt)
{
	if (IsValid(abilityEnt))
	{
		vector color = SelectBarColor(abilityEnt)
		float chargePercent = abilityEnt.GetWeaponPrimaryClipCount().tofloat() / abilityEnt.GetWeaponPrimaryClipCountMax().tofloat()

		if(abilityEnt.GetWeaponClassName() == "mp_ability_grapple" || abilityEnt.GetWeaponClassName() == "mp_ability_holopilot")
		{
			SwitchBarMode(ability.bg_bar1Topo, ability.bar2Rui, ability.bg_bar2Rui,
			ability.bg_smallBarWidth, ability.barHeight, ability.smallBar1xPos, ability.yPos, ability.alpha, ability.bg_alpha)

			if(abilityEnt.GetWeaponClassName() == "mp_ability_grapple")
			{
				chargePercent = player.GetSuitGrapplePower() * 0.01
			}
			float bar1Percent = min((chargePercent * 2), 1)
			float bar2Percent = max((chargePercent - 0.5) * 2, 0)
			UpdateBar(ability.bar1Topo, ability.bar1Rui, bar1Percent, ability.smallBarWidth, ability.barHeight, ability.smallBar1xPos, ability.yPos, ability.chargeColor, color, ability.chargeAlpha)
			UpdateBar(ability.bar2Topo, ability.bar2Rui, bar2Percent, ability.smallBarWidth, ability.barHeight, ability.smallBar2xPos, ability.yPos, ability.chargeColor, color, ability.chargeAlpha)
		}
		else
		{
			SwitchBarMode(ability.bg_bar1Topo, ability.bar2Rui, ability.bg_bar2Rui,
			ability.bg_barWidth, ability.barHeight, ability.xPos, ability.yPos, 0, 0)

			UpdateBar(ability.bar1Topo, ability.bar1Rui, chargePercent, ability.barWidth, ability.barHeight, ability.xPos, ability.yPos, ability.chargeColor, color, ability.chargeAlpha)
		}
	}
}

void function UpdateEarnMeter(entity player, var boostRui)
{
	if (IsValid(player))
	{
		float chargePercent1 = player.GetPlayerNetFloat(EARNMETER_OWNEDFRAC)		// blue bar
		float chargePercent2 = player.GetPlayerNetFloat(EARNMETER_EARNEDFRAC)		// yellow bar
		float rewardPercent = player.GetPlayerNetFloat(EARNMETER_REWARDFRAC)		// percent needed to get a boost use

		UpdateBar(earnMeter.bar1Topo, earnMeter.bar1Rui, chargePercent1, earnMeter.barWidth, earnMeter.barHeight, earnMeter.xPos, earnMeter.yPos, earnMeter.bar1Color, earnMeter.fullChargeColor, earnMeter.chargeAlpha)
		UpdateBar(earnMeter.bar2Topo, earnMeter.bar2Rui, chargePercent2, earnMeter.barWidth, earnMeter.barHeight, earnMeter.xPos, earnMeter.yPos, earnMeter.bar2Color, earnMeter.fullChargeColor, earnMeter.chargeAlpha)

		// boost number
		int boostNum = player.GetPlayerNetInt("itemInventoryCount")	// number of uses
		RuiSetString(boostRui, "msgText", boostNum.tostring())
		if(boostNum < 1)
		{
			RuiSetString(boostRui, "msgText","".tostring())				// hide number, if 0 uses
		}

		// offset the bar's horizontal position
		float offset = rewardPercent * 20
		MoveTopo(earnMeter.markerTopo, (earnMeter.markerXpos + offset), earnMeter.markerYpos)	// adjust marker's position according to the equiped boost
	}
}



// INITIALISATION FUNCTIONS
//===============================================================================================================================================================================================================================
var function InitTextRui(vector position, string text, float fontSize, float alpha, float thickness, vector color)
{
	var rui = RuiCreate($"ui/cockpit_console_text_top_left.rpak", clGlobal.topoCockpitHudPermanent, RUI_DRAW_COCKPIT, 0)
	RuiSetInt   (rui, "maxLines",    1)
	RuiSetInt   (rui, "lineNum",     1)
	RuiSetFloat2(rui, "msgPos",      position)
	RuiSetString(rui, "msgText",     text)
	RuiSetFloat (rui, "msgFontSize", fontSize)
	RuiSetFloat (rui, "msgAlpha",    alpha)
	RuiSetFloat (rui, "thicken",     thickness)
	RuiSetFloat3(rui, "msgColor",    color)

	return rui
}

void function InitImageRui(var bar1Rui, var bar2Rui, var bg_bar1Rui, var bg_bar2Rui, vector color, vector bg_color, float alpha, float bg_alpha)
{
	RuiSetFloat3(bar1Rui, "basicImageColor", color)
	RuiSetFloat (bar1Rui, "basicImageAlpha", alpha)
	RuiSetFloat3(bar2Rui, "basicImageColor", color)
	RuiSetFloat (bar2Rui, "basicImageAlpha", alpha)

	RuiSetFloat3(bg_bar1Rui, "basicImageColor", bg_color)
	RuiSetFloat (bg_bar1Rui, "basicImageAlpha", bg_alpha)
	RuiSetFloat3(bg_bar2Rui, "basicImageColor", bg_color)
	RuiSetFloat (bg_bar2Rui, "basicImageAlpha", bg_alpha)
}

void function InitEarnMeterRui(var bar1Rui, vector color, float alpha)
{
	RuiSetFloat3(bar1Rui, "basicImageColor", color)
	RuiSetFloat (bar1Rui, "basicImageAlpha", alpha)
}

var function CreateRuiTopo(float xPos, float yPos, float xTransform, float yTransform, float barWidth, float barHeight)
{
    var topo = RuiTopology_CreateSphere
    (
        COCKPIT_RUI_OFFSET - <0, xPos, yPos>, // POSITION | in screen, left/right, up/down
        <0, -1, yTransform>, // ?, ?, left side down right side up
        <0, xTransform, -1>, // ?, bottom left top right, ?
        COCKPIT_RUI_RADIUS,
        COCKPIT_RUI_WIDTH * barWidth,
        COCKPIT_RUI_HEIGHT * barHeight,
        3.5 // 3.5
    )

    return topo
}

// UTILITY FUNCTIONS
//===============================================================================================================================================================================================================================
void function ScaleTopo(var topo, float width, float heigth)
{
	RuiTopology_UpdateSphereArcs(topo,
		(COCKPIT_RUI_WIDTH   * width),
		(COCKPIT_RUI_HEIGHT * heigth),
		COCKPIT_RUI_SUBDIV)
}

void function MoveTopo(var topo, float xPos, float yPos)
{
	RuiTopology_UpdatePos(topo,
	COCKPIT_RUI_OFFSET - <0, xPos, yPos>,
	<0., -1, 0>, <0, 0, -1>)
}

void function UpdateBar(var barTopo, var barRui, float percentage, float barWidth, float barHeight, float barPosX, float barPosY, vector chargeColor, vector fullColor, float chargeAlpha)
{
	if(percentage == 1)	// set color
	{
		RuiSetFloat3(barRui, "basicImageColor", fullColor)
		RuiSetFloat(barRui, "basicImageAlpha",  1)
	}
	else
	{
		RuiSetFloat3(barRui, "basicImageColor", chargeColor)
		RuiSetFloat(barRui, "basicImageAlpha",  chargeAlpha)
	}

	ScaleTopo(barTopo, (barWidth * percentage), barHeight)	// scale bar by bar percentage

	// offset the bar's horizontal position
	float maxOffset = barWidth * 100						// scale barWidth up to the scale that position values use
	float currentOffset = maxOffset * (1 - percentage)		// work out offset based on percentage
	MoveTopo(barTopo, (barPosX - currentOffset), barPosY)	// adjust bar's horizontal position
}

void function SwitchBarMode(var topo, var rui, var bg_rui, float width, float height, float xPos, float yPos, float alpha, float bg_alpha)
{
	ScaleTopo(topo, width, height) 				// scale bar 1 background
	MoveTopo(topo, xPos, yPos)					// move bar 1 background

	RuiSetFloat(rui, "basicImageAlpha", alpha)	// show/hide bar 2
	RuiSetFloat(bg_rui, "basicImageAlpha", bg_alpha)
}

// CALLBACK FUNCTIONS
//===============================================================================================================================================================================================================================
void function OnPlayerClassChanged( entity player )
{
	if(player.GetPlayerClass() == "pilot")
	{
		// hide default hud
		ClWeaponStatus_SetWeaponVisible(false)		// guns
		ClWeaponStatus_SetOffhandVisible(0, false)	// grendade
		ClWeaponStatus_SetOffhandVisible(1, false)	// ability
		ClWeaponStatus_SetOffhandVisible(4, false)	// boost
		Cl_EarnMeter_SetMeterVisible(false)			// earn meter

		// show custom hud
		RuiSetFloat (health.healthNumRui, "msgAlpha", health.alpha)
		RuiSetFloat (ammo.ammoNumRui, "msgAlpha", ammo.alpha)
		RuiSetFloat (boost.boostNumRui, "msgAlpha", boost.alpha)

		RuiSetFloat (grenade.bar1Rui, "basicImageAlpha", grenade.alpha)
		RuiSetFloat (grenade.bar2Rui, "basicImageAlpha", grenade.alpha)
		RuiSetFloat (grenade.bg_bar1Rui, "basicImageAlpha", grenade.bg_alpha)
		RuiSetFloat (grenade.bg_bar2Rui, "basicImageAlpha", grenade.bg_alpha)

		RuiSetFloat (ability.bar1Rui, "basicImageAlpha", ability.alpha)
		RuiSetFloat (ability.bar2Rui, "basicImageAlpha", ability.alpha)
		RuiSetFloat (ability.bg_bar1Rui, "basicImageAlpha", ability.bg_alpha)
		RuiSetFloat (ability.bg_bar2Rui, "basicImageAlpha", ability.bg_alpha)

		printt(player.GetPlayerNetFloat(EARNMETER_REWARDFRAC))
		if(player.GetPlayerNetFloat(EARNMETER_REWARDFRAC) > 0)
		{
			RuiSetFloat (earnMeter.bar1Rui, "basicImageAlpha", earnMeter.alpha)
			RuiSetFloat (earnMeter.bar2Rui, "basicImageAlpha", earnMeter.alpha)
			RuiSetFloat (earnMeter.bg_bar1Rui, "basicImageAlpha", earnMeter.bg_alpha)
			RuiSetFloat (earnMeter.markerRui, "basicImageAlpha", earnMeter.alpha)
		}

		return
	}

	if(player.GetPlayerClass() == "titan")
	{
		// show default hud
		ClWeaponStatus_SetWeaponVisible(true)		// guns
		ClWeaponStatus_SetOffhandVisible(0, true)	// grendade
		ClWeaponStatus_SetOffhandVisible(1, true)	// ability
		Cl_EarnMeter_SetMeterVisible(true)			// earn meter

		// hide custom hud
		RuiSetFloat (health.healthNumRui, "msgAlpha", 0)
		RuiSetFloat (ammo.ammoNumRui, "msgAlpha", 0)
		RuiSetFloat (boost.boostNumRui, "msgAlpha", 0)

		RuiSetFloat (grenade.bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (grenade.bar2Rui, "basicImageAlpha", 0)
		RuiSetFloat (grenade.bg_bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (grenade.bg_bar2Rui, "basicImageAlpha", 0)

		RuiSetFloat (ability.bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (ability.bar2Rui, "basicImageAlpha", 0)
		RuiSetFloat (ability.bg_bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (ability.bg_bar2Rui, "basicImageAlpha", 0)

		RuiSetFloat (earnMeter.bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (earnMeter.bar2Rui, "basicImageAlpha", 0)
		RuiSetFloat (earnMeter.bg_bar1Rui, "basicImageAlpha", 0)
		RuiSetFloat (earnMeter.markerRui, "basicImageAlpha", 0)

		return
	}
}

vector function SelectBarColor(entity ent)
{
	switch(ent.GetWeaponClassName())
	{
		case "mp_weapon_frag_grenade":
			return barColors.frag

		case "mp_weapon_grenade_emp":
			return barColors.arc

		case "mp_weapon_thermite_grenade":
			return barColors.firestar

		case "mp_weapon_grenade_gravity":
			return barColors.gravstar

		case "mp_weapon_grenade_electric_smoke":
			return barColors.eSmoke

		case "mp_weapon_satchel":
			return barColors.satchel

		case "mp_ability_cloak":
			return barColors.cloak

		case "mp_weapon_grenade_sonar":
			return barColors.pulse

		case "mp_ability_grapple":
			return barColors.grapple

		case "mp_ability_heal":
			return barColors.stim

		case "mp_weapon_deployable_cover":
			return barColors.aWall

		case "mp_ability_shifter":
			return barColors.phase

		case "mp_ability_holopilot":
			return barColors.holo

		default:
			return Vector(1.0, 1.0, 1.0)
	}

	return Vector(1.0, 1.0, 1.0)
}

#endif