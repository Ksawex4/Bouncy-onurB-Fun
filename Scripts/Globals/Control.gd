extends Node

var Map: TileMapLayer
var mousePos
var SelectedBlock = Vector2i(1,0)
var Names = ["Bob", "Bruno", "Burno", "Emix", "Ksawex", "Nova", "Soluś", "Arenka", "Benry", "Fency", "Pan Loduwka", "Toasty", "Bean Guy", "Marta", "Liściu", "Konrad", "Ralsei", "Kris", "Susie", "Lancer", "The Original         Starwalker", "Ballurb", "Gerson", "Niko", "Jack", "Jackenstein", "Proot", "Cursey", "Bouncy onurB", "Bruno ycnuoB", "Puro", "Ignac", "Ignasia", "Franek", "Julka", "Julek", "Kuba", "Dawid", "Kacper", "Mateusz", "Mint", "You", "Purple", "Orange", "Red", "Wine", "Green", "Yellow", "Duck", "Machine", "Killer Burger", "Burger", "John", "Shovel", "Feminine", "Hay", "Monster", "Amy", "Bomb", "Mother", "Launcher", "Fatblob", "Blank"]
var OnurbsPaused = false
var FollowNode = false
var node
var SelectedBounce = "Bouncy_onurB"
var OneWayBlock = load("res://Objects/one_way_block.tscn")
var AndroidPath = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/Nova-Games/Bouncy-onurB-Fun/"

func _ready() -> void:
	Map = get_tree().current_scene.get_node("TileMapLayer")

func _process(_delta: float) -> void:
	if Map != null:
		if Input.is_action_just_pressed("spawnBouncy_onurB") or Input.is_action_pressed("spawnBouncy_onurB") && Input.is_action_pressed("shift"):
			spawnBouncy()
		if Input.is_action_just_pressed("deleteBouncy_onurBs"):
			deleteOnurbs()
		if Input.is_action_just_pressed("quit"):
			var pausMenu = get_tree().current_scene.get_node("PauseMenu")
			pausMenu.show()
			OnurbsPaused = true
		if Input.is_action_pressed("addBlock"):
			placeBlockAtCursor()
		if Input.is_action_pressed("removeBlock"):
			removeBlockAtCursor()
		if Input.is_action_pressed("showBlocks"):
			var BluckMenu = get_tree().current_scene.get_node("BlockMenu")
			BluckMenu.show()
	else:
		Map = get_tree().current_scene.get_node("TileMapLayer")

func spawnBouncy():
	var bouncy
	if SelectedBounce == "Bouncy_onurB":
		bouncy = load("res://Objects/Characters/bouncy_onurb.tscn")
	elif SelectedBounce == "BouncyFighter":
		bouncy = load("res://Objects/Characters/bouncy_fighter.tscn")
	if bouncy:
		var instance = bouncy.instantiate()
		get_tree().current_scene.add_child(instance)
		instance.position = mousePos

func deleteOnurbs():
	for child in get_tree().current_scene.get_children():
			if child.scene_file_path.get_file() == "bouncy_onurb.tscn":
				child.queue_free()
			elif child.scene_file_path.get_file() == "bouncy_fighter.tscn":
				child.queue_free()

func UpdateMousePos(Position):
	mousePos = Position

func placeBlockAtCursor():
	if SelectedBlock is not String:
		var MapPos = Map.local_to_map(mousePos)
		Map.set_cell(Vector2i(MapPos), 1, SelectedBlock)
	else:
		var block = OneWayBlock.instantiate()
		get_tree().current_scene.add_child(block)
		block.global_position = mousePos

func removeBlockAtCursor():
	var MapPos = Map.local_to_map(mousePos)
	Map.set_cell(Vector2i(MapPos), 1, Vector2i(0,0))

func MoveCamTo(ME):
	FollowNode = true
	node = ME
	await get_tree().create_timer(5.0).timeout
	FollowNode = false

func ExportLevel():
	if !DirAccess.dir_exists_absolute(AndroidPath) and OS.get_name() == "Android":
		var error = DirAccess.make_dir_recursive_absolute(AndroidPath)
		if error == OK:
			print("created Bouncy-onurB folder in ", OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS))
		else:
			print("Failed to create Bouncy-onurB folder in ", OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS))
	var path
	if OS.get_name() != "Android":
		path = "user://Level.tscn"
	else:
		path = AndroidPath + "Level.tscn"
	if path and OS.get_name() != "Android" or DirAccess.dir_exists_absolute(AndroidPath) and path:
		var ImGonnaPackThisChickenNugget = PackedScene.new()
		var Byeee = ImGonnaPackThisChickenNugget.pack(get_tree().current_scene)
		if Byeee == 0:
			ResourceSaver.save(ImGonnaPackThisChickenNugget, path)
		else:
			print("failed")
