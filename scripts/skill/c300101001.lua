--Ectoplasmic Fortification!
local s,id=GetID()
function s.initial_effect(c)
    --Activate
    aux.AddSkillProcedure(c,2,false,nil,nil)
    local e1=Effect.CreateEffect(c)
    e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
    e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
    e1:SetCode(EVENT_STARTUP)
    e1:SetCountLimit(1)
    e1:SetRange(0x5f)
    e1:SetOperation(s.op)
    c:RegisterEffect(e1)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
    Duel.LoadScript("extra_constant.lua")
    Duel.Hint(HINT_SKILL_FLIP,tp,id|(1<<32))
    Duel.Hint(HINT_CARD,tp,id)
     --Opponent must reveal all cards drawn during their Draw Phase
    local e1=Effect.CreateEffect(e:GetHandler())
    e1:SetType(EFFECT_TYPE_FIELD)
    e1:SetCode(EFFECT_MR3_PENDULUM)
    e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTarget(aux.TRUE)
    e1:SetTargetRange(1,1)
    Duel.RegisterEffect(e1,tp)
end