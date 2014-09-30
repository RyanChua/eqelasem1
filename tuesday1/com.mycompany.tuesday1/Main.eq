/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */
public class Main : SEScene
{
    SESprite fg;
    SESprite bg;
    bool move_right=true;
    bool move_left=false;
        bool move_down=true;
        bool move_up=false;
        int speed=1000;
        double rotation;    
        SESprite text;



    public void initialize(SEResourceCache rsc) {
        base.initialize(rsc);
        bg = add_sprite_for_color(Color.instance("#483D8B"), get_scene_width(), get_scene_height());
        bg.move(0,0);
        fg = add_sprite_for_color(Color.instance("#FFFF00"), get_scene_width()*0.1, get_scene_height()*0.1);
        fg.move(100,100);
        rsc.prepare_font("myfont","arial bold color=white",40);
        text = add_sprite_for_text("Ryan Chua Game App","myfont");
        text.move(100,get_scene_height()-text.get_height());

    }
        public void update(TimeVal now, double delta) {
            base.update(now,delta);
        rotation+=MathConstant.M_PI_4/10;
        fg.set_rotation(rotation);
            if(move_right) {
                fg.move(fg.get_x() + delta * speed, fg.get_y());
                if(fg.get_x()+fg.get_width()>get_scene_width()) {
            move_right=false;
            move_left=true;
                        speed=500;
            }
                        speed+=50;
            }
            if(move_left) {
                fg.move(fg.get_x() - delta * speed, fg.get_y());
                if(fg.get_x()<0){
            move_right=true;
            move_left=false;
                        speed=500;
            }  
                        speed+=50;  
        }
                        if(move_down) {
                      fg.move(fg.get_x(), fg.get_y() + delta *speed);
                                  if(fg.get_y() + fg.get_height() > get_scene_height()) {
                                                move_down=false;
                                                move_up=true;
                                                speed=500;
                        }
                        speed+=50;
            }
                        if(move_up) {
                      fg.move( fg.get_x(),fg.get_y() - delta *speed);
                                  if(fg.get_y() < 0) {
                                                move_down=true;
                                                move_up=false;
                                                speed=500;
                        }
                        speed+=50;
            }
}
                        public void set_rotation(double angle) {
                                rotation = angle;
                        }
                        public double get_rotation() {
                                return (rotation);
                        }
}
