extends Node2D

func _ready() -> void:
	print("--- In Root Viewport ---")
	print("Canvas ID: ", $RigidBody2D.get_canvas().get_id())
	print("Physics canvas: ", Physics2DServer.body_get_canvas_instance_id($RigidBody2D.get_rid()))
	var body_rid := Physics2DServer.body_get_space($RigidBody2D.get_rid())
	print("Physics space: ", body_rid.get_id())
	print("Root space: ", get_tree().get_root().world_2d.space.get_id())

	print("\n--- In other Viewport ---")
	print("Canvas ID: ", $ViewportContainer/Viewport/RigidBody2D.get_canvas().get_id())
	print("Physics canvas: ", Physics2DServer.body_get_canvas_instance_id($ViewportContainer/Viewport/RigidBody2D.get_rid()))
	print("Physics space: ", Physics2DServer.body_get_space($ViewportContainer/Viewport/RigidBody2D.get_rid()).get_id())
	print("Viewport space: ", $ViewportContainer.get_world_2d().space.get_id())


	print("Make them collide with each other by setting the same space:")
	Physics2DServer.body_set_space($ViewportContainer/Viewport/RigidBody2D.get_rid(), body_rid)
