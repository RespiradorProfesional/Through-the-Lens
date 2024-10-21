extends Camera2D

@export var shake_intensity: float = 20.0  # Intensidad de la sacudida
@export var shake_duration: float = 0.5    # Duración de la sacudida en segundos

var shake_timer: float = 0.0               # Temporizador para controlar la duración de la sacudida
var original_offset: Vector2               # Guarda la posición original de la cámara

func _ready():
	original_offset = offset  # Guarda la posición inicial de la cámara

func _process(delta):
	if shake_timer > 0:
		shake_timer -= delta
		# Aplica un desplazamiento aleatorio basado en la intensidad
		offset.x = original_offset.x + randf_range(-shake_intensity, shake_intensity)
		offset.y = original_offset.y + randf_range(-shake_intensity, shake_intensity)
		
		# Detener el shake cuando el tiempo se agote
		if shake_timer <= 0:
			offset = original_offset  # Vuelve a la posición original

# Llama a este método para iniciar la sacudida de la cámara
func start_shake(duration: float = shake_duration, intensity: float = shake_intensity) -> void:
	shake_timer = duration
	shake_intensity = intensity
