# Multiavatar - Ruby #

<img src="https://raw.githubusercontent.com/multiavatar/Multiavatar/main/logo.png?v=001" width="65">

This is a quick and dirty ruby conversion of the php/py implementations of multiavatar.

[Multiavatar](https://multiavatar.com) is a multicultural avatar maker.

Multiavatar represents people from multiple races, multiple cultures, multiple age groups, multiple worldviews and walks of life.

In total, it is possible to generate **12,230,590,464** unique avatars.

See more project for details here: https://multiavatar.com and here: https://github.com/multiavatar

## Project Notes ##

I made this because we were using the online Multiavatar API to generate avatars for users for a few apps.  We loved it, and it worked great.  Then the API was removed and suddenly no new users could be created (because we didn't fail over gracefully ... shame on us).  So here we are, implementing a native one for our use in a hasty fashion.

Much thanks to the Multiavatar project for creating this avatar system, I think it is really cool, so putting this ruby implementation into the world makes me feel like I am giving back a little for this great project.

The optional parameters have not been tested, and frankly, I think the part/theme override isn't really implemented  correctly in this version or the python/php versions (unsure about the JS version) or I don't understand the exact functionality (and honestly, I didn't spend much time trying to understand it since we don't use it).  The original php/python code seems to replace ALL parts with one specific part.  I think is in error, but I just made the code "work" in ruby and did some ruby optimizations.

Perhaps I will return to test/fix that and make a Gem, but I wouldn't hold my breath.  It works for what we need, sooo ....

I wouldn't be sad if someone else does either of these things.

## Differences from source scripts: ##
* Instead of doing nothing when no avatar_id is passed, we use Secure.random() 
  to generate a random avatar for the caller.
* We provided both a class and an instance interface.
* Some logic optimizations were made, when and where it was easily doable.

## How to use: ##

1.> Download the multiavatar.rb file

2.> Load the class into your code
```
load 'multiavatar.rb'
```

3.> Do any of the following to generate an avatar.

You can use the quick class method to generate an avatar via the call:
```
avatar_svg = Multiavatar.generate([avatar_id],[sans_env=false],[themes={}])
```
Or as an instance via:
```
  object_mavatar = Multiavatar.new([avatar_id],[sans_env=false],[themes={}])
  avatar_svg = object_mavatar.avatar
```
Then re-use instance if you like to make more:
```
  object_mavatar.generate()
```

Invoke via a class method, using a randomly generated avatar_id:
```
  av = Multiavatar.generate()
  puts "Class method with no avatar_id: #{av}"
```

Invoke via an instance method, using a randomly generated avatar_id:
```
  ob_av = Multiavatar.new()
  puts "Instance with no avatar_id: #{ob_av.avatar}"
```

Invoke via a class method, using a provided avatar_id:
```
  av = Multiavatar.generate('Robo')
  puts "Class method for avatar_id 'Robo': #{av}"
```

Invoke via an instance method, using a provided avatar_id
```
  ob_av = Multiavatar.new('Robo')
  puts "Instance with for avatar_id 'Robo': #{ob_av.avatar}"
```

Both types of invoke with the sans_env parameter passed to remove background:
```
  av1 = Multiavatar.generate(nil,true) // Keep random avatar generation
  ob_av1 = Multiavatar.new(nil,true).avatar // Keep random avatar generation
  av2 = Multiavatar.generate('Robo',true)
  ob_av2 = Multiavatar.new('Robo',true).avatar
```

You can re-use the instance to generate new avatars:
```
  ob_av = Multiavatar.new('Robo')
  av1 = ob_av.avatar
  ob_av.generate('NotRobo')
  av2 = ob_av.avatar
  puts "Avatars are not the same!" if (av1 != av2)
```

Demonstrates that an avatar_id will reliably reproduce the same avatar:
```
  puts "'Robo' avatar_id re-produces same avatar." if Multiavatar.generate('Robo') == Multiavatar.new('Robo').avatar
```

4.> Probably do something like save the SVG to a file:
```
  File.write( 'test_avatar.svg', Multiavatar.generate('Robo') ) 
```

### So long, and thanks for all the fish! ###

### More about us: ###
```
  https://roguesignal.io
  https://github.com/RogueSignalio
  https://scramble.roguesignal.io
```

### Original source project, Multiavatar: ###
```
  Copyright: Gie Katon (2020-2021) (https://giekaton.com)
  URL:      https://multiavatar.com
  Github:   https://github.com/multiavatar/Multiavatar
  Github    https://github.com/multiavatar/multiavatar-php
  Github    https://github.com/multiavatar/multiavatar-python
  License   https://multiavatar.com/license
```

<img src="https://multiavatar.com/press/img/screenshots/screenshot-02.png?v=001">
