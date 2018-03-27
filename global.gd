extends Node

var Escolha1 = "" setget setEscolha1
var Escolha2 = "" setget setEscolha2
var Escolha3 = "" setget setEscolha3
var fase = 0
var partidaInicial = false;
var historia = ""
var historiaFase
var vitoriaDerrota = false
var totalFasesMonica = 3

signal mudarEscolha1
signal mudarEscolha2
signal mudarEscolha3

var img1 = 0
var img2 = 0
var img3 = 0

func _ready():
	set_process(true)

func setEscolha1(_Escolha1):
	Escolha1 = _Escolha1
	emit_signal("mudarEscolha1")

func setEscolha2(_Escolha2):
	Escolha2 = _Escolha2
	emit_signal("mudarEscolha2")

func setEscolha3(_Escolha3):
	Escolha3 = _Escolha3
	emit_signal("mudarEscolha3")

func gerarImage():
	img1 = randi() % 3 + 1
	img2 = randi() % 3 + 1
	if(img1 == img2):
		while(img1 == img2):
			img2 = randi() % 3 + 1
	
	img3 = randi() % 3 + 1
	if(img1 == img3):
		while(img1 == img3):
			img3 = randi() % 3 + 1
	
	if(img2 == img3):
		while(img2 == img3):
			img3 = randi() % 3 + 1

func readFile(var numberLines):
	var data = {}
	var count = 0
	var fileHistoria = File.new()
	fileHistoria.open("res://Galeria/TurmadaMonica/Historia"+str(fase)+".data", File.READ)
	while(count < numberLines):
		print(fase)
		data.parse_json(fileHistoria.get_line())
		historia = data["historia"]
		count = count + 1
