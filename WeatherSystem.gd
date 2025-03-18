extends Node

enum Weather { CLEAR, SNOW, FOG }
var current_weather: Weather = Weather.CLEAR

func _process(delta: float) -> void:
    match current_weather:
        Weather.SNOW:
            get_node("Particles").emitting = true
        Weather.FOG:
            get_node("WorldEnvironment").environment.fog_density = 0.1
        Weather.CLEAR:
            get_node("Particles").emitting = false
            get_node("WorldEnvironment").environment.fog_density = 0.0
