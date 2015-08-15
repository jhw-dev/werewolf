
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"
MainScene.RESOURCE_BINDING={startBtn={varname="startBtn"}}

function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    self:resetSetSceneSize()
    
    local socket = self.app_:getSocket()
    socket:register(1002,function(data)
        local node = self.app_:createView("GameScene")
        local scene = display.newScene("GameScene")
        scene:addChild(node)
        local transition=cc.TransitionMoveInR:create(0.5,scene)
        cc.Director:getInstance():replaceScene(transition)
    end)
    
    local startBtn = self.startBtn
    self.startBtn:addTouchEventListener(function(sender,type)
        if type==TOUCH_EVENT_ENDED then
--          
            startBtn:setTouchEnabled(false)
            startBtn:setTitleText("正在等待其他成员的加入，请稍后!!!")
            socket:send(1001)
        end
    end)
     
    
   
   
        
        
--        for var=1, 8 do
--        local Card = new Card("res/Node.csb")
--        addChild(card)
--        end
       
        
        
        
--    socket:sendString("Test")
    
--    if nil ~= wsSendText then 
--        wsSendText:registerScriptHandler(wsSendTextOpen,cc.WEBSOCKET_OPEN) 
--        wsSendText:registerScriptHandler(wsSendTextMessage,cc.WEBSOCKET_MESSAGE) 
--        wsSendText:registerScriptHandler(wsSendTextClose,cc.WEBSOCKET_CLOSE) 
--        wsSendText:registerScriptHandler(wsSendTextError,cc.WEBSOCKET_ERROR) 
--    end 
--    socket:registerScriptHandler(handler,type)
end

return MainScene
