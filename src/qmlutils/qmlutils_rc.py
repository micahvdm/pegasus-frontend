# Resource object code (Python 3)
# Created by: object code
# Created by: The Resource Compiler for Qt version 6.5.1
# WARNING! All changes made in this file will be lost!

from PySide6 import QtCore

qt_resource_data = b"\
\x00\x00\x05p\
/\
/ Pegasus Fronte\
nd\x0a// Copyright \
(C) 2017-2018  M\
\xc3\xa1ty\xc3\xa1s Mustoha\x0a\
//\x0a// This progr\
am is free softw\
are: you can red\
istribute it and\
/or modify\x0a// it\
 under the terms\
 of the GNU Gene\
ral Public Licen\
se as published \
by\x0a// the Free S\
oftware Foundati\
on, either versi\
on 3 of the Lice\
nse, or\x0a// (at y\
our option) any \
later version.\x0a/\
/\x0a// This progra\
m is distributed\
 in the hope tha\
t it will be use\
ful,\x0a// but WITH\
OUT ANY WARRANTY\
; without even t\
he implied warra\
nty of\x0a// MERCHA\
NTABILITY or FIT\
NESS FOR A PARTI\
CULAR PURPOSE. S\
ee the\x0a// GNU Ge\
neral Public Lic\
ense for more de\
tails.\x0a//\x0a// You\
 should have rec\
eived a copy of \
the GNU General \
Public License\x0a/\
/ along with thi\
s program. If no\
t, see <http://w\
ww.gnu.org/licen\
ses/>.\x0a\x0a\x0aimport \
QtQuick 2.0\x0a\x0a\x0aMo\
useArea {\x0a    id\
: root\x0a\x0a    prop\
erty real minSwi\
peLength: vpx(20\
)\x0a\x0a    property \
real startX: 0\x0a \
   property real\
 lastX: 0\x0a    pr\
operty bool acti\
ve: false\x0a\x0a    s\
ignal swipeLeft(\
)\x0a    signal swi\
peRight()\x0a\x0a    p\
ropagateComposed\
Events: true\x0a\x0a  \
  onPressed: {\x0a \
       startX = \
mouse.x;\x0a       \
 lastX = startX;\
\x0a        active \
= true;\x0a    }\x0a\x0a \
   onPositionCha\
nged: {\x0a        \
if (!active)\x0a   \
         return;\
\x0a\x0a        var di\
ff = mouse.x - s\
tartX;\x0a\x0a        \
if (diff < -minS\
wipeLength) {\x0a  \
          active\
 = false;\x0a      \
      swipeLeft(\
);\x0a        }\x0a   \
     else if (mi\
nSwipeLength < d\
iff) {\x0a         \
   active = fals\
e;\x0a            s\
wipeRight();\x0a   \
     }\x0a    }\x0a}\x0a\
\x00\x00\x0a\xbf\
/\
/ Pegasus Fronte\
nd\x0a// Copyright \
(C) 2017  M\xc3\xa1ty\xc3\
\xa1s Mustoha\x0a//\x0a//\
 This program is\
 free software: \
you can redistri\
bute it and/or m\
odify\x0a// it unde\
r the terms of t\
he GNU General P\
ublic License as\
 published by\x0a//\
 the Free Softwa\
re Foundation, e\
ither version 3 \
of the License, \
or\x0a// (at your o\
ption) any later\
 version.\x0a//\x0a// \
This program is \
distributed in t\
he hope that it \
will be useful,\x0a\
// but WITHOUT A\
NY WARRANTY; wit\
hout even the im\
plied warranty o\
f\x0a// MERCHANTABI\
LITY or FITNESS \
FOR A PARTICULAR\
 PURPOSE. See th\
e\x0a// GNU General\
 Public License \
for more details\
.\x0a//\x0a// You shou\
ld have received\
 a copy of the G\
NU General Publi\
c License\x0a// alo\
ng with this pro\
gram. If not, se\
e <http://www.gn\
u.org/licenses/>\
.\x0a\x0a\x0aimport QtQui\
ck 2.8\x0a\x0a/// This\
 item provides a\
n infinitely loo\
ping, autoscroll\
ing view into\x0a//\
/ a taller conte\
nt.\x0a/// You can \
change the scrol\
ling speed (pixe\
ls per second), \
and the\x0a/// addi\
tional delay bef\
ore and after th\
e the animation.\
\x0a/// If the cont\
ent fits into th\
e view, no scrol\
ling happens.\x0aFl\
ickable {\x0a    id\
: container\x0a\x0a   \
 property int sc\
rollWaitDuration\
: 3000\x0a    prope\
rty int pixelsPe\
rSecond: 26\x0a\x0a   \
 function stopSc\
roll() {\x0a       \
 scrollAnimGroup\
.complete();\x0a   \
 }\x0a    function \
restartScroll() \
{\x0a        scroll\
AnimGroup.restar\
t();\x0a    }\x0a\x0a    \
clip: true\x0a    f\
lickableDirectio\
n: Flickable.Ver\
ticalFlick\x0a    c\
ontentWidth: wid\
th\x0a    contentHe\
ight: contentIte\
m.childrenRect.h\
eight\x0a\x0a    prope\
rty int targetY:\
 Math.max(conten\
tHeight - height\
, 0);\x0a\x0a    funct\
ion recalcAnimat\
ion() {\x0a        \
scrollAnimGroup.\
stop();\x0a        \
contentY = 0;\x0a\x0a \
       // the pa\
rameters of the \
sub-animations c\
an't be properly\
\x0a        // chan\
ged by regular b\
inding while the\
 group is runnin\
g\x0a        animSc\
rollDown.to = ta\
rgetY;\x0a        a\
nimScrollDown.du\
ration = (target\
Y / pixelsPerSec\
ond) * 1000;\x0a   \
     animPauseHe\
ad.duration = sc\
rollWaitDuration\
;\x0a        animPa\
useTail.duration\
 = scrollWaitDur\
ation;\x0a\x0a        \
scrollAnimGroup.\
restart();\x0a    }\
\x0a    onTargetYCh\
anged: recalcAni\
mation()\x0a    onS\
crollWaitDuratio\
nChanged: recalc\
Animation()\x0a    \
onPixelsPerSecon\
dChanged: recalc\
Animation()\x0a\x0a   \
 // cancel the a\
nimation on user\
 interaction\x0a   \
 onMovementStart\
ed: scrollAnimGr\
oup.stop()\x0a\x0a    \
SequentialAnimat\
ion {\x0a        id\
: scrollAnimGrou\
p\x0a        runnin\
g: true\x0a        \
loops: Animation\
.Infinite\x0a\x0a     \
   PauseAnimatio\
n {\x0a            \
id: animPauseHea\
d\x0a            du\
ration: 0\x0a      \
  }\x0a        Numb\
erAnimation {\x0a  \
          id: an\
imScrollDown\x0a   \
         target:\
 container; prop\
erty: \x22contentY\x22\
\x0a            fro\
m: 0; to: 0; dur\
ation: 0\x0a       \
 }\x0a        Pause\
Animation {\x0a    \
        id: anim\
PauseTail\x0a      \
      duration: \
0\x0a        }\x0a    \
    NumberAnimat\
ion {\x0a          \
  target: contai\
ner; property: \x22\
contentY\x22\x0a      \
      to: 0; dur\
ation: 1000\x0a    \
    }\x0a    }\x0a}\x0a\
"

qt_resource_name = b"\
\x00\x08\
\x04<\xa33\
\x00q\
\x00m\x00l\x00u\x00t\x00i\x00l\x00s\
\x00\x17\
\x0a!_\xdc\
\x00H\
\x00o\x00r\x00i\x00z\x00o\x00n\x00t\x00a\x00l\x00S\x00w\x00i\x00p\x00e\x00A\x00r\
\x00e\x00a\x00.\x00q\x00m\x00l\
\x00\x0e\
\x0fFs<\
\x00A\
\x00u\x00t\x00o\x00S\x00c\x00r\x00o\x00l\x00l\x00.\x00q\x00m\x00l\
"

qt_resource_struct = b"\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x01\
\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x02\x00\x00\x00\x02\
\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x16\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\
\x00\x00\x01\x91d\xedX\xa1\
\x00\x00\x00J\x00\x00\x00\x00\x00\x01\x00\x00\x05t\
\x00\x00\x01\x91d\xedX\xa0\
"

def qInitResources():
    QtCore.qRegisterResourceData(0x03, qt_resource_struct, qt_resource_name, qt_resource_data)

def qCleanupResources():
    QtCore.qUnregisterResourceData(0x03, qt_resource_struct, qt_resource_name, qt_resource_data)

qInitResources()
