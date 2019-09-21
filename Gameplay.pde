public void play()
{  
  textAlign(CENTER, CENTER);
  if(mode == 0 && !inTransition) // Victory
  {
    if(p[1].HP <= 0 || p[2].HP <= 0)
    {
      transitionTime = 0; inTransition = true; transitionToMode = 10;
    }
  }
  checkDeaths();
  draggingCards();
  if(needToFinishAnimate)
    finishAnimate();
  if(inAnimation)
    aniTimer++;
  if(moveAnimation)
    moveAniTimer++;
  // BASIC GRAPHICS
  background(menuBG);
  
  tint(255, 100);
  image(playFieldIcon, 350, 400);
  noTint();
  
  if(playerSelected && mode == 0) fill(255, 0, 0, 100); else
  fill(#CB9F0C, 200);
  
  if(cardSelected != -1)
    if(!p[playerTurn].hand.get(cardSelected).isSpell && p[playerTurn].cash >= p[playerTurn].hand.get(cardSelected).cost) fill(#CB9F0C, (sin(timer / 10.0) + 1) * 120);
    
  rectMode(CORNER);
  noStroke();
  rect(100, 600, 500, 100);
  
  // Player Attacking
  rectMode(CENTER);
  textSize(14);
  // Shadow
  noStroke();
  fill(100, 190);
  rect(203, 736, 170, 30);
  
  fill(100, 190);
  text("PLAYER "+playerTurn+" (You!)", 203, 736);
  
  // Not Shadow
  if(p[playerTurn].canAttack)
  {
    if(playerTurn == 1)
      fill(#FF5555, 150);
    else 
      fill(#5A55FF, 150);
  }
  else fill(150, 170);
  strokeWeight(3);
  if(p[playerTurn].canAttack)
  {
    if(playerTurn == 1)
      stroke(#C40A04, 150);
    else 
      stroke(#0904C4, 150);
  } else stroke(100, 220);
  
  rect(200, 733, 170, 30);
  if(playerSelected) 
  {
    noStroke();
    fill(0xffFFC400, 150);
    rect(200, 733, 170, 30);
  }
  
  fill(255);
  text("ATTACK WITH PLAYER!", 200, 733);
  
  // 
  
  tint(100, 190);
  image(health, 353, 56, 5 * (sin(timer / 10.00) + 1) + 60, 5 * (sin(timer / 10.00) + 1) + 60);
  image(health, 353, 746, 5 * (sin(timer / 10.00) + 1) + 60, 5 * (sin(timer / 10.00) + 1) + 60);
  noTint();
  image(health, 350, 53, 5 * (sin(timer / 10.00) + 1) + 60, 5 * (sin(timer / 10.00) + 1) + 60);
  image(health, 350, 743, 5 * (sin(timer / 10.00) + 1) + 60, 5 * (sin(timer / 10.00) + 1) + 60);

  noStroke();
  fill(100, 190);
  ellipse(53, 403, 83 + 5 * sin(timer / 13.00), 83 + 5 * sin(timer / 13.00));
  stroke(255);
  strokeWeight(3);
  fill(#FFC548, 190);
  ellipse(50, 400, 80 + 5 * sin(timer / 13.00), 80 + 5 * sin(timer / 13.00));
  
  textSize(24);
  fill(100, 190);
  text("$"+p[playerTurn].cash, 53, 403);
  text(p[playerTurn].HP, 353, 743); 
  text(p[playerTurn % 2 + 1].HP, 353, 53); 
  text("Cards:", 903, 53);
  fill(255);
  text("$"+p[playerTurn].cash, 50, 400);
  text(p[playerTurn].HP, 350, 740); 
  text(p[playerTurn % 2 + 1].HP, 350, 50); 
  text("Cards:", 900, 50);
  
  // You and Opponent
 
  textSize(14);
  // Shadow
  noStroke();
  fill(100, 190);
  rect(203, 56, 150, 30);
  
  fill(100, 190);
  text("PLAYER "+(playerTurn % 2 + 1), 203, 56);
  
  fill(100, 190);
  rect(503, 736, 150, 30);
  
  fill(100, 190);
  text("PLAYER "+playerTurn+" (You!)", 503, 736);
  
  // Not Shadow
  if(playerTurn == 2)
    fill(#FF5555, 150);
  else 
    fill(#5A55FF, 150);
  strokeWeight(3);
  if(playerTurn == 2)
    stroke(#C40A04, 150);
  else 
    stroke(#0904C4, 150);
  rect(200, 53, 150, 30);
  
  fill(255);
  text("PLAYER "+(playerTurn % 2 + 1), 200, 53);
  
  if(playerTurn == 1)
    fill(#FF5555, 150);
  else 
    fill(#5A55FF, 150);
  strokeWeight(3);
  if(playerTurn == 1)
    stroke(#C40A04, 150);
  else 
    stroke(#0904C4, 150);
  rect(500, 733, 150, 30);
  
  fill(255);
  text("PLAYER "+playerTurn+" (You!)", 500, 733);
  
  
  // Back button
  textAlign(CENTER, CENTER);
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(1200 - 50 + 3, 50 + 3, 90, 90); // Shadow
  textSize(20);
  fill(100, 180);
  text("BACK..", 1200 - 50 + 3, 50 + 3);
  
  if(dist(cursorX, cursorY, 1150, 50) < 45) // Highlights Button
    stroke(0xff8FA5FC, 150);
  else
    stroke(255);
  noFill();
  ellipse(1200 - 50, 50, 90, 90); // Real
  fill(255);
  text("BACK..", 1200 - 50, 50);
  
  // Clear card button
  textAlign(CENTER, CENTER);
  strokeWeight(8);
  noFill();
  stroke(100, 180);
  ellipse(900 + 3, 550 + 3, 90, 90); // Shadow
  textSize(12);
  fill(100, 180);
  text("DISCARD & CYCLE ($"+(discardsUsed + 2)+")", 900 + 3, 550 + 3, 100, 100);
  
  if(dist(cursorX, cursorY, 900, 550) < 45) // Highlights Button
    stroke(0xff8FA5FC, 150);
  else
    stroke(255);
  noFill();
  ellipse(900, 550, 90, 90); // Real
  fill(255);
  text("DISCARD & CYCLE ($"+(discardsUsed + 2)+")", 900, 550, 100, 100);
  //900, 550
  // Timer for Game
  strokeWeight(3);
  
  rectMode(CENTER);
  stroke(100, 180);
  fill(100, 180);
  rect(600 + 3, 50 + 3, 120, 30); // Shadow
  
  stroke(255);
  fill(#CB9F0C);
  rect(600, 50, 120, 30); // Real
  
  // Displays Time Left
  
  textSize(16);
  fill(255);
  int minsLeft = timer / 3600;
  int secsLeft = timer / 60 - (minsLeft * 60);
  if(secsLeft >= 10)
    text("Time: "+minsLeft+":"+secsLeft, 600, 50);
  else
  text("Time: "+minsLeft+":0"+secsLeft, 600, 50);
  
  // Drawing the grid
  pushMatrix(); // SHADOW
  translate(3, 3);
  textAlign(CENTER, CENTER);
  strokeWeight(7);
  stroke(100, 190);
  noFill();
  rectMode(CORNER);
  rect(100, 100, 500, 600);
  for(int i = 0; i < 4; i++)
  {
    line(200 + 100 * i, 100, 200 + 100 * i, 700);
  }
  for(int i = 0; i < 5; i++)
  {
    line(100, 200 + 100 * i, 600, 200 + 100 * i);
  }
  popMatrix();
  
  textAlign(CENTER, CENTER); // NOT SHADOW
  stroke(255);
  rectMode(CORNER);
  rect(100, 100, 500, 600);
  for(int i = 0; i < 4; i++)
  {
    line(200 + 100 * i, 100, 200 + 100 * i, 700);
  }
  for(int i = 0; i < 5; i++)
  {
    line(100, 200 + 100 * i, 600, 200 + 100 * i);
  }
  
  rectMode(CENTER);
  strokeWeight(3);
  fill(100, 30);
  strokeWeight(10);
  stroke(100, 190);
  rect(900 + 3, 700 + 3, 400, 130);
  
  fill(100, 190);
  textSize(18);
  text("Round "+p[playerTurn].turn, 900 + 3, 610 + 3);
  textSize(48);
  text("Hand Over Turn!", 900 + 3, 700 + 3);
  
  fill(255, 50);
  strokeWeight(10);
  stroke(255);
  rect(900, 700, 400, 130);
  
  fill(255);
  textSize(18);
  text("Round "+p[playerTurn].turn, 900, 610);
  textSize(48);
  text("Hand Over Turn!", 900, 700);
  
  for(Card c: playField) // Default display positions
  {
    c.displayY = c.y * 100 + 50; if(playerTurn == 2) c.displayY = c.y * -100 + 750;
    c.displayX = c.x * 100 + 50;
  }
  
  ArrayList<moveAnimation> removeMoves = new ArrayList<moveAnimation>();
  boolean finishedAllMoves = true;
  if(moveAnimation) // This (MOVING) is a very different type of animation than everything else. Changes to a new display position
  {
    for(moveAnimation m: moveTargets)
    {
      Card moving = playField.get(m.index);
      if(!m.toSide)
      {
        // Overriding the display positions if the card is being moved
        moving.displayY = m.originalPos * 100 + 50; if(playerTurn == 2) moving.displayY = m.originalPos * -100 + 750;
        int destination = (m.originalPos + m.distance) * 100 + 50; if(playerTurn == 2) destination = (m.originalPos + m.distance) * -100 + 750;
        int multiplier;
        if(m.distance < 0) multiplier = -20; else multiplier = 20;
        if(playerTurn == 2) multiplier *= -1;
        moving.displayY += multiplier * moveAniTimer;
        if(moving.displayY == destination)
            removeMoves.add(m);
          else finishedAllMoves = false;
      }
      else
      {
        moving.displayX = m.originalPos * 100 + 50;
        int destination = (m.originalPos + m.distance) * 100 + 50;
        int multiplier;
        if(m.distance < 0) multiplier = -20; else multiplier = 20;
        moving.displayX += multiplier * moveAniTimer;
        if(moving.displayX == destination)
          removeMoves.add(m);
        else finishedAllMoves = false;
      }
    }
    for(moveAnimation m: removeMoves) // Once each individual move animation is finished, remove it from the target list.
      moveTargets.remove(m);
  }
  
  if(finishedAllMoves)
  {
    moveAnimation = false;
    moveTargets.clear();
  }
  
  // Drawing cards on playfield
  
  for(Card c: playField)
  {
    int atk = c.ATK; int rng = c.RNG; int mvmt = c.MVMT; // Applying temporary card buffs. 
    // Duo Cards which get buffed from other cards
    if(c.name.equals("Joseph"))
      for(Card d: playField)
        if(d.name.equals("Annika") && d.player == c.player)
          atk *= 3;
    if(c.name.equals("A.L.I.C.E."))
      for(Card d: playField)
        if(d.name.equals("Moonlight") && d.player == c.player)
          atk *= 2;
    if(c.name.equals("Ms. Nicke"))
      for(Card d: playField)
        if(d.name.equals("Esther") && d.player == c.player)
          atk += 7;
    if(c.name.equals("Ben"))
      for(Card d: playField)
        if(d.category.contains(2) && d.player == c.player)
          atk++;
    
    if(hasEffect(c, "2X ATK") || hasEffect(c, "2X ATK (Anny)")) atk *= 2;
    if(hasEffect(c, "NVW")) rng++;
    if(hasEffect(c, "Slowdown")) mvmt -= 2; 
    
    if(!hasEffect(c, "NoEffect"))
    {
      for(Card d: playField)
        if(d.name.equals("Ridge Rhea") && !c.name.equals("Ridge Rhea") && !c.name.equals("Ultrabright") && d.player == c.player && d.x == c.x) rng += 2;
      for(Card d: playField)
        if(d.name.equals("Ben") && c.category.contains(2) && d.player == c.player) atk += 3;
      for(Card d: playField)
        if(d.name.equals("Rita") && d.player != c.player) atk = max(0, atk - 2);
    }
    // Setting the display position of the cards being drawn
    
    if(playField.indexOf(c) == playFieldSelected) 
    {
      strokeWeight(20); // Bigger Strokeweight
      stroke(0xffFFC400, 220); 
    }
    else
    {
      strokeWeight(3); // Normal Strokeweight
      stroke(255); 
    }
    
    if(c.player == 1)
      fill(255, 0, 0, 175);
    else
      fill(0, 0, 255, 175);
    rect(c.displayX, c.displayY, 95, 95);

    cardDisplay(c.displayX, c.displayY, 1, c, atk, mvmt, rng);
  }
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  strokeWeight(15);
  if(inAnimation)
    actionAnimate();
      
  // Drawing cards in hand
  for(int i = 0; i < p[playerTurn].hand.size(); i++)
  {
    int x = i % 5 * 120 + 660, y = i / 5 * 120 + 150;
    if(i == cardSelected && p[playerTurn].hand.get(i).cost <= p[playerTurn].cash)
    {
      x = x + cursorX - ogx;
      y = y + cursorY - ogy;
    }
   
    Card c = p[playerTurn].hand.get(i);    
    cardDisplay(x, y, 1, c, 0);
    
    noFill();  noStroke();
    if(p[playerTurn].hand.get(i).cost > p[playerTurn].cash) 
    {
      fill(100, 190);
      rect(x, y, 95, 95);
    }
    
    if(discarding)
    {
      noFill();
      cardSelected = -1;
      strokeWeight(20);
      stroke(0xffFFC400, 150);
      rect(x, y, 95, 95);
    }
  }
  
  if(cardSelected != -1) // Drawing the selected card OVER everything else
  {
    int x = cardSelected % 5 * 120 + 660;
    int y = cardSelected / 5 * 120 + 150;
  
    if(p[playerTurn].hand.get(cardSelected).cost <= p[playerTurn].cash)
    {
      x += cursorX - ogx;
      y += cursorY - ogy;
    }

    strokeWeight(20); // Bigger Strokeweight
    stroke(0xffFFC400, 150); 
    
    noFill();
    rectMode(CENTER);
    rect(x, y, 95, 95);
    
    cardDisplay(x, y, 1, p[playerTurn].hand.get(cardSelected), 0);
    
    fill(100, 100);
    stroke(255);
    strokeWeight(4);
    rect(x, y + 160, 300, 200);
    textSize(12);
    fill(100, 190);
    text(p[playerTurn].hand.get(cardSelected).ability, x + 1, y + 160 + 1, 295, 195);
    fill(255);
    text(p[playerTurn].hand.get(cardSelected).ability, x, y + 160, 295, 195);
    
    int counter = 0;
    for(int i: p[playerTurn].hand.get(cardSelected).category)
    {
      String categName = ""; 
      if(i == 0) categName = "Class G"; else if (i == 1) categName = "Class H"; else if(i == 2) categName = "Elite"; else if(i == 3) categName = "Traveller"; else if(i == 4) categName = "Non-Elite"; else if(i == 5) categName = "Prototype"; else if(i == 6) categName = "Novelty";

      textSize(8);
      noFill();
      stroke(255);
      strokeWeight(1);
      rect(x - 125 + (50 * counter), y + 85, 50, 50);
      
      fill(100, 190);
      text(categName, x - 125 + (50 * counter) + 1, y + 85 + 1); 
      fill(255);
      text(categName, x - 125 + (50 * counter), y + 85); 
      counter++;
    }
    
    if(p[playerTurn].hand.get(cardSelected).isSpell)
    {
      if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("You")) // placed on your own cards
      {
        String name = p[playerTurn].hand.get(cardSelected).name;
        for(Card c: playField)
        {
          if(c.player == playerTurn && !hasEffect(c, "NoEffect") && !(name.equals("Defense Position") && !c.NBTTags.contains("Unhealable")) && !(name.equals("Dragon Wings") && (c.name.equals("Ultrabright"))))
            hitCircle(c.x, c.y);
        }
      }
      else if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("All")) // Can be placed anywhere
      {
        rectMode(CORNER);
        strokeWeight(20); // Bigger Strokeweight
        stroke(0xffFFC400, 150); 
        noFill();
        rect(100, 100, 500, 600);
        rectMode(CENTER);
      } 
      else if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("Opp"))
      {
        for(Card c: playField)
        {
          if(c.player != playerTurn && !hasEffect(c, "NoEffect"))
            hitCircle(c.x, c.y);
        }
      }
    }
  }
  
  // Displaying options for the currently selected card
 
  if(playFieldSelected != -1)  
  {
    if(choice == -1)
    {
      fill(100, 100);
      stroke(255);
      strokeWeight(4);
      rect(900, 400, 300, 200);
      textSize(12);
      fill(100, 190);
      text(playField.get(playFieldSelected).ability, 901, 401, 295, 195); 
      fill(255);
      text(playField.get(playFieldSelected).ability, 900, 400, 295, 195); 
      
      int counter = 0;
      for(Effect e: playField.get(playFieldSelected).effects)
      {
        textSize(8);
        noFill();
        stroke(255);
        strokeWeight(1);
        rect(775 + (50 * counter), 475, 50, 50);
        fill(100, 190);
        text(e.name, 775 + (50 * counter) + 1, 465 + 1); 
        text(e.duration, 775 + (50 * counter) + 1, 485 + 1); 
        fill(255);
        text(e.name, 775 + (50 * counter), 465); 
        text(e.duration, 775 + (50 * counter), 485); 
        counter++;
      }
      
      counter = 0;
      for(int i: playField.get(playFieldSelected).category)
      {
        String categName = ""; 
        if(i == 0) categName = "Class G"; else if (i == 1) categName = "Class H"; else if(i == 2) categName = "Elite"; else if(i == 3) categName = "Traveller"; else if(i == 4) categName = "Non-Elite"; else if(i == 5) categName = "Prototype"; else if(i == 6) categName = "Novelty";
        textSize(8);
        noFill();
        stroke(255);
        strokeWeight(1);
        rect(775 + (50 * counter), 325, 50, 50);
        
        fill(100, 190);
        text(categName, 775 + (50 * counter) + 1, 325 + 1); 
        
        fill(255);
        text(categName, 775 + (50 * counter), 325); 
        counter++;
      }
    }
    
    if(choice == -1 && playField.get(playFieldSelected).player == playerTurn) // Buttons
    {  
      textSize(15); textAlign(CENTER, CENTER);
      // Move
      if(playField.get(playFieldSelected).canMove)
      {
        fill(0xffFF981A);
        stroke(0xff744908);
      } else { stroke(0xff464B4D); fill(0xffB6B8B9); }
      
      strokeWeight(3);
      
      rect(800, 535, 190, 40); if(playField.get(playFieldSelected).canMove) fill(0xff744908); else fill(0xff464B4D); text("Move", 800, 535);
      
      // Attack
      
      if(playField.get(playFieldSelected).attackCount > 0)
      {
        fill(0xffFF4D4D);
        stroke(0xff740808);
      } else { stroke(0xff464B4D); fill(0xffB6B8B9); }
      
      rect(1000, 535, 190, 40); if(playField.get(playFieldSelected).attackCount > 0) fill(0xff740808); else fill(0xff464B4D); text("Attack", 1000, 535);
      
      // Discard
      
      boolean canDiscard = !hasEffect(playField.get(playFieldSelected), "Alive");
      if((playField.get(playFieldSelected).NBTTags.contains("SpecialMove")))
      {
        if(canDiscard)
        {
          fill(0xffB516F5);
          stroke(0xff46095F);
        } else { stroke(0xff464B4D); fill(0xffB6B8B9); }
        
        rect(800, 585, 190, 40); if(canDiscard) fill(0xff46095F); else fill(0xff464B4D); text("Discard (1 Turn)", 800, 585);
      } else {
        if(canDiscard)
        {
          fill(0xffB516F5);
          stroke(0xff46095F);
        } else { stroke(0xff464B4D); fill(0xffB6B8B9); }
        
        rect(900, 585, 190, 40); if(canDiscard) fill(0xff46095F); else fill(0xff464B4D); text("Discard (1 Turn)", 900, 585);
      }
      
      // Special
      
      String pName = playField.get(playFieldSelected).name;
      String displayText = "";
      color darker = 0;
      color lighter = 0;
      if(pName.equals("Hubert")) darker = 0xff095A81; 
      if(pName.equals("Ethan")) darker = 0xff013107;
      if(pName.equals("Ms. Iceberg")) darker = 0xff810945;
      if(pName.equals("Hubert")) lighter = 0xff03ADFF; 
      if(pName.equals("Ethan")) lighter = 0xff36A744;
      if(pName.equals("Ms. Iceberg")) lighter = 0xffFF0582;
      if(pName.equals("Hubert")) displayText = "Heal"; 
      if(pName.equals("Ethan")) displayText = "Bomb";
      if(pName.equals("Ms. Iceberg")) displayText = "Special Attack";
      
      if(playField.get(playFieldSelected).NBTTags.contains("SpecialMove"))
      {
        if(playField.get(playFieldSelected).canSpecial)
        {
          fill(lighter);
          stroke(darker);
        } else { stroke(0xff464B4D); fill(0xffB6B8B9); }
        rect(1000, 585, 190, 40); if(playField.get(playFieldSelected).canSpecial) fill(darker); else fill(0xff464B4D); text(displayText, 1000, 585);
      }
    }
    
    if(choice == 0)
    {
      if(playField.get(playFieldSelected).name.equals("Hubert") && playField.get(playFieldSelected).player == playerTurn)
      {
        for(Card c: playField)
        {
          if(c.player == (playField.get(playFieldSelected).player) && !hasEffect(c, "NoEffect") && !c.NBTTags.contains("Unhealable"))
          {
            hitCircle(c.x, c.y);
          }
        }
      }
      
      if((playField.get(playFieldSelected).name.equals("Ethan") || playField.get(playFieldSelected).name.equals("Ms. Iceberg")) && playField.get(playFieldSelected).player == playerTurn)
      {
        for(Card c: playField)
        {
          if(c.player != (playField.get(playFieldSelected).player) && !hasEffect(c, "NoEffect") && (c.cost < 5 || !playField.get(playFieldSelected).name.equals("Ethan")))
          {
            hitCircle(c.x, c.y);
          }
        }
      }
    }
    if(choice == 1)
    {   
      int mvmt = playField.get(playFieldSelected).MVMT;
      if(hasEffect(playField.get(playFieldSelected), "Slowdown")) mvmt -= 2; 
      // Showing places you can move to. 
      for(int n = 0; n < 4; n++)
      {
        if(n > 1 && !hasEffect(playField.get(playFieldSelected), "SideMove")) break;
        for(int i = 1; i <= mvmt; i++) // Forward Moving
        {
          int mx = playField.get(playFieldSelected).x, my = playField.get(playFieldSelected).y;
          boolean availible = true;
          if(playField.get(playFieldSelected).player != playerTurn)
            break;
          for(Card c: playField)
          {
            if(n == 0)
            {         
              if(c.x == mx && c.y == my - i || my <= i)
                availible = false;
            }
            if(n == 1)
            {
              if(c.x == mx && c.y == my + i || my + i > 6)
                availible = false;
            }
            if(n == 2)
            {
              if(c.x == mx - i && c.y == my || mx <= i)
                availible = false;
            }
            if(n == 3)
            {
              if(c.x == mx + i && c.y == my || mx + i > 5)
                availible = false;
            }
          }
          if(availible)
          {
            int updateY = my; if(n == 0) updateY -= i; if(n == 1) updateY += i;
            int updateX = mx; if(n == 2) updateX -= i; if(n == 3) updateX += i;
            hitCircle(updateX, updateY);
          }
          else break;
        }
      }

    }
    // Attacking 
    if(choice == 2)
    {
      for(int q = 0; q < 4; q++)
      {
        int rng = playField.get(playFieldSelected).RNG;
        for(Card d: playField)
        {
          if(d.name.equals("Ridge Rhea") && !playField.get(playFieldSelected).name.equals("Ridge Rhea") && !playField.get(playFieldSelected).name.equals("Ultrabright") && d.player == playField.get(playFieldSelected).player && d.x == playField.get(playFieldSelected).x) rng += 2;
          if(hasEffect(playField.get(playFieldSelected), "NVW")) rng++;
        }
        // Showing places you can attack 
        for(int i = 1; i <= rng; i++)
        {
          int mx = playField.get(playFieldSelected).x, my = playField.get(playFieldSelected).y;
          boolean canAttack = false;
          boolean availible = true; // Availible doesnt mean that you can attack that spot, it just means that it won't quit.
          boolean cap; if(q == 0) cap = my <= i; else if(q == 1) cap = my + i > 6; else if(q == 2) cap = mx + i > 5; else cap = mx <= i; // If attacking player
          if(q == 0) my -= i; if( q == 1) my += i; if(q == 2) mx += i; if(q == 3) mx -= i;// Where to attack
          if(playField.get(playFieldSelected).player != playerTurn)
            break;
          if(cap)
          {
            boolean firstTurn = true;
            if(playField.get(playFieldSelected).turnPlacedOn != p[playerTurn].turn || (playField.get(playFieldSelected).name.equals("Mr. Pegamah"))) { firstTurn = false;}
            
            if((playerTurn == 1 && q == 0) || (playerTurn == 2 && q == 1))
            {
              if(firstTurn)
                canAttack = false;
              else
                canAttack = true; // Attacking the player 
            }
            availible = false;
          }
          
          for(Card c: playField)
          {
            if(c.x == mx && c.y == my)
            {
              if((!playField.get(playFieldSelected).name.equals("Matthew") && !playField.get(playFieldSelected).name.equals("Ultrabright") && c.player != playerTurn))
                availible = false;
              if(c.player != playerTurn)
                  canAttack = true; // Basically finds closest card that isnt yours. 
              if(hasEffect(c, "Invincible")) canAttack = false;
            }      
          }
          if(canAttack)
          {
            if(cap) 
              hitCircle(3, 0, true);
            else
              hitCircle(mx, my);
          }
          if(!availible)
          {
            break;
          }
        }
      }
    }
  } else choice = -1;

  if(playerSelected)
  {
    for(Card c: playField)
    {
      
      int correctY = 6; if(playerTurn == 2) correctY = 1;
      if(c.y == correctY && c.player != playerTurn)
      {
        hitCircle(c.x, c.y);
      }
    }
  }
  
  if(abilitySelected != -1)
  {
    int condition;
    if(playField.get(abilitySelected).NBTTags.contains("OppTargetedEffect"))
      condition = playField.get(abilitySelected).player % 2 + 1;
    else 
      condition = playField.get(abilitySelected).player;
    for(Card c: playField)
      if (c.player == condition && !hasEffect(c, "NoEffect"))
        hitCircle(c.x, c.y);
  }
}

public void hitCircle(int x, int y)
{
    noFill();
    strokeWeight(15);
    stroke(100, 190);
    if(playerTurn == 1)
      ellipse(x * 100 + 50 + 3, y * 100 + 50 + 3, 80, 80);
    else
      ellipse(x * 100 + 50 + 3, y * -100 + 750 + 3, 80, 80);
    if(playerTurn == 1)
    {
    if((dist(cursorX, cursorY, x * 100 + 50, y * 100 + 50) < 50)) stroke(170, 190); else stroke(255);
    }
    else
    {
    if((dist(cursorX, cursorY, x * 100 + 50, y * -100 + 750) < 50)) stroke(170, 190); else stroke(255);
    }
    if(playerTurn == 1)
      ellipse(x * 100 + 50, y * 100 + 50, 80, 80);
    else
      ellipse(x * 100 + 50, y * -100 + 750, 80, 80);
}
public void hitCircle(int x, int y, boolean ignore)
{
    noFill();
    strokeWeight(15);
    stroke(100, 190);
    ellipse(x * 100 + 50 + 3, y * 100 + 50 + 3, 80, 80);
    if((dist(cursorX, cursorY, x * 100 + 50, y * 100 + 50) < 50)) stroke(170, 190); else stroke(255);
    ellipse(x * 100 + 50, y * 100 + 50, 80, 80);
}
public void cardDisplay(int x, int y, float scale, Card c, int specialCase)
{
  textAlign(CENTER, CENTER);
  
  pushMatrix();
  translate(x, y); // Scaling to the correct scale
  scale(scale);
  
  strokeWeight(3); stroke(255);
  fill(150, 100);
  
  rectMode(CENTER);
  rect(0, 0, 95, 95); // Square Outline
  
  // Icons
  imageMode(CENTER);
  textSize(12);
  int textThickness = (int) (textWidth(c.displayName) / 90) * 20 + 20;
  int co = 0; // Colour
  if(c.category.contains(2)) co = 0xffE51515; if(c.category.contains(4)) co = 0xff529EFF; if(c.category.contains(3)) co = 0xff16BC0B; if(c.category.contains(5)) co = 200; if(c.category.contains(6)) co = 0xffB536F5; 
  if(co != 0)
    fill(co, 190);
  else fill(100, 190);
  
  boolean minimize = false;
  if(specialCase == 1) if(collectionSelected == -1) minimize = true; else if(collection[collectionSelected] != c) minimize = true; // Minimizing in the deck selection
  
  if(c.isSpell || minimize)
    rect(0, 0 - 5, 95, textThickness);
  else
    rect(0, 0 - 20, 95, textThickness);// Name
  ellipse(0, 0 + 42, 30, 30); // Money
  if(!c.isSpell && !minimize)
  {
    image(attack, 0 - 37, 0 + 15, 25, 25);
    image(health, 0 - 12, 0 + 15, 25, 25);
    image(movement, 0 + 12, 0 + 15, 25, 25);
    image(range, 0 + 37, 0 + 15, 25, 25);
  }
  
  // Stats (Text)
  textSize(12);
  fill(100, 190);
  if(!c.isSpell && !minimize)
  {
    textSize(12);
    text(c.displayName, 0 + 1, 0 - 20 + 1, 90, 90);
    textSize(18);
    text(c.ATK, 0 - 37 + 2, 0 + 15 + 2);
    text(c.HP, 0 - 12 + 2, 0 + 15 + 2);
    text(c.MVMT, 0 + 12 + 2, 0 + 15 + 2);
    text(c.RNG, 0 + 37 + 2, 0 + 15 + 2);
  } else text(c.displayName, 0 + 1, 0 - 5 + 1, 90, 90);
  textSize(15);
  text("$"+c.cost, 0 + 1, 0 + 42 + 1);
 
  textSize(12);
  fill(255);
  
  if(!c.isSpell && !minimize)
  {
    textSize(12);
    text(c.displayName, 0, 0 - 20, 90, 90);
    textSize(18);
    text(c.ATK, 0 - 37, 0 + 15);
    text(c.HP, 0 - 12, 0 + 15);
    text(c.MVMT, 0 + 12, 0 + 15);
    text(c.RNG, 0 + 37, 0 + 15);
  } else text(c.displayName, 0, 0 - 5, 90, 90);
  textSize(15);
  
  if(cardSelected != -1) // If the card selected is the card being drawn, and you don't have enough cash.
  {
    if(p[playerTurn].cash < p[playerTurn].hand.get(cardSelected).cost && c == p[playerTurn].hand.get(cardSelected))
      fill(#FF0D00, (sin(timer / 10.0) + 1) * 100 + 40); // A red aura around the money is drawn to suggest that the card is too expensive.
  }
  text("$"+c.cost, 0, 0 + 42);
  popMatrix();
}
public void cardDisplay(int x, int y, float scale, Card c, int atk, int mvmt, int rng) // Displaying a card with special attack, movement, or range.
{
  textAlign(CENTER, CENTER);
  
  pushMatrix();
  translate(x, y); // Scaling to the correct scale
  scale(scale);
  
  strokeWeight(3); stroke(255);
  fill(150, 100);
  
  rectMode(CENTER);
  rect(0, 0, 95, 95); // Square Outline
  
  // Icons
  imageMode(CENTER);
  textSize(12);
  int textThickness = (int) (textWidth(c.displayName) / 90) * 20 + 20;
  int co = 0; // Colour
  if(c.category.contains(2)) co = 0xffE51515; if(c.category.contains(4)) co = 0xff529EFF; if(c.category.contains(3)) co = 0xff16BC0B; if(c.category.contains(5)) co = 200; if(c.category.contains(6)) co = 0xffB536F5; 
  if(co != 0)
    fill(co, 190);
  else fill(100, 190);
  
  if(c.isSpell)
    rect(0, 0 - 5, 95, textThickness);
  else
    rect(0, 0 - 20, 95, textThickness);// Name
  ellipse(0, 0 + 42, 30, 30); // Money
  if(!c.isSpell)
  {
    image(attack, 0 - 37, 0 + 15, 25, 25);
    image(health, 0 - 12, 0 + 15, 25, 25);
    image(movement, 0 + 12, 0 + 15, 25, 25);
    image(range, 0 + 37, 0 + 15, 25, 25);
  }
  
  // Stats (Text)
  textSize(12);
  fill(100, 190);
  if(!c.isSpell)
  {
    textSize(12);
    text(c.displayName, 0 + 1, 0 - 20 + 1, 90, 90);
    textSize(18);
    text(atk, 0 - 37 + 2, 0 + 15 + 2);
    text(c.HP, 0 - 12 + 2, 0 + 15 + 2);
    text(mvmt, 0 + 12 + 2, 0 + 15 + 2);
    text(rng, 0 + 37 + 2, 0 + 15 + 2);
  } else text(c.displayName, 0 + 1, 0 - 5 + 1, 90, 90);
  textSize(15);
  text("$"+c.cost, 0 + 1, 0 + 42 + 1);
 
  textSize(12);
  fill(255);
  
  if(!c.isSpell)
  {
    textSize(12);
    text(c.displayName, 0, 0 - 20, 90, 90);
    textSize(18);
    text(atk, 0 - 37, 0 + 15);
    text(c.HP, 0 - 12, 0 + 15);
    text(mvmt, 0 + 12, 0 + 15);
    text(rng, 0 + 37, 0 + 15);
  } else text(c.displayName, 0, 0 - 5, 90, 90);
  textSize(15);
  
  if(cardSelected != -1) // If the card selected is the card being drawn, and you don't have enough cash.
  {
    if(p[playerTurn].cash < p[playerTurn].hand.get(cardSelected).cost && c == p[playerTurn].hand.get(cardSelected))
      fill(#FF0D00, (sin(timer / 10.0) + 1) * 100 + 40); // A red aura around the money is drawn to suggest that the card is too expensive.
  }
  text("$"+c.cost, 0, 0 + 42);
  popMatrix();
}

public void draggingCards()
{
  int x = cardSelected % 5 * 120 + 660, y = cardSelected / 5 * 120 + 150;
  // Setting x (Position of card that is being dragged)
  if(cardSelected != -1)
  {
    x += cursorX - ogx;
    y += cursorY - ogy;
  }
  
  if(!mousePressed && cardSelected != -1) // When a card is released
  {
    boolean spaceEmpty = true;
    for(int i = 0; i<playField.size(); i++) // Checks if the place which the card is at already contains a card
    {
      if(playerTurn == 1)
      {
        if(((x / 100 - 1) % 5 + 1) == playField.get(i).x && ((y / 100 - 1) + 1) == playField.get(i).y)
          spaceEmpty = false;
      }
      else
      {
        if(((x / 100 - 1) % 5 + 1) == playField.get(i).x && (6 - (y / 100 - 1)) == playField.get(i).y)
          spaceEmpty = false;
      }
    }
    
    if(true) // OOPS
    {
      boolean canPlaceDown = true;

      for(Card c: playField)
      {
        int temp = resetCard(p[playerTurn].hand.get(cardSelected)).cost;
        if(c.name.equals("Snake") && c.player == playerTurn)
        {
          if(temp < 4)
            canPlaceDown = false;
        }
      }
      
      if(p[playerTurn].hand.get(cardSelected).isSpell && p[playerTurn].hand.get(cardSelected).cost <= p[playerTurn].cash && canPlaceDown)
      {
        if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("You")) // placed on your own cards
        {
          String name = p[playerTurn].hand.get(cardSelected).name;
          for(Card c: playField)
          {
            if(c.player == playerTurn && !hasEffect(c, "NoEffect") && !(p[playerTurn].hand.get(cardSelected).NBTTags.contains("AttackBoostSpell") && c.NBTTags.contains("Unbuffable")) && !(name.equals("Defense Position") && c.NBTTags.contains("Unhealable")) && !(name.equals("Dragon Wings") && (c.name.equals("Ultrabright"))))
            {
              int yPos = c.y * 100 + 50; if(playerTurn == 2) yPos = c.y * -100 + 750;
  
              if(dist(c.x * 100 + 50, yPos, cursorX, cursorY) < 50)
              {
                useSpell(p[playerTurn].hand.get(cardSelected).name, playField.indexOf(c));
                p[playerTurn].cash -= p[playerTurn].hand.get(cardSelected).cost;
                if(!p[playerTurn].hand.get(cardSelected).summoned)
                  p[playerTurn].deck.add(resetCard(p[playerTurn].hand.get(cardSelected)));
                p[playerTurn].hand.remove(cardSelected);
                break;
              }
            }
          }
        }
        else if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("All"))
        {
          if(x < 600 && x > 100 && y > 100 && y < 700)
          {
            String name = p[playerTurn].hand.get(cardSelected).name;
            p[playerTurn].cash -= p[playerTurn].hand.get(cardSelected).cost;
            if(!p[playerTurn].hand.get(cardSelected).summoned)
              p[playerTurn].deck.add(resetCard(p[playerTurn].hand.get(cardSelected)));
            p[playerTurn].hand.remove(cardSelected);
            useSpell(playerTurn, name);
          }
        }
        else if(p[playerTurn].hand.get(cardSelected).spellTarget.equals("Opp"))
        {
          for(Card c: playField)
          {
            if(c.player != playerTurn && !hasEffect(c, "NoEffect"))
            {
              int yPos = c.y * 100 + 50; if(playerTurn == 2) yPos = c.y * -100 + 750;
  
              if(dist(c.x * 100 + 50, yPos, cursorX, cursorY) < 50)
              {
                useSpell(p[playerTurn].hand.get(cardSelected).name, playField.indexOf(c));
                p[playerTurn].cash -= p[playerTurn].hand.get(cardSelected).cost;
                if(!p[playerTurn].hand.get(cardSelected).summoned)
                  p[playerTurn].deck.add(resetCard(p[playerTurn].hand.get(cardSelected)));
                p[playerTurn].hand.remove(cardSelected);
                break;
              }
            }
          }
        }
      } 
      else if(x < 600 && x > 100 && y > 600 && y < 700 && p[playerTurn].hand.get(cardSelected).cost <= p[playerTurn].cash && canPlaceDown && spaceEmpty) // Places the card down if it's in a valid spot
      {
        p[playerTurn].cash -= p[playerTurn].hand.get(cardSelected).cost;   
        int tempy;
        if(playerTurn == 1) tempy = (y / 100 - 1) + 1; else tempy = 6 - (y / 100 - 1);

        placeCard(playerTurn, p[playerTurn].hand.get(cardSelected), (x / 100 - 1) % 5 + 1, tempy, false);
        if(!p[playerTurn].hand.get(cardSelected).summoned)
                  p[playerTurn].deck.add(resetCard(p[playerTurn].hand.get(cardSelected)));
        p[playerTurn].hand.remove(cardSelected);
      }
    }
    cardSelected = -1; // Sets no card to be selected
  }
}
