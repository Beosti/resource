class_name ResourceDataClass
extends Node

var STONE_RESOURCE = "Stone";
var STONE_ID = "stone";
var stoneAmount = 0;
var RAW_COPPER_RESOURCE = "Raw Copper";
var RAW_COPPER_ID = "raw_copper";
var rawCopperAmount = 0;
var COAL_RESOURCE = "Coal";
var COAL_ID = "coal";
var coalAmount = 0;
var RAW_IRON_RESOURCE = "Raw Iron";
var RAW_IRON_ID = "raw_iron";
var rawIronAmount = 0;
var PIG_IRON_RESOURCE = "Pig Iron";
var PIG_IRON_ID = "pig_iron";
var pigIronAmount = 0; 
var COPPER_MATTE_RESOURCE = "Copper Mate";
var COPPER_MATTE_ID = "copper_matte";
var copperMatteAmount = 0;

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
