class Tentacle{
	float x;
	float y;
	float[] xl;
	float[] yl;
	float ex;
	float ey;



	Tentacle(float x,float y){
		this.x=x;
		this.y=y;
		this.xl=new float[SEGMENT_COUNT];
		this.yl=new float[SEGMENT_COUNT];
		for (int i=0;i<SEGMENT_COUNT;i++){
			this.xl[i]=0;
			this.yl[i]=0;
		}
	}



	void update(float x,float y){
		int i=SEGMENT_COUNT;
		while (i>0){
			i--;
			this.xl[i]=x-this.xl[i];
			this.yl[i]=y-this.yl[i];
			float m=SEGMENT_SIZE/sqrt(this.xl[i]*this.xl[i]+this.yl[i]*this.yl[i]);
			this.xl[i]*=m;
			this.yl[i]*=m;
			x-=this.xl[i];
			y+=GRAVITY-this.yl[i];
		}
		x-=this.x;
		y-=this.y;
		float m=SEGMENT_SIZE/sqrt(x*x+y*y);
		x=this.x+x*m;
		y=this.y+y*m;
		for (;i<SEGMENT_COUNT;i++){
			float dx=this.xl[i];
			float dy=this.yl[i];
			this.xl[i]=x;
			this.yl[i]=y;
			x+=dx;
			y+=dy;
		}
		this.ex=x;
		this.ey=y;
	}



	void draw(){
		float x=this.x;
		float y=this.y;
		noFill();
		stroke(255,128);
		strokeWeight(15);
		for (int i=0;i<SEGMENT_COUNT;i++){
			line(x,y,this.xl[i],this.yl[i]);
			x=this.xl[i];
			y=this.yl[i];
		}
		line(x,y,this.ex,this.ey);
		fill(255,0,0);
		noStroke();
		circle(this.x,this.y,SEGMENT_CIRCLE_SIZE);
	}
}
