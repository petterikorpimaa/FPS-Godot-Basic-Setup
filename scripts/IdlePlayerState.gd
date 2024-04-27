class_name IdlePlayerState

extends State

func enter() -> void:
	#ANIMATION.pause()

func update(delta):
	#ANIMATION.speed_scale = 1.0
	if Global.player.velocity.length() > 0.0 and Global.player.is_on_floor():
		transition.emit("WalkingPlayerState")
