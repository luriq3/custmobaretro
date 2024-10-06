
















































































setDefaultTab("Main")

UI.Separator()
local version = " RETRO"
local nick = "DBO".. version
local Nome = UI.Label(nick)

modules.game_textmessage.displayGameMessage("["..nick.."] WELCOME!")

local cores = {"green", "red", "black", "green", "orange"}
local cores2 = 0
macro(50, function()
  cores2 = cores2==#cores and 0 or cores2+1 -- s2 <3
  Nome:setColor(cores[cores2]) -- s2 <3
end)


UI.Separator()

macro(500, function()
  for i, spec in ipairs(getSpectators()) do
    if spec then
      spec:setText("\n" .. "\n" .. "\n" .. "\n" .. "\n" .. spec:getHealthPercent().."%")
    end
  end
end)


local loadPanelName = "Restart"
local cores = {"pink", "white", "green", "red", "blue"}
local cores2 = 0

local ui = setupUI([[
Panel
  height: 20

  Button
    id: editLoad
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 23
    text: Restart
    tooltip: Clique Para Recarregar

]], parent)

ui.editLoad.onClick = function(widget)
    reload()
end

macro(250, function()
    cores2 = cores2 == #cores and 1 or cores2 + 1
    ui.editLoad:setColor(cores[cores2])
end)

UI.Separator()






local riquescripts = addLabel("BRIGA", "BRIGA")
riquescripts:setColor("orange")

macro(100, "Sense Target", function()
if sense then 
say('sense "' .. sense )
end
end)


macro(50, function() if g_game.isAttacking() and g_game.getAttackingCreature():isPlayer() then sense = g_game.getAttackingCreature():getName() end end)


Turn = {}

Turn.maxDistance = {x = 7, y = 7}
Turn.minDistance = 1
Turn.macro = macro(100, 'ENCARAR', function()
    local target = g_game.getAttackingCreature()
    if target then
        local targetPos = target:getPosition()
        if targetPos then
            local pos = pos()
            local targetDistance = {x = math.abs(pos.x - targetPos.x), y = math.abs(pos.y - targetPos.y)}
            if not (targetDistance.x > Turn.minDistance and targetDistance.y > Turn.minDistance) then
                if targetDistance.x <= Turn.maxDistance.x and targetDistance.y <= Turn.maxDistance.y then
                    local playerDir = player:getDirection()
                    if targetDistance.y >= targetDistance.x then
                        if targetPos.y > pos.y then
                            return playerDir ~= 2 and turn(2)
                        else
                            return playerDir ~= 0 and turn(0)
                        end
                    else
                        if targetPos.x > pos.x then
                            return playerDir ~= 1 and turn(1)
                        else
                            return playerDir ~= 3 and turn(3)
                        end
                    end
                end
            end
        end
    end
end)

local bugMapMobile = {}
local cursorWidget = g_ui.getRootWidget():recursiveGetChildById('pointer')
local initialPos = { x = cursorWidget:getPosition().x / cursorWidget:getWidth(), y = cursorWidget:getPosition().y / cursorWidget:getHeight() }
local availableKeys = { ['Up'] = { 0, -6 }, ['Down'] = { 0, 6 }, ['Left'] = { -7, 0 }, ['Right'] = { 7, 0 }}
function bugMapMobile.logic() 
    local pos = pos()
    local keypadPos = { x = cursorWidget:getPosition().x / cursorWidget:getWidth(), y = cursorWidget:getPosition().y / cursorWidget:getHeight() }
    local diffPos = { x = initialPos.x - keypadPos.x, y = initialPos.y - keypadPos.y }
     if (diffPos.y < 0.46 and diffPos.y > -0.46) then 
        if (diffPos.x > 0) then 
            pos.x = pos.x + availableKeys['Left'][1]
        elseif (diffPos.x < 0) then 
            pos.x = pos.x + availableKeys['Right'][1]
        else 
            return 
        end 
        elseif (diffPos.x < 0.46 and diffPos.x > -0.46) then 
            if (diffPos.y > 0) then 
                pos.y = pos.y + availableKeys['Up'][2] 
            elseif (diffPos.y < 0) then 
                pos.y = pos.y + availableKeys['Down'][2]
            else return
             end 
            end 
        local tile = g_map.getTile(pos)
         if (not tile) then
        return
      end 
    g_game.use(tile:getTopUseThing())
end 

bugMapMobile.macro = macro(1, "Bug Map", bugMapMobile.logic)













macro(200, "COMBO", function()
 if g_game.isAttacking() then
 say(storage.Magia1, 1600)
 say(storage.Magia2, 1600)
 say(storage.Magia3, 1600)
 say(storage.Magia4, 1600)
 end
end)


macro(200, "T A R G E T", nil, function()
  if g_game.isAttacking() 
then
 oldTarget = g_game.getAttackingCreature()
  end
  if (oldTarget and oldTarget:getPosition()) 
then
 if (not g_game.isAttacking() and getDistanceBetween(pos(), oldTarget:getPosition()) <= 8) then

if (oldTarget:getPosition().z == posz()) then
        g_game.attack(oldTarget)
      end
    end
  end
end)

onKeyDown(function(keys)
 
if keys == "Escape" then
    oldTarget = nil
g_game.cancelAttack()
  end
end)


local riquescripts2 = addLabel("USER'S", "USER'S")
riquescripts2:setColor("orange")


macro(200, "Anti Red", function()
  if not g_game.isAttacking() then return end
  local playerCheck = false
  for s, spec in pairs(getSpectators(false)) do
    if spec ~= player and spec:isPlayer() then
      playerCheck = true
    break
    end
   end

  if playerCheck then
    say(storage.antidropfast)
  else
    say(storage.antidroparea)
  end
end)


macro(250, "Dance", function()

    turn(math.random(0, 3))

 end, warTab)



staminaRefinarEM = tonumber(storage.hora)
idDaStamina = tonumber(storage.id)

macro(50, 'Stamine', function()
    if stamina() <= staminaRefinarEM * 60 then
        useWith(idDaStamina, player)
        return delay(500)
    end
end)

local checkAol = storage.idDoAol
macro(3000, "Comprar AOL", function()
  if getFinger() and getFinger():getId(checkAol) then return end
  say(storage.buyaol)
end)




local configBuff = {
    spell = storage.buffzmagia;
    cooldown = storage.buffzcd;
}

buffz = macro(100, "BUFFS", function()
    if isInPz() then
        return;
    end
    if (not configBuff.cooldownBuff or (configBuff.cooldownBuff <= os.time())) then
        say(configBuff.spell);
    end
end);


if type(storage.moneyItems) ~= "table" then
  storage.moneyItems = {3031, 3035}
end
macro(1000, "Change Money", function()
  if not storage.moneyItems[1] then return end
  local containers = g_game.getContainers()
  for index, container in pairs(containers) do
    if not container.lootContainer then
      for i, item in ipairs(container:getItems()) do
        if item:getCount() == 100 then
          for m, moneyId in ipairs(storage.moneyItems) do
            if item:getId() == moneyId.id then
              return g_game.use(item)
            end
          end
        end
      end
    end
  end
end)



macro(250, "Follow", function()
   if g_game.isOnline() and g_game.isAttacking() then
         g_game.setChaseMode(1)
           end
           end)













UI.Button("Friends", function()
  UI.MultilineEditorWindow(storage.FriendText or "", {title="List Friend", description="Adicionados", width=250, height=200}, function(text)
      storage.FriendText = text
      reload()
  end)
end)


isAmigo = function(name)
  if type(name) ~= 'string' then
      name = name:getName()
  end
  local tabela = storage.FriendText and storage.FriendText:split('\n') or {}
  return table.find(tabela, name:trim(), true) ~= nil
end


local enemyMacro = macro(50, 'Enemy', function() 
  local possibleTarget = nil
  local possibleTargetHP = 100 

  for _, creature in ipairs(getSpectators(posz())) do
      local specHP = creature:getHealthPercent()
      if creature:isPlayer() and specHP and specHP > 0 then
          if not isAmigo(creature) and creature:getEmblem() ~= 1 then
              if creature:canShoot(9) then
                  if not possibleTarget or possibleTargetHP > specHP or (possibleTargetHP == specHP and possibleTarget:getId() < creature:getId()) then
                      possibleTarget = creature
                      possibleTargetHP = specHP
                  end
              end
          end
      end
  end

  if possibleTarget and g_game.getAttackingCreature() ~= possibleTarget then
      g_game.attack(possibleTarget)
  end
end)



setDefaultTab("Tools")

macro(100, "Invit PT", function()
for i,v in ipairs (getSpectators(posz())) do
    if v ~= player and v:isPlayer() and v:getShield() == 0 and v:getEmblem() == 1 then
        g_game.partyInvite(v:getId())
    end
end
end)



macro(100, "Accept PT", function()
for i,v in ipairs (getSpectators(posz())) do
    if v ~= player and v:isPlayer() and v:getShield() == 1 and v:getEmblem() == 1 then
        g_game.partyJoin(v:getId())
    end
end
end)

if type(storage.manatrainer) ~= "table" then
  storage.manatrainer = {on=false, title="mana%", text="Power Down", min=0, max=90}
end

for _, healingInfos in ipairs({storage.manatrainer}) do
  local healingmacro = macro(20, function()
    local mana = manapercent()
    if healingInfos.max <= mana and mana >= healingInfos.min then
      if TargetBot then 
        TargetBot.saySpell(healingInfos.text)
      else
        say(healingInfos.text)
      end
    end
  end)
  healingmacro.setOn(healingInfos.on)

  UI.DualScrollPanel(healingInfos, function(widget, newParams) 
    healingInfos = newParams
    healingmacro.setOn(healingInfos.on)
  end)
end 


local castBelowHp = 70 

mystic60 = macro(100, "Defense/Cancel",  function()
  if (hppercent() < castBelowHp and not hasManaShield()) then
    say('Mystic Defense') 
  end
  if (hppercent() >= castBelowHp and hasManaShield()) then
    say('Mystic Cancel')
  end
end,hpPanel5)



local panelName = "codPan"
local codPanel = setupUI([[
Panel
  id: healingPanel
  height: 50
  margin-top: 3

  Label
    id: label2
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    margin: 0 5 0 5
    text-align: center

  HorizontalScrollBar
    id: scroll1
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: prev.bottom
    margin-top: 5
    minimum: 1
    maximum: 100
    step: 1

]])

if not storage[panelName] then
    storage[panelName] = {
        hpPercent = castBelowHp 
    }
end
    
codPanel.scroll1.onValueChange = function(scroll, value)
  castBelowHp = value 
  storage[panelName].hpPercent = value 
  codPanel.label2:setText("MYSTIC%" .. castBelowHp)
end


codPanel.scroll1:setValue(storage[panelName].hpPercent or castBelowHp)




UI.Separator()
local riquescriptstrg = addLabel("STORAGES:", "STORAGES:")
riquescriptstrg:setColor("orange")
UI.Separator()

local moneyContainer = UI.Container(function(widget, items)
  storage.moneyItems = items
end, true)
moneyContainer:setHeight(35)
moneyContainer:setItems(storage.moneyItems)

UI.Label('ANTIRED'):setColor('green')
addTextEdit("Magias", storage.antidropfast or "Fast", function(widget, text)
  storage.antidropfast = text;
end)

UI.Label('Area:')
addTextEdit("Area", storage.antidroparea or "Magia de Area", function(widget, text)
  storage.antidroparea = text;
end)

UI.Label('Stamina>Hora Pra usar')
addTextEdit("hora", storage.hora or "usar em", function(widget, text) 
storage.hora = text
end)
UI.Label('Id Da Stamina')
addTextEdit("id", storage.id or "id stamina", function(widget, text) 
storage.id = text
end)
UI.Label('Id Do Aol')
addTextEdit("idAOL", storage.idDoAol or "id do aol", function(widget, text) 
storage.idDoAol = text
end)
UI.Label('Comando>!bol/!jam')
addTextEdit("buyaol", storage.buyaol or "Comprar", function(widget, text) 
storage.buyaol = text
end)
UI.Separator()
UI.Label("COMBO")

addTextEdit("Magia1", storage.Magia1 or "Magia1", function(widget, text) storage.Magia1 = text
end)

addTextEdit("Magia2", storage.Magia2 or "Magia2", function(widget, text) storage.Magia2 = text
end)

addTextEdit("Magia3", storage.Magia3 or "Magia3", function(widget, text) storage.Magia3 = text
end)


addTextEdit("Magia4", storage.Magia4 or "Magia4", function(widget, text) storage.Magia4 = text
end)
