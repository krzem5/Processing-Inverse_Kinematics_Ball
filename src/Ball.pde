class Ball{
	float x;
	float y;
	float vx;
	float vy;



	Ball(float x,float y){
		this.x=x;
		this.y=y;
		this.vx=0;
		this.vy=0;
	}



	void update(float dt){
		this.vy+=BALL_GRAVITY*BALL_MASS*dt;
		float m=sqrt(this.vx*this.vx+this.vy*this.vy);
		if (m>MAX_SPEED){
			m=MAX_SPEED/m;
			this.vx*=m;
			this.vy*=m;
		}
	}



	void update_pos(float dt,Tentacle t){
		this.vx*=0.99f;
		this.vy*=0.99f;
		this.x+=this.vx*dt;
		this.y+=this.vy*dt;
		float dx=this.x-t.x;
		float dy=this.y-t.y;
		float m=sqrt(dx*dx+dy*dy);
		if (m>(SEGMENT_COUNT+1)*SEGMENT_SIZE){
			m=(SEGMENT_COUNT+1)*SEGMENT_SIZE/m;
			this.x=t.x+dx*m;
			this.y=t.y+dy*m;
			float a=PI+2*(atan2(dy,dx)-atan2(this.vy,this.vx));
			float c=cos(a);
			float s=sin(a);
			m=this.vx;
			this.vx=m*c-this.vy*s;
			this.vy=m*s+this.vy*c;
		}
		if (this.y>height-BALL_SIZE){
			this.vy=0;
			this.y=height-BALL_SIZE;
		}
	}



	void draw(){
		fill(0,255,0);
		noStroke();
		circle(this.x,this.y,BALL_SIZE*2);
	}
}
