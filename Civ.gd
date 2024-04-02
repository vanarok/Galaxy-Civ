class_name Civ
extends Node

var id: int
var civ_type: String
var owner_planets: Array[int]
var color: Color


func _init(base_planet_id) -> void:
    # add a planet
    owner_planets.append(base_planet_id)


func add_planet(planet_id) -> void:
    owner_planets.append(planet_id)


func remove_planet(planet_id) -> void:
    owner_planets.erase(planet_id)


func get_num_planets() -> int:
    return owner_planets.size()