extends RigidBody2D

var speed_x = 200
var speed_y = 200
var current_speed = Vector2(0, 0)
var acceleration = 10

var btn_up = Input.is_action_pressed("btn_up")
var btn_down = Input.is_action_pressed("btn_down")
var btn_left = Input.is_action_pressed("btn_left")
var btn_right = Input.is_action_pressed("btn_right")

func move(speed_x, speed_y, acceleration, delta):
	current_speed.x = lerp(current_speed.x, speed_x, acceleration * delta)
	current_speed.y = lerp(current_speed.y, speed_y, acceleration * delta)
	set_linear_velocity(current_speed)


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	print(get_linear_velocity())
	btn_up = Input.is_action_pressed("btn_up")
	btn_down = Input.is_action_pressed("btn_down")
	btn_left = Input.is_action_pressed("btn_left")
	btn_right = Input.is_action_pressed("btn_right")
	
	if btn_left:
		move(-speed_x, 0, acceleration, delta)
	if btn_right:
		move(speed_x, 0, acceleration, delta)
	if btn_up:
		move(0, -speed_y, acceleration, delta)
	if btn_down:
		move(0, speed_y, acceleration, delta)
	#else:
		#move(0, acceleration, delta)