extends Node

class_name AudioManager

var audio : AudioStreamPlayer
var rutapre = "res://sounds/"
var audionode :AudioStreamPlayer

func _init():
	audio = AudioStreamPlayer.new()
	add_child(audio)


func _ready():
	$audio._playsound("left")
	

func _playsound( name):
	var ruta = rutapre + name + ".wav"
	print(ruta+"se imprime")
	audio.stream = load(ruta)
	audio.play()
