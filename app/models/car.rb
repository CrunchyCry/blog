class Car
  attr_accessor :color, :tires, :max_speed, :max_gears, :actual_speed, :actual_gear, :slow_down
  
  def initialize(color, tires, max_speed, max_gears)
    @color = color
    @tires = tires
    @max_speed = max_speed
    @max_gears = max_gears
    @actual_speed = 0
    @actual_gear = 1
  end 

  def shift_up
    gear = actual_gear
    if max_gears > actual_gear
       self.actual_gear = gear + 1
    end
  end

  def shift_down
    gear = actual_gear
    if actual_gear > 1
      self.actual_gear = gear - 1
    end
  end

  def accelerate(speed)
    if max_speed > (actual_speed + speed)
      self.actual_speed = speed + actual_speed
    else
      self.actual_speed = max_speed
    end
  end

  def slow_down(speed)
    if 0 < (actual_speed - speed)
      self.actual_speed = actual_speed - speed
    else
      self.actual_speed = 0
    end 
  end
end


