@tool
extends CanvasItem

@export_range(0, 256) var count := 32
@export_range(0, 512) var dist := 256.0
@export_range(0.01, 10.0, 0.01) var scal := 1.0
@export_range(0.0, 10.0, 0.01) var linew := 1.0
@export var ofs: Vector2
@export_range(0, 360, 0.1, "radians_as_degrees", "or_greater", "or_less") var rotations := 0.0
@export var mat: Material

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var want := count - get_child_count()
	for i in range(0, want):
		var n := preload("res://cubey1.tscn").instantiate()
		n.get_child(0).rotation = i * (PI * 2 / count)
		add_child(n)
	
	for i in range(0, -want):
		remove_child(get_child(0))
	
	for i in get_child_count():
		var c = get_child(i)
		var n := c.get_child(0)
		n.rotation = i * (PI * 2 / count)
		
		var n2 := n.get_child(0)
		n2.position.y = -dist
		n2.rotation = rotations
		
		var n3 := n2.get_child(0)
		n3.position = ofs
		n3.scale = Vector2.ONE * scal
		
		var h: float = n.rotation / (2*PI)
		var colorr: ColorRect = n3.get_child(0)
		colorr.color = Color.from_hsv(h, 1.0, 0.3)
		colorr.material = mat
		
		var line2d: Line2D = n3.get_child(1)
		line2d.width = linew / scal
		line2d.default_color = Color.from_hsv(h + 0.1, 1.0, 0.3)
		line2d.material = mat
