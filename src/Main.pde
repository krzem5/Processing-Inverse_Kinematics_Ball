final int SEGMENT_SIZE=15;
final int SEGMENT_CIRCLE_SIZE=20;
final int SEGMENT_COUNT=40;
final float GRAVITY=1;
final float BALL_GRAVITY=9.81;
final float MAX_SPEED=50000;
final int BALL_SIZE=20;
final float BALL_MASS=100;
final float SEGMENT_MASS=50;



Tentacle t;
Ball b;
int mx;
int my;
int _lt;



void setup(){
	size(2048,1024);
	t=new Tentacle(width/2,height/4);
	b=new Ball(width/2,height/4);
	mx=width/2;
	my=height/2;
	_lt=millis();
}



void draw(){
	int tm=millis();
	float d=(tm-_lt)*1e-3f;
	_lt=tm;
	background(0);
	if (mousePressed){
		b.x=mouseX;
		b.y=mouseY;
		b.vx=0;
		b.vy=0;
	}
	else{
		b.update(d);
	}
	t.update(d,b.x,b.y);
	b.update_pos(d,t);
	b.draw();
	t.draw();
}
