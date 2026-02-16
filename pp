from pygame import *
from random import randint 
font.init()
window = display.set_mode((700,500))
display.set_caption("ping-pong")
win_width= 700
win_height = 500
FPS = 60
background = transform.scale(image.load("goluboy.jpg"),(700,500))
class GameSprite(sprite.Sprite) :
    def __init__(self,player_image,player_x,player_y,player_speed,ps_width,ps_height):
        super().__init__()
        self.image = transform.scale(image.load(player_image),(ps_width,ps_height))
        self.speed = player_speed
        self.rect = self.image.get_rect()
        self.rect.x = player_x
        self.rect.y = player_y
class Wall(GameSprite):
    def update(self):
        keys = key.get_pressed()
        if keys[K_UP] and self.rect.x > 5 :
            self.rect.x -= self.speed
        if keys[K_DOWN] and self.rect.x < win_width - 50 : 
            self.rect.x += self.speed

class Ball(GameSprite):
    def update(self):
        
        
wall1 = Wall("wall.jpg",50,250,10,66,66)       
wall2 = Wall("wall.jpg",650,250,10,66,66) 
ball = Ball("ping_pongball.avif",350,250,10,44,44)
speed_x = 3 
speed_y = 3 

font1 = font.Font(None,36)
finish = False
game = True
while game: 
    for e in event.get():
        if e.type == QUIT:
            game = False
        if e.type == KEYDOWN:
            # if e.key == K_SPACE:
            #     sprite1.fire()
            #     fire.play()
    
    if finish != True:
        ball.rect.x += speed_x
        ball.rect.y += speed_y
        ball.update()
        ball.draw(window)
        collision1 = sprite.groupcollide(ball,wall1,True,True)
        collision2 = sprite.groupcollide(ball,wall2,True,True)
        if sprite.collide_rect(wall1,ball) :
            speed_x *= -1 
        if sprite.collide_rect(wall2,ball):
            speed_x *= -1


clock.tick(FPS)
display.update()
