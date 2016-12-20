local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_LOGIN")

Frame:SetScript("OnEvent", function(...)

function getCurrentRank(CurrentRP)
 
CRank = 0;
 
    if(CurrentRP < 65000) then CRank = 14; end;
    if(CurrentRP < 60000) then CRank = 13; end;
    if(CurrentRP < 55000) then CRank = 12; end;
    if(CurrentRP < 50000) then CRank = 11; end;
    if(CurrentRP < 45000) then CRank = 10; end;
    if(CurrentRP < 40000) then CRank = 9; end;
    if(CurrentRP < 35000) then CRank = 8; end;
    if(CurrentRP < 30000) then CRank = 7; end;
    if(CurrentRP < 25000) then CRank = 6; end;
    if(CurrentRP < 20000) then CRank = 5; end;
    if(CurrentRP < 15000) then CRank = 4; end;
    if(CurrentRP < 10000) then CRank = 3; end;
    if(CurrentRP < 5000) then CRank = 2; end;
    if(CurrentRP < 2000) then CRank = 1; end;
    if(CurrentRP < 500) then CRank = 0; end;
 
    return CRank;
 
end;
 
function getCurrentHP(CurrentRP)
 
CRank = 0;
    if(CurrentRP == 14) then CRank = 60000; end;
    if(CurrentRP == 13) then CRank = 55000; end;
    if(CurrentRP == 12) then CRank = 50000; end;
    if(CurrentRP == 11) then CRank = 45000; end;
    if(CurrentRP == 10) then CRank = 40000; end;
    if(CurrentRP == 9) then CRank = 35000; end;
    if(CurrentRP == 8) then CRank = 30000; end;
    if(CurrentRP == 7) then CRank = 25000; end;
    if(CurrentRP == 6) then CRank = 20000; end;
    if(CurrentRP == 5) then CRank = 15000; end;
    if(CurrentRP == 4) then CRank = 10000; end;
    if(CurrentRP == 3) then CRank = 5000; end;
    if(CurrentRP == 2) then CRank = 2000; end;
    if(CurrentRP == 1) then CRank = 500; end;
 
    return CRank;
 
end;

function MorunoRank()
 
    PercentPVPRank=math.floor(GetPVPRankProgress(target)*100);
    UPVPRank=UnitPVPRank("player");
    hk, CPLast = GetPVPThisWeekStats();
    CurrentRP=(UPVPRank-6)*5000+5000*PercentPVPRank/100;
    NeededRPToNextRank=(UPVPRank-5)*5000-CurrentRP*0.8;
   
    CurrentRank = getCurrentRank(CurrentRP);
 
    RA = CurrentRP;
   
    if(CPLast<910) then CPup=0;CPlo=0;RPup=0;RPlo=0;end;
    if(CPLast<2539 and CPLast>910) then CPup=2539;CPlo=910;RPup=1000;RPlo=400;end;
    if(CPLast<5231 and CPLast>2539) then CPup=5231;CPlo=2539;RPup=2000;RPlo=1000;end;
    if(CPLast<9221 and CPLast>5231) then CPup=9221;CPlo=5231;RPup=3000;RPlo=2000;end;
    if(CPLast<15491 and CPLast>9221) then CPup=15491;CPlo=9221;RPup=4000;RPlo=3000;end;
    if(CPLast<23369 and CPLast>15491) then CPup=23369;CPlo=15491;RPup=5000;RPlo=4000;end;
    if(CPLast<36958 and CPLast>23369) then CPup=36958;CPlo=23369;RPup=6000;RPlo=5000;end;
    if(CPLast<54408 and CPLast>36958) then CPup=54408;CPlo=36958;RPup=7000;RPlo=6000;end;
    if(CPLast<76316 and CPLast>54408) then CPup=76316;CPlo=54408;RPup=8000;RPlo=7000;end;
    if(CPLast<120420 and CPLast>76316) then CPup=120420;CPlo=76316;RPup=9000;RPlo=8000;end;
    if(CPLast<164960 and CPLast>120420) then CPup=164960;CPlo=120420;RPup=10000;RPlo=9000;end;
    if(CPLast<226508 and CPLast>164960) then CPup=226508;CPlo=164960;RPup=11000;RPlo=10000;end;
    if(CPLast<315119 and CPLast>226508) then CPup=315119;CPlo=226508;RPup=12000;RPlo=11000;end;
    if(CPLast<431492 and CPLast>315119) then CPup=431492;CPlo=315119;RPup=13000;RPlo=12000;end;
 
    RB =(CPLast - CPlo) / (CPup - CPlo) * (RPup - RPlo) + RPlo;
    RC = 0.2 * RA;
 
    EEarns = math.floor(RA + RB - RC);
    EarnedRank = getCurrentRank(EEarns);
    PercentNextPVPRank=math.floor(((EEarns-getCurrentHP(EarnedRank))*100)/(getCurrentHP(UPVPRank+1)-getCurrentHP(UPVPRank)));
   
    if(PercentNextPVPRank<0) then PercentNextPVPRank=PercentNextPVPRank*-1;end;
 
    SendChatMessage("Current RP: "..CurrentRP.." at "..PercentPVPRank.."% (Rank "..CurrentRank..") RP To Next Rank: "..NeededRPToNextRank.." This Week RP Gained:"..math.floor(RB).." @ Total RP Calculation: "..EEarns.." at "..PercentNextPVPRank.."%(Rank "..EarnedRank..")","emote");
   
end

end)
