class_name Game
extends Node

# Настройки галактики
var num_star_systems: int = 1000
# Параметры звездной системы
var star_types: Array[Variant]   = ["G", "K", "M"]  # Возможные типы звезд
var planet_types: Array[Variant] = ["rocky", "gas_giant", "ice_giant", "earth"]  # Возможные типы планет
var civs: int                    = 1