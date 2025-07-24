load 'multiavatar.rb'

@write_dir = 'example_svgs'
Dir.mkdir(@write_dir) unless Dir.exist?(@write_dir)

def write_avatar(base_name,data)  
  name = "avatar_#{base_name}.svg"
  File.write("#{@write_dir}/#{name}", data)
  puts "Save:  Saved #{base_name} SVG to #{@write_dir}/#{name}."
end

# Quick class method use with a randomly generated avatar
av1 = Multiavatar.generate()
puts "Example:  Class method with no avatar_id: #{av1[0..10]} ... #{av1[400..500]} ..."
write_avatar('random_class_av1',av1)

# Instance use with a randomly generated avatar
ob_av1 = Multiavatar.new()
puts "Example:  Instance with no avatar_id: #{ob_av1.avatar[0..10]} ... #{ob_av1.avatar[400..500]} ..."
write_avatar('random_object_av1',ob_av1.avatar)

# Quick class method use with a predefined avatar_id
av2 = Multiavatar.generate('brogue')
puts "Example:  Class method for avatar_id 'brogue': #{av2[0..10]} ... #{av2[400..500]} ..."
write_avatar('brogue_class_av2',av2)

# Instance use with a predefined avatar_id
ob_av2 = Multiavatar.new('brogue')
puts "Example:  Instance with for avatar_id 'brogue': #{ob_av2.avatar[0..10]} ... #{ob_av2.avatar[400..500]} ..."
write_avatar('brogue_object_av2',ob_av2.avatar)

# Proving that the same key produces the same avatar each time
puts "Test:  Using avatar_id of 'brogue' avatar_id re-produces same avatar." if ob_av2.avatar == av2

# Re-use instance, generating a new avatar with a different avatar_id, and no background
old_ob_av2 = ob_av2.avatar
ob_av2.generate('Robo',true)
puts "Example:  Re-use instance with avatar_id 'Robo' and no background: #{ob_av2.avatar[0..10]} ... #{ob_av2.avatar[400..500]} ..."
write_avatar('Robo_object_av2',ob_av2.avatar)

# Proving that a single instance can produce many unqiue avatars after init.
puts "Test:  Instance that created 'brogue' created a new avatar after init using new id of 'Robo" if ob_av2.avatar != old_ob_av2

# Instance use with randomly generated avatar and no background
av3 = Multiavatar.generate(nil,true)
puts "Example:  Class method with no avatar_id: #{av3[0..10]} ... #{av3[400..500]} ..."
write_avatar('random_class_no_background_av3',av3)
