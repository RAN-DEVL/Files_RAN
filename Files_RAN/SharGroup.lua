local function Shaar(msg)
local text = msg.content_.text_
if text then
if text == 'تفعيل تنبيه الاشعار' and Owner(msg) then
send(msg.chat_id_, msg.id_,'⌔︙ تم تفعيل التنبيه عل شعار  !')
database:set(bot_id..'RAN:SH:BOT'..msg.chat_id_,true)
return false
end
if text == 'تعطيل تنبيه الاشعار' and Owner(msg) then
send(msg.chat_id_, msg.id_,'⌔︙ تم تعطيل التنبيه عل شعار  !')
database:del(bot_id..'RAN:SH:BOT'..msg.chat_id_)
return false
end
if text and text:match('^وضع الشعار (.*)$') and Owner(msg) then
local SHGP = text:match('^وضع الشعار (.*)$')
database:set(bot_id..'RAN:SH:BOT:GP'..msg.chat_id_,SHGP)
send(msg.chat_id_, msg.id_,'⌔︙تم حفظ شعار المجموعه \n')
end
end
if text and database:get(bot_id..'RAN:SH:BOT'..msg.chat_id_) and not Owner(msg) then
if tonumber(database:get(bot_id..'RAN:SH:NUM'..msg.chat_id_..msg.sender_user_id_) or 0) > 3 then
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
send(msg.chat_id_, msg.id_,'⌔︙ تم طردك من المجموعة لعدم احترام قوانين المجموعة')
database:del(bot_id..'RAN:SH:NUM'..msg.chat_id_..msg.sender_user_id_)
else
tdcli_function ({ID = 'GetUser',user_id_ = msg.sender_user_id_},function(arg,data) 
local last_ = data.last_name_ or ''
local first_ = data.first_name_ or ''
local amir = (first_..''..last_)
local amir1 = (database:get(bot_id..'RAN:SH:BOT:GP'..msg.chat_id_) or '')
if string.find(amir,amir1) == nil then
local amir = tonumber((database:get(bot_id..'RAN:SH:NUM'..msg.chat_id_..msg.sender_user_id_) or 0))
if amir == 1 then
send(msg.chat_id_, msg.id_,'\n⌔︙ عليك وضع شعار المجموعه لديك {3} محاولات وعند انتهاء المحاولات سيتم طردك الشعار {`'..amir1..'`}')
elseif amir == 2 then
send(msg.chat_id_, msg.id_,'\n⌔︙ عليك وضع شعار المجموعه لديك {2} محاولات وعند انتهاء المحاولات سيتم طردك الشعار {`'..amir1..'`}')
elseif amir == 3 then
send(msg.chat_id_, msg.id_,'\n⌔︙ عليك وضع شعار المجموعه لديك اخر محاولات لوضع الشعار {`'..amir1..'`}')
end
database:incrby(bot_id..'RAN:SH:NUM'..msg.chat_id_..msg.sender_user_id_,1)
end
end,nil)  
return false
end
end

end
return {
RAN = Shaar
}
