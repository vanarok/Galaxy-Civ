class_name StarSystem
extends Node2D

var id: int
var star_type: String
var planets: Array[Planet]


func _init() -> void:
    var num_planets: int = randi() % 8 + 1  # Случайное количество планет
    for j in range(num_planets):
        var planet := Planet.new()
        # draw a circle
        planet.name = "Planet_" + str(j)
        planets.append(planet)
        add_child(planet)


# TODO: color red if planter is owned by civ
func _draw() -> void:
    var color := Color.WHITE  # Цвет по умолчанию
    if get_owner_id() != -1:
        color = Color.RED

    draw_circle(Vector2(0, 0), 2, color)


func add_civ_to_planet_by_id(id) -> void:
    planets[0].add_child(Civ.new(id))
    print(id)


# TODO: foreach planets and find civ
func get_owner_id() -> int:
    var owners := planets.map(func(element):
        return element["planet_owner"]
    )
    if len(owners) > 1:
        return -1
    elif len(owners) == 1:
        return owners[0]
    else:
        return -1
