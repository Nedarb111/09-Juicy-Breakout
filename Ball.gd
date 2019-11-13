extends RigidBody2D

export var maxspeed = 300

signal lives
signal score

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var WorldNode = get_node("/root/Node2D/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   if body.get_parent().name == "Red Tiles":
     get_node("/root/Node2D/World").make_ball()

   emit_signal("score",body.score)
   get_node("/root/Node2D/World/Blop").playing = true
   body.queue_free()
  if body.get_name() == "Paddle":
   pass
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()