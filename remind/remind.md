INCLUDE /home/dale/Repositories/zettelkasten/remind/remind-cal.md
INCLUDE /home/dale/Repositories/zettelkasten/remind/remind-cal2.md
INCLUDE /home/dale/Repositories/zettelkasten/remind/remind-bd.md
INCLUDE /home/dale/Repositories/zettelkasten/remind/remind-drs.md
INCLUDE /home/dale/Repositories/zettelkasten/remind/remind-lit.md
SET Week_2 8
SET Week_3 15
SET Week_4 22
SET RED "SPECIAL COLOR 225 0 0"
REM Jan 1 MSG Remind every year on new years day
REM December 25 +30 MSG Christmas  %b
REM Nov Thu [Week_4] SPECIAL COLOR 255 0 0 Thanksgiving Day %b
; show sunrise/sunset Palm Harbor
SET $LongDeg 82
SET $LongMin 45
SET $LongSec 49
SET $LatDeg 28
SET $LatMin 4
SET $LatSec 41
REM Mon 1 MSG sunrise at [sunrise(trigdate())], sunset at [sunset(trigdate())]
;, next full moon at [moontime(2)] on [moondate(2)]%
; holidays
REM Sun Jun [Week_3] +14 MSG Father's Day %b%
REM Sun May [Week_2] +14 MSG Mother's Day %b%
REM July 4 +2 MSG Independence Day in the USA %b%
REM Sun Mar 8 ++2 MSG Daylight Saving Time starts in the USA %b%
REM SUN Nov 1 ++2 MSG Daylight Saving Time ends in the USA %b%
; prettify the sunrise/sunset/moon data
;fset _srtd() coerce("STRING", _no_lz(_am_pm(sunrise(today()))))
;fset _srtd() coerce("STRING", (sunrise(today())))
;fset _sstd() coerce("STRING", (sunset(today())))
;fset _srtm() coerce("STRING", _no_lz(_am_pm(sunrise(today()+1))))
;fset _sstm() coerce("STRING", _no_lz(_am_pm(sunset(today()+1))))
;fset sunup (sunrise())  
;MSG Sun is up today from [_srtd()] to [_sstd()].%"%"%
;MSG Sun is up today from [_srtd()]%2%  to [_sstd()].%"%"%
;MSG Next full moon: [mon(moondate(2))] [day(moondate(2))], [year(moondate(2))].
;MSG Next ? moon: [mon(moondate(1))] [day(moondate(1))], [year(moondate(1))].%"%"%
; MSG Next new moon: [mon(moondate(0))] [day(moondate(0))], [year(moondate(0))].%"%"%
REM [moondate(0)] SPECIAL MOON 0 -1 -1 [moontime(0)]
REM [moondate(1)] SPECIAL MOON 1 -1 -1 [moontime(1)]
REM [moondate(2)] SPECIAL MOON 2 -1 -1 [moontime(2)]
REM [moondate(3)] SPECIAL MOON 3 -1 -1 [moontime(3)]
