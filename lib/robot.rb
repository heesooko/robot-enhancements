class Robot 

  attr_accessor :position, :items, :items_weight, :health, :equipped_weapon, :shield_points
  
  def self.robot_list
    @@robot_list
  end

  @@robot_list = []

  def self.in_position(x,y)
    @@robot_list.select { |robot| robot.position[0] == x && robot.position[1] == y }
  end

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon = nil
    @shield_points = 50
    @@robot_list << self
  end

  def scan
    robot_next = @@robot_list.select do |robot| 
      ((robot.position[0] - self.position[0]).abs == 1 && robot.position[1] == self.position[1]) || 
      ((robot.position[1] - self.position[1]).abs == 1 && robot.position[0] == self.position[0])
    end
puts robot_next
    if robot_next.length >= 1 
      true
    else
      false
    end
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    self.items << item

    if self.items_weight < 250 
      self.items_weight += item.weight 
      p self.items_weight
    else
      return false
    end

    if item.is_a?(Weapon)
      self.equipped_weapon = item
    else
      self.equipped_weapon = nil
    end

    if item.is_a?(Battery)
      self.shield_points = 50 
    end

    if item.is_a?(BoxOfBolts) && self.health <= 80
      item.feed(self)
    end
  end

  def wound(damage)

    if damage > self.shield_points
      self.health -= (damage - @shield_points)
      self.shield_points = 0
    else 
      self.shield_points -= damage
    end
  end

  def heal(power)
    self.health + power >= 100 ? (100) : (self.health += power)
  end

  def heal!(power)
    if self.health > 0
      @health += power
    else
      @health = 0
    end
  end

  def attack(enemy)
    if (enemy.position[1] - self.position[1]).abs == 1 || (enemy.position[0] - self.position[0]).abs == 1
      if self.equipped_weapon == nil
        enemy.wound(5)
      else
        @equipped_weapon.hit(enemy)
      end
    elsif enemy.position[1] - self.position[1].abs == 2 && self.equipped_weapon.is_a?(Grenade)
      enemy.wound(15)
      self.equipped_weapon = nil
    else
      nil
    end
  end

  def attack!(enemy)
    if enemy.is_a? Robot 
      enemy.wound(5)
    else
      nil 
    end
  end



end
