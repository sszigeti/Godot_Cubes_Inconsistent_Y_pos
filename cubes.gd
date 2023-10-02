extends Node3D

@export var dev_label:Label

var cubes := []
var diagnostics := PackedStringArray()

func _ready():
	for cube in get_tree().get_nodes_in_group("cube"):
		cubes.append(cube)


func _process(_delta):
	diagnostics.clear()
	for cube in cubes:
		diagnostics.append("{name} : {pos_y}".format({
				name = cube.name,
				pos_y = cube.position.y
			}))
	dev_label.text = "\n".join(diagnostics)
