#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

public OnPluginStart()
{	
	HookEvent("player_hurt", EventPlayerHurt, EventHookMode_Pre);
}	

public Action:EventPlayerHurt(Handle:event, const String:name[],bool:dontBroadcast)
{
	new i = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if(i == 0) return Plugin_Continue;
	if (GetEntPropFloat(i, Prop_Send, "m_flVelocityModifier") < 1.0) SetEntPropFloat(i, Prop_Send, "m_flVelocityModifier", 1.0);

	return Plugin_Continue;
}
