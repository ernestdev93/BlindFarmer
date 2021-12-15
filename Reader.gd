extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	audio = $audio


var playArray : bool = false
var playIndex : int = 0
var audios = []
var mCallback = null

func _on_audio_finished():
	if(playIndex < audios.size()-1):
		playIndex += 1
		_play(audios[playIndex])
	elif(playIndex == audios.size()-1):
		playIndex=0
		playArray=false
		if(mCallback != null):
			mCallback.call_func()
	#if(mCallback != null):
	#		mCallback.call_func()
#hacer que la clase  pueda gestionar callbacks tambien cuando suena un saolo  sonido
#con una bandera se podria evitar que entre en bucle la señal


func _playsounds(sArray, callback = null):
	reset()
	mCallback = callback
	if(playArray == false):
		playArray=true
	audios= sArray
	_play(audios[0])

func reset():
	audio.stop()
	playIndex = 0
	audios = []


var audio : AudioStreamPlayer
var rutapre = "res://sounds/"
var audionode :AudioStreamPlayer

func _playsound(name, callback = null):	
	#mCallback = callback
	var artemp = [name]
	_playsounds(artemp, callback)
	
	_play(name)

func _play(name):
	var ruta = rutapre + name + ".wav"
	print(ruta+"se imprime")
	audio.stream = load(ruta)
	audio.play()



