extends Control

func _ready():
	add_child(SceneManager.graph)
	$Graph.anchor_left = 0.625
	$Graph.anchor_top = 0.1
	$Graph.anchor_right = 0.9
	$Graph.anchor_bottom = 0.9
	
	yield(VisualServer, 'frame_post_draw')
	
	var viewport_size = get_viewport().size
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	img.flip_x()
	img.crop(viewport_size.x/2, viewport_size.y)
	img.flip_x()
	img.save_png("user://screenshot.png")
