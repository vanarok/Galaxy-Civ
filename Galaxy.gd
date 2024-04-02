class_name Galaxy
extends Node2D

var starSystems: Array[StarSystem]


func _init(num_star_systems: int = 1000, star_types: Array[Variant] = ["G", "K", "M"], planet_types: Array[Variant] = ["rocky", "gas_giant", "ice_giant", "earth"], civs: int = 10) -> void: # (c) -> void:
    randomize()  # Инициализация генератора случайных чисел
    for i in range(num_star_systems):
        var star_system: Node2D = generate_star_system(star_types)
        starSystems.append(star_system)
        add_child(star_system)
        star_system.set_global_position(get_planet_position(i, 10))
    create_random_civ()
    print('galaxy')


func create_random_civ() -> void:
    for i in range(1):
        starSystems[0].add_civ_to_planet_by_id(randi() % 1000)


func get_planet_position(i: int, spacing: int) -> Vector2:
    var level  = floor(sqrt(i))
    var radius = level * spacing + randf() * spacing

    var angle := randf() * TAU

    var x = radius * cos(angle)
    var y = radius * sin(angle)

    return Vector2(x, y)


func generate_star_system(star_types) -> Node2D:
    var starSystem := StarSystem.new()

    #    starSystem.draw.connect(func(): starSystem.draw_circle(Vector2(0, 0), 2, Color.WHITE))
    starSystem.name = "Star"
    starSystem.star_type = star_types[randi() % star_types.size()]

    return starSystem
