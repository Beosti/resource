class_name ResourceDataClass
extends Node

# General resources
const STONE_RESOURCE = "Stone";
const STONE_ID = "stone";
const STONE_VALUE = 1;
var stoneAmount = 0;
var stoneMined = 0;
const RAW_COPPER_RESOURCE = "Raw Copper";
const RAW_COPPER_ID = "raw_copper";
const RAW_COPPER_VALUE = 3;
var rawCopperAmount = 0;
const COAL_RESOURCE = "Coal";
const COAL_ID = "coal";
const COAL_VALUE = 2;
var coalAmount = 0;
const RAW_IRON_RESOURCE = "Raw Iron";
const RAW_IRON_ID = "raw_iron";
const RAW_IRON_VALUE = 3;
var rawIronAmount = 0;
const PIG_IRON_RESOURCE = "Pig Iron";
const PIG_IRON_ID = "pig_iron";
const PIG_IRON_VALUE = 2;
var pigIronAmount = 0; 
const COPPER_MATTE_RESOURCE = "Copper Mate";
const COPPER_MATTE_ID = "copper_matte";
const COPPER_MATTE_VALUE = 2;
var copperMatteAmount = 0;

# wealth 
const ZERRE_RESOURCE = "Zerre";
const ZERRE_ID = "zerre";
var zerreAmount = 0;

func add_zerre_amount(amount: int):
	zerreAmount += amount;

func get_zerre_amount() -> int:
	return zerreAmount;

func add_amount(resourceID: String, amount: int):
	match resourceID:
		STONE_ID:
			stoneAmount = stoneAmount + amount;
		RAW_COPPER_ID:
			rawCopperAmount = rawCopperAmount + amount;
		COAL_ID:
			coalAmount = coalAmount + amount;
		RAW_IRON_ID:
			rawIronAmount = rawIronAmount + amount;
		PIG_IRON_ID:
			pigIronAmount = pigIronAmount + amount;
		COPPER_MATTE_ID:
			copperMatteAmount = copperMatteAmount + amount;
func get_amount(resourceID: String):
	match resourceID:
		STONE_ID:
			return stoneAmount;
		RAW_COPPER_ID:
			return rawCopperAmount;
		COAL_ID:
			return coalAmount;
		RAW_IRON_ID:
			return rawIronAmount;
		PIG_IRON_ID:
			return pigIronAmount;
		COPPER_MATTE_ID:
			return copperMatteAmount;
func match_id(resourceName: String):
	match resourceName:
		STONE_RESOURCE:
			return STONE_ID;
		RAW_COPPER_RESOURCE:
			return RAW_COPPER_ID;
		COAL_RESOURCE:
			return COAL_ID;
		RAW_IRON_RESOURCE:
			return RAW_IRON_ID;
		PIG_IRON_RESOURCE:
			return PIG_IRON_ID;
		COPPER_MATTE_RESOURCE:
			return COPPER_MATTE_ID;
