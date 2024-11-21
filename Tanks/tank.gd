class_name Tank
extends CharacterBody2D

const BULLET = preload("res://Tanks/Bullet/bullet.tscn") 

#Tank Stats
var maxHealth:float = 100.0
var health
var tankSpeed = 20000.0 #May need tweaking
var regen:float = 0 #perecent based
var onFire = false
var attackSpeed = 0.5
var attackCooldown = false
var ai:bool

var healthBar:ProgressBar
var rotationSpeed:float = 4
var aimSpeed:float = 3
var aimMethod:bool = true #true = key board. false = mouse
var rotationDirection = 0

#Bullet Stats
var damage:float = 20
var bulletSpeed = 400
var bulletRange = 1200
var bulletSize = 0.5
var fireBullets = false
var fireDamage: float # Defined later in code
var aiFired:bool



#Signals
var tank_index:int #the index of the tank on the players list
signal tank_dead(index:int) #signals to the round/level that the tank is dead

 




func take_damage(damage:float,fire:bool,p_aiFired:bool):
	if(p_aiFired && ai): #If the bullet is fired by an ai and hits an ai return
		return
	else:
		if(fire):
			onFire = true
			fireDamage = damage/10
			$Fire_Timer.start(10)
			$Fire.visible = true
		
		healthBar.max_value = maxHealth #could be less redudant be need it here so the bar doesn't bug when max health increases
		health -= damage
		healthBar.value = health
		if(health <= 0):
			tank_dead.emit(tank_index)
			#queue_free()


func fire():
	if(!attackCooldown):
		attackCooldown = true
		$Attack_Speed.start(attackSpeed)
		var spawned:Bullet = BULLET.instantiate()
		spawned.global_rotation = %TankTopGreen.global_rotation
		spawned.position = %FirePoint.global_position
		spawned.damage = damage
		spawned.speed = bulletSpeed
		spawned.range = bulletRange
		spawned.size = bulletSize
		spawned.fireB = fireBullets
		spawned.aiFired = aiFired
		#need offset 
		get_parent().add_child(spawned)
