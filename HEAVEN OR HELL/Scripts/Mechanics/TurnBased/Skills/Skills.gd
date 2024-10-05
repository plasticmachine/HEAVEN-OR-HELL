extends Node2D

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")

@export var skill_slot_1_skill: int
@onready var skill_slot_2_skill: int


func define_skill_slot_1_heaven():
	match skill_slot_1_skill:
		1:
			heavenstats.convert_skill_power(40)

func skill_test_1_heaven():
	heavenstats.convert_skill_power(40)
