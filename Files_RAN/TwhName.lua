local function ooouo_RaN(msg)
local text = msg.content_.text_
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
if text and text:match("^وضع توحيد (.*)$") and Owner(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local teh = text:match("^وضع توحيد (.*)$")
send(msg.chat_id_, msg.id_,'⌔︙تم تعيين '..teh..' كتوحيد للمجموعه')
database:set(bot_id.."RAN:teh"..msg.chat_id_,teh)
end
if text and text:match("^تعين عدد الكتم (.*)$") and Owner(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local nump = text:match("^تعين عدد الكتم (.*)$")
send(msg.chat_id_, msg.id_,'⌔︙تم تعين  '..nump..' عدد الكتم')
database:set(bot_id.."RAN:nump"..msg.chat_id_,nump)
end
if text == "التوحيد" then
local s1 = database:get(bot_id.."RAN:teh"..msg.chat_id_) or "لا يوجد توحيد"
local s2 = database:get(bot_id.."RAN:nump"..msg.chat_id_) or 5
send(msg.chat_id_, msg.id_,'⌔︙التوحيد هو '..s1..'\n ⌔︙ عدد الكتم هو : '..s2)
end
end
if text == "تفعيل التوحيد" and Constructor(msg) then
send(msg.chat_id_, msg.id_, '⌔︙تم تفعيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"open")
end
if text == "تعطيل التوحيد" and Constructor(msg) then
send(msg.chat_id_, msg.id_, '⌔︙تم تعطيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"close")
end
if not Constructor(msg) then
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open"  and database:get(bot_id.."RAN:teh"..msg.chat_id_) then 
id = msg.sender_user_id_
function amir_RaN_new(RaN1,RaN2)
if RaN2 and RaN2.first_name_ then 
if RaN2.first_name_:match("(.*)"..database:get(bot_id.."RAN:teh"..msg.chat_id_).."(.*)") then 
database:srem(bot_id.."RAN:Muted:User"..msg.chat_id_, msg.sender_user_id_)
else
local RaN_nnn = database:get(bot_id.."RAN:nump"..msg.chat_id_) or 5
local RaN_nnn2 = database:get(bot_id.."RAN:nump22"..msg.chat_id_..msg.sender_user_id_) or 0
if (tonumber(RaN_nnn2) == tonumber(RaN_nnn) or tonumber(RaN_nnn2) > tonumber(RaN_nnn)) then 
database:sadd(bot_id.."RAN:Muted:User"..msg.chat_id_, msg.sender_user_id_)
else 
database:incrby(bot_id.."RAN:nump22"..msg.chat_id_..msg.sender_user_id_,1)
send(msg.chat_id_, msg.id_, "⌔︙عزيزي >>["..RaN2.username_.."](https://t.me/"..(RaN2.username_ or "RaNteam")..")\n⌔︙عليك وضع التوحيد ~⪼ {`"..database:get(bot_id.."RAN:teh"..msg.chat_id_).."`} بجانب اسمك\n⌔︙عدد المحاولات المتبقيه {"..(tonumber(RaN_nnn) - tonumber(RaN_nnn2)).."}")
end
end
end
end
getUser(id, amir_RaN_new)
end
end
end
return {
RAN = ooouo_RaN,
}
