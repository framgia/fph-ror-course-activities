scene = 'opening'
while true
  case scene
  when 'opening'
    puts 'There are three parting roads. Which way will you proceed?'
    puts "  1 Left road"
    puts "  2 Middle road"
    puts "  3 Right road"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'left'
    when 2
      scene = 'center'
    when 3
      scene = 'right'
    end
  when 'left'
    puts 'Ah！'
    sleep 1
    puts 'I fell into a pitfall'
    puts '〜 GAME OVER 〜'
    exit # Programming end
  when 'center'
    puts 'As I walk down the middle road ……'
    sleep 1
    puts 'I found a treasure box.！'
    puts "  1 Leave as it is"
    puts "  2 Oplen as it is"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'leave'
    when 2
      scene = 'ending'
    end
  when 'right'
    puts 'After walking for a while, I returned to the original place.'
    sleep 1
    scene = 'opening'
  when 'leave'
    puts 'I did not look into the treasure box and went home.'
    puts '〜 GAME OVER 〜'
    exit # Programming end
  when 'ending'
    puts 'cracked open'
    sleep 1
    puts 'The dazzling light overflows……'
    sleep 1
    puts 'I got 100 gold coins!'
    sleep 2
    puts '〜 CONGRATULATIONS! 〜'
    sleep 2
    puts '    Scenario Ivan'
    sleep 2
    puts '    Program  Ivan'
    sleep 2
    puts '      〜 END 〜'
    exit # Programming end
  end
end
