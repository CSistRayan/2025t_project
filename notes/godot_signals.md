# Signals!!!
- godot has a system of communication between its scenes called signals which can pass info and call on functions


## Basic custom signals!!

- The Emitter (radio)
this is the scene that sends OUT signals! that other scenes can "tune into"
```gdscript
signal sayHello # define the signal

emit_signal("sayHello") # send it out
```

- The Receiver
this scene is meant to listen into the other signals!
```gdscript
@onready var radio = $radioNode # get the radio

radio.connect("sayHello", functionA) # tune in

func functionA():
    print("Hello World!")
```

### Output:
```
Hello World!
```

## Advanced custom Signals
- these scenes pass parameters and values to functions!

- The Emitter (radio)
```gdscript
signal sayHello(name: String, favArray: Array) # add arguments

# another way to emit a signal is like this!
sayHello.emit("Timmy", ['I', 'Love', 'Fortnite', 'Skins']) # pass arguments 
```

- The Receiver
    - NOTE: the args need to be the same amount on both the function AND the signal (name does not matter)
```gdscript
@onready var radio = $radioNode

radio.connect("sayHello", functionA)

# add ur params as args like this
func functionA(name: String, favarr: Array):
	print(name)
	print(favarr)
```

### Output:
```
Timmy
["I", "Love", "Fortnite", "Skins"]
```
