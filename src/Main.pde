final int SEGMENT_SIZE=15;
final int SEGMENT_CIRCLE_SIZE=20;
final int SEGMENT_COUNT=40;
final int GRAVITY=1;



Tentacle t;
int mx;
int my;



void setup(){
	size(2048,1024);
	t=new Tentacle(width/2,height/4);
	mx=width/2;
	my=height/2;
}



void draw(){
	background(0);
	if (mousePressed){
		mx=mouseX;
		my=mouseY;
	}
	t.update(mx,my);
	t.draw();
}
