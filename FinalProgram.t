%Name: Daniel Mak
%Date: June 2, 2016
%Description: Final Educational Game Program

View.Set("graphics: 1040; 600, position: middle; middle")

/* Essential Variable Initializations and Declarations */

var name: string := "" %Title screen

var mouseX, mouseY, button: int %Mouse tracker

var began: boolean := false

var xMenuRadius, yMenuRadius, mcbX, mcbY, ecbX, ecbY, etbX, etbY, stbX, stbY: int %Menu variables
%mcbX/Y = zombieMathClassButtonX/Y, ecbX/Y = zombieEnglishClassButtonX/Y, etbX/Y = physicalEducationTimeButtonX/Y, stbX/Y = communityServiceTimeButtonX/Y
xMenuRadius := 200
yMenuRadius := 75
mcbX := 250
mcbY := 400
ecbX := 790
ecbY := 400
etbX := 250
etbY := 200
stbX := 790
stbY := 200


var mbx, mby, xMenuBackRadius, yMenuBackRadius, menuBackColor: int 
%mbx = menuBackX, mby = menuBackY

var clicked, mmc, mcc, pec, csc, ecc, q1, q2, q3, q4, exponents, ac, sc, pc, trc, mc: boolean := false
%mmc = mainMenuClicked, mcc = mathClassClicked, pec = physEdClicked, csc = communityServiceClicked, ecc = englishClassClicked, ac = additionClicked, sc = subtractionClicked, pc = powersClicked, trc = trigonometryClicked, mc = multiplicationClicked

var flowerCenterX, flowerCenterY, fcr, stemX, stemY, leaf1X, leaf1Y, leafX, leafY, petalTopX, petalTopY, petalLeftX, petalLeftY, petalRightX, petalRightY, petalRadius, flowerShiftX, flowerShiftY, centerColor, petalColor, petalDistance, poc: int := 0 %Daisy drawing
%fcr = flowerCenterRadius, poc = petalOutlineColor flowerCenterX := 100 %General daisy configuration
flowerCenterX := 100
flowerCenterY := 100
fcr := 8
centerColor := 43

petalDistance := 24 %General petal configuration
petalRadius := 20
petalColor := 100
poc := 53

stemX := 55
stemY := 60

leafX := 127
leafY := 45

leaf1X := 92
leaf1Y := 45


var ebX, ebY, tbX, tbY, yClassRadius, xClassRadius: int %Math class buttons
%ebX/Y = exponentsButtonX/Y, tbX/Y = trigonometryButtonX/Y
ebX := 300
ebY := 215
tbX := 724
tbY := 215
xClassRadius := 165
yClassRadius := 135

var abX, abY, sbX, sbY, pbX, pbY, trbX, trbY, mbX, mbY, yPhysEdRadius, xPhysEdRadius: int
%abX/Y = additionButtonX/Y, sbX/Y = subtractionButtonX/Y, pbX/Y = powersButtonX/Y, trbX/Y = trigButtonX/Y, mbX/Y = multiplicationButtonX/Y
abX := 230
abY := 300
sbX := 810
sbY := 300
mbX := 520
mbY := 450
pbX := 350
pbY := 100
trbX := 690
trbY := 100
xPhysEdRadius := 120
yPhysEdRadius := 50

var piX, piY, piColor: int

var rootX, rootY, rootColor: int

var backX, backY, backColor, xBackRadius, yBackRadius: int

backX := 170
backY := 80
xBackRadius := 90
yBackRadius := 50

var correct, touched, incorrect: boolean := false %Physical education variables
var solution, element, streak: int := 0
var answer: string(1)
var userSol: string := "" %userSolution
var xZChange, yZChange, xChange, yChange: int := 0
var walk: real := 0

var introX, speed: int %Intro material
var accel: real 
introX := -350
accel := 4
speed := 75


/* ========================================================================================================================================================== */

/*
 //notes
 l to int
 var hi: real
 var no: int
 hi := sqrt(4)
 no := hi div 1
 drawbox(1, 1, no, no, 1)

 //re-forking a process works
 process hi
 loop
 put "hi"
 exit when mouseX > 400
 end loop
 end hi
 fork hi
 */
 
 /* Picture Initialization */
var zombieFront, zombieBack, jrs, jls, jim, jimBack, daisyPic: int
var hairX, hairY: array 1 .. 32 of int
var done: boolean := false
%jrs = jimRightStride, jls := jimLeftStride
    
drawfill(1, 1, 80, 9)
Font.Draw("LOADING. . .", 500, 300, defFontID, 16)
delay(1000)
View.Set("offscreenonly") 

/* (hypothetical drawing of) Jim */
hairX(1) := 80
hairX(2) := 80
hairX(3) := 87
hairX(4) := 90
hairX(5) := 92
hairX(6) := 100
hairX(7) := 108
hairX(8) := 110
hairX(9) := 113
hairX(10) := 120
hairX(11) := 120

hairY(1) := 100
hairY(2) := 120
hairY(3) := 120
hairY(4) := 127
hairY(5) := 124
hairY(6) := 140
hairY(7) := 124
hairY(8) := 127
hairY(9) := 120
hairY(10) := 120
hairY(11) := 100


drawoval(100, 100, 20, 20, 16) %Head
drawfill(100, 101, 66, 16)

drawpolygon(hairX, hairY, 11, 16) %Hair
drawfill(100, 130, 21, 16)

drawline(80, 100, 120, 100, 16) %Shades
drawfillarc(90, 100, 6, 7, 180, -10, 16)
drawfillarc(110, 100, 6, 7, 180, -10, 16)

drawarc(100, 100, 15, 15, -90, -75, 16) %Smile!

drawline(90, 84, 90, 77, 16) %Neck
drawline(110, 84, 110, 77, 16) %Neck

drawline(85, 78, 115, 78, 16) %Shoulders
drawarc(118, 73, 5, 5, 15, 125, 16) 
drawarc(83, 73, 5, 5, 61, 165, 16)

drawline(123, 74, 130, 52, 16) %Arms
drawline(78, 74, 70, 52, 16)

drawfill(75, 54, 66, 16)
drawfill(125, 54, 66, 16)

drawline(80, 60, 80, 40, 16) %Body 
drawline(120, 60, 120, 40, 16) 
drawline(119, 41, 119, 39, 16) 

drawarc(90, 40, 10, 20, 180, 0, 16) %Legs
drawarc(110, 40, 10, 20, 180, 0, 16)
drawfill(90, 30, 17, 16)


drawline(80, 43, 120, 43, 16) %Shirt
drawline(70, 54, 80, 54, 16)
drawline(120, 54, 130, 54, 16)
drawfill(100, 60, 54, 16)

drawfill(0, 0, 0, 16) %Fix turing drawfill bug

drawfillarc(75, 54, 5, 10, 180, 0, 66) %Hands
drawfillarc(125, 54, 5, 10, 180, 0, 66)
drawarc(75, 54, 5, 10, 180, 0, 16)
drawarc(125, 54, 5, 10, 180, 0, 16)

jim := Pic.New(70, 20, 200, 150) %Take Jim drawing as picture
%Pic.Draw(jim, 1, 1, picCopy) // test
cls
delay(3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

drawoval(100, 100, 20, 20, 16) %Head
drawfill(100, 101, 66, 16)

hairX(1) := 80
hairX(2) := 80
hairX(3) := 87
hairX(4) := 90
hairX(5) := 92
hairX(6) := 100
hairX(7) := 108
hairX(8) := 110
hairX(9) := 113
hairX(10) := 120
hairX(11) := 120

hairY(1) := 100
hairY(2) := 120
hairY(3) := 120
hairY(4) := 127
hairY(5) := 124
hairY(6) := 140
hairY(7) := 124
hairY(8) := 127
hairY(9) := 120
hairY(10) := 120
hairY(11) := 100

for i: 12 .. 32
    hairX(i) := 120 - 2 * (i - 12)
    hairY(i) := 90 + 5 * (i mod 2)
end for

drawline(90, 84, 90, 77, 16) %Neck
drawline(110, 84, 110, 77, 16) %Neck

drawline(85, 78, 115, 78, 16) %Shoulders
drawarc(118, 73, 5, 5, 15, 125, 16) 
drawarc(83, 73, 5, 5, 61, 165, 16)

drawline(123, 74, 130, 52, 16) %Arms
drawline(78, 74, 70, 52, 16)

drawfill(75, 54, 66, 16)
drawfill(125, 54, 66, 16)

drawline(80, 60, 80, 40, 16) %Body 
drawline(120, 60, 120, 40, 16) 
drawline(119, 41, 119, 39, 16) 

drawarc(90, 40, 10, 20, 180, 0, 16) %Legs
drawarc(110, 40, 10, 20, 180, 0, 16)
drawfill(90, 30, 17, 16)


drawline(80, 43, 120, 43, 16) %Shirt
drawline(70, 54, 80, 54, 16)
drawline(120, 54, 130, 54, 16)
drawfill(100, 60, 54, 16)

drawfill(0, 0, 0, 16) %Fix turing drawfill bug

drawfillarc(75, 54, 5, 10, 180, 0, 66) %Hands
drawfillarc(125, 54, 5, 10, 180, 0, 66)
drawarc(75, 54, 5, 10, 180, 0, 16)
drawarc(125, 54, 5, 10, 180, 0, 16)

drawfillpolygon(hairX, hairY, 32, 21) %Hair
drawfill(91, 81, 66, 16)
drawfill(100, 40, 16, 16)

jimBack := Pic.New(70, 20, 200, 150) %Take Jim drawing as picture
delay(3)
cls

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hairX(1) := 80
hairX(2) := 80
hairX(3) := 87
hairX(4) := 90
hairX(5) := 92
hairX(6) := 100
hairX(7) := 108
hairX(8) := 110
hairX(9) := 113
hairX(10) := 120
hairX(11) := 120

hairY(1) := 100
hairY(2) := 120
hairY(3) := 120
hairY(4) := 127
hairY(5) := 124
hairY(6) := 140
hairY(7) := 124
hairY(8) := 127
hairY(9) := 120
hairY(10) := 120
hairY(11) := 100

for i: 12 .. 32
    hairX(i) := 120 - 2 * (i - 12)
    hairY(i) := 90 + 5 * (i mod 2)
end for

drawline(90, 84, 90, 77, 16) %Neck
drawline(110, 84, 110, 77, 16) %Neck

drawline(89, 78, 115, 78, 16) %Shoulders

drawarc(114, 38, 18, 40, 0, 110, 0) %Right arm
drawarc(108, 38, 30, 40, 0, 80, 16) %Right arm
drawline(117, 63, 128, 38, 16)
drawoval(133, 37, 5, 5, 16)
drawfill(130, 88, 66, 16)
drawfill(133, 37, 66, 16)

drawfill(91, 81, 66, 16)

drawline(89, 67, 89, 27, 16) %Body
drawline(120, 55, 120, 40, 16)

drawarc(96, 40, 10, 20, 225, -45, 16) %Legs
drawline(104, 26, 105, 40, 16)
drawline(105, 40, 120, 40, 16)

drawline(135, 55, 120, 55, 16) %Shirt
drawline(89, 50, 120, 50, 16)
drawfill(100, 60, 54, 16)

drawline(87, 63, 92, 81, 16) %Left arm

drawdot(113, 77, 16)
drawdot(112, 77, 16)
drawfill(1, 1, 0, 16)

drawline(87, 63, 92, 81, 16) %Left ar m
drawline(89, 85, 79, 68, 16)
drawoval(83, 66, 4, 3, 16)
drawfill(86, 73, 54, 16)
drawfill(84, 66, 66, 16)
drawfillarc(83, 66, 4, 3, 0, 180, 54)

drawoval(100, 100, 20, 20, 16) %Head
drawfill(100, 101, 66, 16)

drawfillpolygon(hairX, hairY, 32, 21) %Hair
drawfill(91, 81, 66, 16)
drawfill(100, 40, 16, 16)
drawfill(106, 80, 66, 16)
jrs := Pic.New(76, 20, 138, 150) %Take Jim drawing as picture
jls := Pic.Mirror(jrs)
%Pic.Draw(jrs, 1, 1, picCopy) 
delay(3)
cls
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* zombieFront */
drawbox(80, 85, 120, 120, 16) %Zombie head
drawfill(100, 100, 46, 16)

drawfilloval(93, 106, 3, 5, 16)
drawfilloval(107, 106, 3, 5, 16)

drawarc(100, 95, 6, 3, 180, 0, 16) %Smile!

drawline(95, 85, 95, 80, 16) %Neck and shoulder
drawline(105, 85, 105, 80, 16)

drawline(80, 80, 120, 80, 16)

drawfill(100, 83, 46, 16)

drawarc(81, 35, 10, 45, 90, 180, 16) %Arms and hands
drawarc(118, 35, 10, 45, 0, 99, 16)

drawline(85, 28, 85, 73, 16) %Body
drawline(115, 28, 115, 73, 16)

drawoval(78, 35, 7, 2, 16) %Hands
drawfill(78, 35, 2, 16)
drawoval(122, 35, 7, 2, 16)
drawfill(122, 35, 2, 16)

drawarc(92, 38, 10, 15, 230, -30, 16) %Leg
drawarc(107, 38, 10, 15, 230, -30, 16)
drawline(100, 27, 100, 40, 16)

drawfill(100, 50, 46, 16) %Color it in!

zombieFront := Pic.New(70, 20, 200, 150) %Take zombie drawing as picture
delay(3)
cls
%Pic.Draw(zombieFront, 0, 0, picCopy) // test

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* zombieBack */
drawbox(80, 85, 120, 120, 16) %Zombie head
drawfill(100, 100, 46, 16)

drawline(95, 85, 95, 80, 16) %Neck and shoulder
drawline(105, 85, 105, 80, 16)

drawline(80, 80, 120, 80, 16)

drawfill(100, 83, 46, 16)

drawarc(81, 35, 10, 45, 90, 180, 16) %Arms and hands
drawarc(118, 35, 10, 45, 0, 99, 16)

drawline(85, 28, 85, 73, 16) %Body
drawline(115, 28, 115, 73, 16)

drawoval(78, 35, 7, 2, 16) %Hands
drawfill(78, 35, 2, 16)
drawoval(122, 35, 7, 2, 16)
drawfill(122, 35, 2, 16)

drawarc(92, 38, 10, 15, 230, -30, 16) %Leg
drawarc(107, 38, 10, 15, 230, -30, 16)
drawline(100, 27, 100, 40, 16)

drawfill(100, 50, 46, 16) %Color it in!

zombieBack := Pic.New(70, 20, 200, 150) %Take zombie drawing as picture
delay(3)
cls
%Pic.Draw(zombieBack, 1, 1, picCopy) // test

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
flowerCenterX := 100
flowerCenterY := 100
fcr := 2
centerColor := 43

petalDistance := 5 %General petal configuration
petalRadius := 5
petalColor := 100
poc := 53

stemX := 55
stemY := 65

leafX := 118
leafY := 70

leaf1X := leafX * 115 / 127 div 1
leaf1Y := 70

petalTopX := flowerCenterX %General upper petal placement
petalTopY := flowerCenterY + petalDistance

for i: 0 .. 1 %Stem of daisy
    drawarc(stemX + flowerShiftX, stemY + flowerShiftY, 57 + i, 47 + i, 0, 36, 2)
end for

petalLeftX := flowerCenterX - sqrt(petalDistance ** 2 / 2) div 1 %General left-side petal placement
petalLeftY := flowerCenterY - sqrt(petalDistance ** 2 / 2) div 1

petalRightX := petalLeftX + 1.6 * petalDistance div 1
petalRightY := petalLeftY


drawoval(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalRadius, petalRadius, poc) %Upper petal
drawfill(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalColor, poc)

drawoval(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalRadius, petalRadius, poc) %Left-side petal
drawfill(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalColor, poc)

drawoval(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalRadius, petalRadius, poc) %Right-side petal
drawfill(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalColor, poc)

drawfilloval(flowerCenterX + flowerShiftX, flowerCenterY + flowerShiftY, fcr, fcr, centerColor) %Center of daisy

drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 6, 3, 0, 180, 2) %Leaves
drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 6, 3, 180, 0, 120)


drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 6, 3, 0, 180, 2)
drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 6, 3, 180, 0, 120)

daisyPic := Pic.New(91, 62, 132, 115)
delay(3)
cls
/*setscreen("nooffscreenonly")
Pic.Draw(daisyPic, 1, 1, picCopy)
Input.Pause*/
/* ========================================================================================================================================================= */

process mouseTrack %Constantly monitor mouse location
    loop
	mousewhere(mouseX, mouseY, button)
	delay(50)
     /* 
	// for debugging purposes 
	locate(1,1) 
	put mouseX, " ", mouseY */
    end loop
end mouseTrack

fork mouseTrack

process intro
    accel := 4 
    for i: 0 .. 55
	introX += speed
	speed += -accel div 1
	Font.Draw("Mr. Anandarajan's", 810 - introX, 470, Font.New ("Times New Roman:32"), 16)
	Font.Draw("ICS201", introX, 400, Font.New ("Times New Roman:64"), 16)
	Font.Draw("Presents: Daniel Mak's Project", 690 - introX, 350, Font.New ("Times New Roman:32"), 16)
	delay(50)
	drawfillbox(0, 340, 1040, 500, 0)
	if (speed < 22) then
	    accel += -0.3
	end if
    end for
end intro

/* Essential Drawings */

process pi
    Font.Draw('T', piX, piY, Font.New("Comic Sans MS:12"), piColor)
    Font.Draw('T', piX + 9, piY, Font.New("Comic Sans MS:12"), piColor)
end pi

process r3 %rootThree
    Font.Draw('v', rootX, rootY - 10, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY - 9, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY - 10, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("3", rootX + 17, rootY - 10, Font.New("Comic Sans MS:14"), rootColor)
end r3

process r2 %rootTwo
    Font.Draw('v', rootX, rootY, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY + 1, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("2", rootX + 17, rootY, Font.New("Comic Sans MS:14"), rootColor)
end r2

process r3d2 %rootThreeDivTwo
    Font.Draw('v', rootX, rootY, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY + 1, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("3", rootX + 17, rootY, Font.New("Comic Sans MS:14"), rootColor)
    Font.Draw(chr (151), rootX + 5, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (151), rootX + 13, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("2", rootX + 16, rootY - 27, Font.New("Comic Sans MS:14"), rootColor)
end r3d2

process oneHalf
    Font.Draw("1", rootX + 10, rootY, Font.New("Comic Sans MS:14"), rootColor)
    Font.Draw(chr (151), rootX + 2, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (151), rootX + 6, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("2", rootX + 10, rootY - 27, Font.New("Comic Sans MS:14"), rootColor)
end oneHalf

process odr2 %oneDivRootTwo
    Font.Draw("1", rootX + 17, rootY, Font.New("Comic Sans MS:14"), rootColor)
    Font.Draw(chr (151), rootX + 5, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (151), rootX + 13, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('v', rootX, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY - 31, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("2", rootX + 17, rootY - 32, Font.New("Comic Sans MS:14"), rootColor)
end odr2
/*
 //debug code
 rootColor := 16
 rootX := 100
 rootY := 100
 fork odr2
 delay(10000)
 cls
 fork oneHalf
 delay(10000)
 */
process odr3 %oneDivRootThree
    Font.Draw("1", rootX + 17, rootY, Font.New("Comic Sans MS:14"), rootColor)
    Font.Draw(chr (151), rootX + 5, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (151), rootX + 13, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('v', rootX, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY - 31, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("3", rootX + 17, rootY - 32, Font.New("Comic Sans MS:14"), rootColor)
end odr3

process tdr3 %twoDivRootThree
    Font.Draw("2", rootX + 17, rootY, Font.New("Comic Sans MS:14"), rootColor)
    Font.Draw(chr (151), rootX + 5, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (151), rootX + 13, rootY - 15, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('v', rootX, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw('/', rootX + 4, rootY - 31, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw(chr (175), rootX + 15, rootY - 32, Font.New("Comic Sans MS:19"), rootColor)
    Font.Draw("3", rootX + 17, rootY - 32, Font.New("Comic Sans MS:14"), rootColor)
end tdr3

process daisy
    flowerCenterX := 100
    flowerCenterY := 100
    fcr := 8
    centerColor := 43

    petalDistance := 24 %General petal configuration
    petalRadius := 20
    petalColor := 100
    poc := 53

    stemX := 55
    stemY := 60

    leafX := 127
    leafY := 45

    leaf1X := 92
    leaf1Y := 45
    petalTopX := flowerCenterX %General upper petal placement
    petalTopY := flowerCenterY + petalDistance

    petalLeftX := flowerCenterX - sqrt(petalDistance ** 2 / 2) div 1 %General left-side petal placement
    petalLeftY := flowerCenterY - sqrt(petalDistance ** 2 / 2) div 1

    petalRightX := flowerCenterX + sqrt(petalDistance ** 2 / 2) div 1 + 8 %General right-side petal placement
    petalRightY := flowerCenterY - sqrt(petalDistance ** 2 / 2) div 1 + 7


    drawoval(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalRadius, petalRadius, poc) %Upper petal
    drawfill(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalColor, poc)

    drawoval(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalRadius, petalRadius, poc) %Left-side petal
    drawfill(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalColor, poc)

    drawoval(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalRadius, petalRadius, poc) %Right-side petal
    drawfill(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalColor, poc)

    drawfilloval(flowerCenterX + flowerShiftX, flowerCenterY + flowerShiftY, fcr, fcr, centerColor) %Center of daisy

    drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 20, 10, 0, 180, 2)
    drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 20, 10, 180, 0, 120)
    for i: 0 .. 3 %Stem of daisy
	drawarc(stemX + flowerShiftX, stemY + flowerShiftY, 57 + i, 47 + i, -28, 30, 48)
    end for

    drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 20, 10, 0, 180, 2)
    drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 20, 10, 180, 0, 120)
end daisy

process miniDaisy
    flowerCenterX := 100
    flowerCenterY := 100
    fcr := 2
    centerColor := 43

    petalDistance := 5 %General petal configuration
    petalRadius := 5
    petalColor := 100
    poc := 53

    stemX := 55
    stemY := 65

    leafX := 118
    leafY := 70

    leaf1X := leafX * 115 / 127 div 1
    leaf1Y := 70

    petalTopX := flowerCenterX %General upper petal placement
    petalTopY := flowerCenterY + petalDistance

    for i: 0 .. 1 %Stem of daisy
	drawarc(stemX + flowerShiftX, stemY + flowerShiftY, 57 + i, 47 + i, 0, 36, 48)
    end for

    petalLeftX := flowerCenterX - sqrt(petalDistance ** 2 / 2) div 1 %General left-side petal placement
    petalLeftY := flowerCenterY - sqrt(petalDistance ** 2 / 2) div 1

    petalRightX := petalLeftX + 1.6 * petalDistance div 1
    petalRightY := petalLeftY


    drawoval(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalRadius, petalRadius, poc) %Upper petal
    drawfill(petalTopX + flowerShiftX, petalTopY + flowerShiftY, petalColor, poc)

    drawoval(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalRadius, petalRadius, poc) %Left-side petal
    drawfill(petalLeftX + flowerShiftX, petalLeftY + flowerShiftY, petalColor, poc)

    drawoval(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalRadius, petalRadius, poc) %Right-side petal
    drawfill(petalRightX + flowerShiftX, petalRightY + flowerShiftY, petalColor, poc)

    drawfilloval(flowerCenterX + flowerShiftX, flowerCenterY + flowerShiftY, fcr, fcr, centerColor) %Center of daisy

    drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 6, 3, 0, 180, 2) %Leaves
    drawfillarc(leafX + flowerShiftX, leafY + flowerShiftY, 6, 3, 180, 0, 120)


    drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 6, 3, 0, 180, 2)
    drawfillarc(leaf1X + flowerShiftX, leaf1Y + flowerShiftY, 6, 3, 180, 0, 120)
end miniDaisy


/* Soundtrack */

process titleSong
    Music.SoundOff
    if (began = false) then
	loop
	    Music.PlayFile("Title_Miiro.wav")
	    exit when began = true
	end loop
    end if
end titleSong

process menuSong
    Music.SoundOff
    if (mmc = true) then
	loop
	    Music.PlayFile("Menu_MyDearest.wav")
	    exit when mmc = false
	end loop
    end if
end menuSong

process mathClassSong
    Music.SoundOff
    if (mcc = true) then
	loop
	    Music.PlayFile("MathClass_Kiseijuu.wav")
	    exit when mcc = false
	end loop
    end if
end mathClassSong

process additionSong
    Music.SoundOff
    if (ac = true) then
	loop
	    Music.PlayFile("Addition_GloriousMorning.wav")
	    exit when ac = false
	end loop
    end if
end additionSong

process subtractionSong
    Music.SoundOff
    if (sc = true) then
	loop
	    Music.PlayFile("Subtraction_TapTapDomiNation.wav")
	    exit when sc = false
	end loop
    end if
end subtractionSong

process trigonometrySong
    Music.SoundOff
    if (trc = true) then
	loop
	    Music.PlayFile("Trigonometry_CrossingField.wav")
	end loop
    end if
end trigonometrySong

process communityServiceSong
    Music.SoundOff
    if (csc = true) then
	loop
	    Music.PlayFile("CommunityService_HikaruNara.wav")
	    exit when csc = false
	end loop
    end if
end communityServiceSong

process englishClassSong
    Music.SoundOff
    if (ecc = true) then
	loop
	    Music.PlayFile("EnglishClass_ThisGame.wav")
	    exit when ecc = false
	end loop
    end if
end englishClassSong

process multiplicationSong
    Music.SoundOff
    if (mc = true) then
	loop
	    Music.PlayFile("Multiplication_Fubuki.wav")
	    exit when mc = false
	end loop
    end if
end multiplicationSong

process exponentsSong
    Music.SoundOff
    if (pc = true) then
	loop
	    Music.PlayFile("Exponents_Hero.wav")
	end loop
    end if
end exponentsSong

process physEdSong
    Music.SoundOff
    if (pec = true) then
	loop
	    Music.PlayFile("PhysEd_Natsu'sTheme.wav")
	    exit when pec = false
	end loop
    end if
end physEdSong

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

const mex := 9
var gramClass, gcx, spellClass, scx: flexible array 1 .. 0 of string
new gramClass, 100
new gcx, 100
new spellClass, mex + 1
new scx, mex + 1
%gcx = grammarClassExample, scx = spellingClassExample
/*gramClass(9) := "hi"
put gramClass(9)*/
gramClass(1) := "Capitalize the names of of particular persons, places, and things"
gcx(1) := "Canadian Tire - capitalize the 'C' and 'T'"
gcx(2) := "Bayview Secondary School - capitalize the 'B', 'S', and 'S'"
gcx(3) := "Bill Gates - capitalize the 'B' and 'G'"
gramClass(2) := "Capitalize titles of persons"
gcx(4) := "Ms. Joyce - capitalize the 'M' (and the 'J')"
gcx(5) := "Uncle Anthony and his brother Travis with my cousin Mary - capitalize the 'U' (but not the 'b' nor the 'c')"
gcx(6) := "Note: Do not capitalize a family-relationship word unless the word is considered part of the name"
gramClass(3) := "Capitalize the titles of works"
gcx(7) := "Mona Lisa - capitalize the 'M' and the 'L'"
gcx(8) := "Romeo and Juliet - capitalize the 'R' and 'J' (but not the 'a')"
gcx(9) := "Note: Unimportant words are coordinating conjunctions, prepositions, and the articles 'a', 'an', and 'the'"
gramClass(4) := "Capitalize the first word of every sentence, including quoted sentences"
gcx(10) := "He was hungry for noodles - capitalize the 'H'"
gcx(11) := "Douglas said, ''It is fatal to enter any war without the will to win it.'' - capitalize the 'I' (and the 'D')"
gcx(12) := "Congratulations! You have learnt the basics of capitalization and are ready to head off for some community service!"

scx(1) := "disastrous"
spellClass(1) := "causing much suffering and loss"
scx(2) := "commercial"
spellClass(2) := "having to do with business or trade"
scx(3) := "buoyancy"
spellClass(3) := "the tendency to float"
scx(4) := "autonomous"
spellClass(4) := "independent, self-governing"
scx(5) := "incision"
spellClass(5) := "a cut"
scx(6) := "persuaded"
spellClass(6) := "convinced by argument or pleading"
scx(7) := "edict"
spellClass(7) := "an official public announcement"
scx(8) := "submerged"
spellClass(8) := "covered with water"
scx(9) := "verdict"
spellClass(9) := "the decision of a jury"
scx(10) := "physician"
spellClass(10) := "a person skilled in the art of healing; a doctor"


process QuadrantI
    q1 := false
    delay(1146)
    rootColor := 0
    Font.Draw("Zombie high-schoolers find knowing basic trigonometric equivalents wonderfully useful!", 30, 560, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("Here are important trigonometric equivalents:", 270, 510, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("                              sin               cos               tan              csc               sec               cot", 0, 448, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("            rad", 0, 448, Font.New("Comic Sans MS:17"), 64)
    Font.Draw("   deg", 0, 448, Font.New("Comic Sans MS:17"), 77)
    /* Degrees */
    Font.Draw("30", 23, 390, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("60", 23, 278, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("45", 23, 166, Font.New("Comic Sans MS:17"), 0)
    /* Radians */
    piColor := 0
    for i: 0 .. 2
	piX := 90
	piY := 410 - 112 * i
	fork pi
	Font.Draw(chr (151), 90, 395 - 112 * i, Font.New("Comic Sans MS:19"), 0)
	delay(10) %Buffer time
    end for
    Font.Draw("6", 95, 380, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("3", 95, 268, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("4", 95, 156, Font.New("Comic Sans MS:17"), 0)
    rootX := 210
    rootY := 410
    fork oneHalf
    delay(10)
    rootX := 210
    rootY := 298
    fork r3d2
    delay(10)
    rootX := 210
    rootY := 186
    fork odr2
    delay(10)
    rootX := 340
    rootY := 410
    fork r3d2
    delay(10)
    rootX := 340
    rootY := 298
    fork oneHalf
    delay(10)
    rootX := 340
    rootY := 186
    fork odr2
    delay(10)
    rootX := 480
    rootY := 410
    fork odr3
    delay(10)
    rootX := 480
    rootY := 298
    fork r3
    delay(10)
    Font.Draw("1", 500, 166, Font.New("Comic Sans MS:19"), 0)
    Font.Draw("2", 625, 400, Font.New("Comic Sans MS:19"), 0)
    rootX := 610
    rootY := 298
    fork tdr3
    delay(10)
    rootX := 610
    rootY := 166
    fork r2
    delay(10)
    rootX := 750
    rootY := 410
    fork tdr3
    delay(10)
    Font.Draw("2", 760, 278, Font.New("Comic Sans MS:19"), 0)
    rootX := 750
    rootY := 166
    fork r2
    delay(10)
    rootX := 895
    rootY := 410
    fork r3
    delay(10)
    rootX := 895
    rootY := 298
    fork odr3
    delay(10)
    Font.Draw("1", 903, 166, Font.New("Comic Sans MS:19"), 0)
    %drawline(180, 441, 960, 441, 0) //Grid lines
    drawline(180, 235, 960, 235, 0)
    drawline(180, 357, 960, 357, 0)
    drawline(851, 425, 851, 150, 0)
    drawline(712, 425, 712, 150, 0)
    drawline(571, 425, 571, 150, 0)
    drawline(437, 425, 437, 150, 0)
    drawline(291, 425, 291, 150, 0)
    /*
     //code debugger
     loop
     locate(1,1)
     put mouseX, " ", mouseY
     drawline(mouseX, 0, mouseX, 600, 0)
     delay(50)
     end loop
     */
     %q1 := false
end QuadrantI

process QuadrantII   
    q2 := false
    delay(1041)
    rootColor := 0
    Font.Draw("                              sin               cos               tan              csc               sec               cot", 0, 448, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("            rad", 0, 448, Font.New("Comic Sans MS:17"), 64)
    Font.Draw("   deg", 0, 448, Font.New("Comic Sans MS:17"), 77)
    /* Degrees */
    Font.Draw("150", 23, 390, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("120", 23, 278, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("135", 23, 166, Font.New("Comic Sans MS:17"), 0)
    /* Radians */
    piColor := 0
    for i: 0 .. 2
	piX := 97
	piY := 410 - 112 * i
	fork pi
	Font.Draw(chr (151), 90, 395 - 112 * i, Font.New("Comic Sans MS:19"), 0)
	delay(4) %Buffer time
    end for
    Font.Draw("6", 95, 380, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("3", 95, 268, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("4", 95, 156, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("5", 82, 410, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("2", 82, 298, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("3", 82, 186, Font.New("Comic Sans MS:17"), 0)
    rootX := 210
    rootY := 410
    fork oneHalf
    delay(4)
    rootX := 210
    rootY := 298
    fork r3d2
    delay(4)
    rootX := 210
    rootY := 186
    fork odr2
    delay(4)
    rootX := 340
    rootY := 410
    fork r3d2
    delay(4)
    rootX := 340
    rootY := 298
    fork oneHalf
    delay(4)
    rootX := 340
    rootY := 186
    fork odr2
    delay(4)
    rootX := 480
    rootY := 410
    fork odr3
    delay(4)
    rootX := 480
    rootY := 298
    fork r3
    delay(4)
    Font.Draw("1", 500, 166, Font.New("Comic Sans MS:19"), 0)
    Font.Draw("2", 625, 400, Font.New("Comic Sans MS:19"), 0)
    rootX := 610
    rootY := 298
    fork tdr3
    delay(4)
    rootX := 610
    rootY := 166
    fork r2
    delay(4)
    rootX := 750
    rootY := 410
    fork tdr3
    delay(4)
    Font.Draw("2", 760, 286, Font.New("Comic Sans MS:19"), 0)
    rootX := 750
    rootY := 166
    fork r2
    delay(4)
    rootX := 895
    rootY := 410
    fork r3
    delay(4)
    rootX := 895
    rootY := 298
    fork odr3
    delay(4)
    Font.Draw("1", 903, 166, Font.New("Comic Sans MS:19"), 0)
    %drawline(180, 441, 960, 441, 0) //Grid lines
    drawline(180, 235, 960, 235, 0)
    drawline(180, 357, 960, 357, 0)
    drawline(851, 425, 851, 150, 0)
    drawline(712, 425, 712, 150, 0)
    drawline(571, 425, 571, 150, 0)
    drawline(437, 425, 437, 150, 0)
    drawline(291, 425, 291, 150, 0)
    for i: 0 .. 22
	if (i > 3 and i < 12) or (i > 15) then 
	    Font.Draw("-", 190 + 136 *(i div 4), 410 - 120 *(i mod 3), Font.New("Comic Sans MS:19"), 52)
	end if
    end for
end QuadrantII

process QuadrantIII
    q3 := false
    delay(1041)
    rootColor := 0
    Font.Draw("                              sin               cos               tan              csc               sec               cot", 0, 448, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("            rad", 0, 448, Font.New("Comic Sans MS:17"), 64)
    Font.Draw("   deg", 0, 448, Font.New("Comic Sans MS:17"), 77)
    /* Degrees */
    Font.Draw("210", 23, 390, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("240", 23, 278, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("225", 23, 166, Font.New("Comic Sans MS:17"), 0)
    /* Radians */
    piColor := 0
    for i: 0 .. 2
	piX := 97
	piY := 410 - 112 * i
	fork pi
	Font.Draw(chr (151), 90, 395 - 112 * i, Font.New("Comic Sans MS:19"), 0)
	delay(4) %Buffer time
    end for
    Font.Draw("6", 95, 380, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("3", 95, 268, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("4", 95, 156, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("7", 82, 410, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("4", 82, 298, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("5", 82, 186, Font.New("Comic Sans MS:17"), 0)
    rootX := 210
    rootY := 410
    fork oneHalf
    delay(4)
    rootX := 210
    rootY := 298
    fork r3d2
    delay(4)
    rootX := 210
    rootY := 186
    fork odr2
    delay(4)
    rootX := 340
    rootY := 410
    fork r3d2
    delay(4)
    rootX := 340
    rootY := 298
    fork oneHalf
    delay(4)
    rootX := 340
    rootY := 186
    fork odr2
    delay(4)
    rootX := 480
    rootY := 410
    fork odr3
    delay(4)
    rootX := 480
    rootY := 298
    fork r3
    delay(4)
    Font.Draw("1", 500, 166, Font.New("Comic Sans MS:19"), 0)
    Font.Draw("2", 625, 400, Font.New("Comic Sans MS:19"), 0)
    rootX := 610
    rootY := 298
    fork tdr3
    delay(4)
    rootX := 610
    rootY := 166
    fork r2
    delay(4)
    rootX := 750
    rootY := 410
    fork tdr3
    delay(4)
    Font.Draw("2", 760, 286, Font.New("Comic Sans MS:19"), 0)
    rootX := 750
    rootY := 166
    fork r2
    delay(4)
    rootX := 895
    rootY := 410
    fork r3
    delay(4)
    rootX := 895
    rootY := 298
    fork odr3
    delay(4)
    Font.Draw("1", 903, 166, Font.New("Comic Sans MS:19"), 0)
    %drawline(180, 441, 960, 441, 0) //Grid lines
    drawline(180, 235, 960, 235, 0)
    drawline(180, 357, 960, 357, 0)
    drawline(851, 425, 851, 150, 0)
    drawline(712, 425, 712, 150, 0)
    drawline(571, 425, 571, 150, 0)
    drawline(437, 425, 437, 150, 0)
    drawline(291, 425, 291, 150, 0)
    for i: 0 .. 22
	if (i < 8) or (i > 12 and i < 19) then 
	    Font.Draw("-", 190 + 136 *(i div 4), 410 - 120 *(i mod 3), Font.New("Comic Sans MS:19"), 52)
	end if
    end for
end QuadrantIII

process QuadrantIV
    q4 := false
    delay(1041)
    rootColor := 0
    Font.Draw("                              sin               cos               tan              csc               sec               cot", 0, 448, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("            rad", 0, 448, Font.New("Comic Sans MS:17"), 64)
    Font.Draw("   deg", 0, 448, Font.New("Comic Sans MS:17"), 77)
    /* Degrees */
    Font.Draw("330", 23, 390, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("300", 23, 278, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("315", 23, 166, Font.New("Comic Sans MS:17"), 0)
    /* Radians */
    piColor := 0
    for i: 0 .. 2
	piX := 97
	piY := 410 - 112 * i
	fork pi
	Font.Draw(chr (151), 90, 395 - 112 * i, Font.New("Comic Sans MS:19"), 0)
	delay(4) %Buffer time
    end for
    Font.Draw("6", 95, 380, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("3", 95, 268, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("4", 95, 156, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("11", 78, 410, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("5", 82, 298, Font.New("Comic Sans MS:17"), 0)
    Font.Draw("7", 82, 186, Font.New("Comic Sans MS:17"), 0)
    rootX := 210
    rootY := 410
    fork oneHalf
    delay(4)
    rootX := 210
    rootY := 298
    fork r3d2
    delay(4)
    rootX := 210
    rootY := 186
    fork odr2
    delay(4)
    rootX := 340
    rootY := 410
    fork r3d2
    delay(4)
    rootX := 340
    rootY := 298
    fork oneHalf
    delay(4)
    rootX := 340
    rootY := 186
    fork odr2
    delay(4)
    rootX := 480
    rootY := 410
    fork odr3
    delay(4)
    rootX := 480
    rootY := 298
    fork r3
    delay(4)
    Font.Draw("1", 500, 166, Font.New("Comic Sans MS:19"), 0)
    Font.Draw("2", 625, 400, Font.New("Comic Sans MS:19"), 0)
    rootX := 610
    rootY := 298
    fork tdr3
    delay(4)
    rootX := 610
    rootY := 166
    fork r2
    delay(4)
    rootX := 750
    rootY := 410
    fork tdr3
    delay(4)
    Font.Draw("2", 760, 286, Font.New("Comic Sans MS:19"), 0)
    rootX := 750
    rootY := 166
    fork r2
    delay(4)
    rootX := 895
    rootY := 410
    fork r3
    delay(4)
    rootX := 895
    rootY := 298
    fork odr3
    delay(4)
    Font.Draw("1", 903, 166, Font.New("Comic Sans MS:19"), 0)
    %drawline(180, 441, 960, 441, 0) //Grid lines
    drawline(180, 235, 960, 235, 0)
    drawline(180, 357, 960, 357, 0)
    drawline(851, 425, 851, 150, 0)
    drawline(712, 425, 712, 150, 0)
    drawline(571, 425, 571, 150, 0)
    drawline(437, 425, 437, 150, 0)
    drawline(291, 425, 291, 150, 0)
    for i: 0 .. 22
	if (i < 3) or (i > 19) or (i > 8 and i < 16) then 
	    Font.Draw("-", 190 + 136 *(i div 4), 410 - 120 *(i mod 3), Font.New("Comic Sans MS:19"), 52)
	end if
    end for
end QuadrantIV

process mathClass
    fork daisy
    Font.Draw("Hello " + name + ", welcome to math class!", 520 - length("Hello " + name + ", welcome to math class!") * 6, 500, Font.New("Comic Sans MS:16"), 0)
    Font.Draw("It may not seem like it, but zombies are very smart.", 250, 470, Font.New("Comic Sans MS:16"), 0)
    drawfilloval(ebX, ebY, xClassRadius, yClassRadius, 57 /* placeholder color */) %Exponents button
    Font.Draw("Exponents", 233, 230, Font.New("Comic Sans MS:20"), 133)
    Font.Draw("(Middle School)", 220, 190, Font.New("Comic Sans MS:17"), 133)
    drawfilloval(tbX, tbY, xClassRadius, yClassRadius, 57 /* placeholder color */) %Trigonometry button
    Font.Draw("Trigonometry", 640, 230, Font.New("Comic Sans MS:20"), 115)
    Font.Draw("(High School)", 650, 190, Font.New("Comic Sans MS:17"), 115)
    loop
	exit when mcc = false
	if (mouseX < 870 and mouseX > 148 and mouseY < 455 and mouseY > 430) then
	    Font.Draw("(Possibly because of all the brains their ancestors ate, but your zombie classmates do not like to talk about it)", 180, 440, Font.New("Comic Sans MS:10"), 0)
	    %drawdot(870, 430, 0) //test
	    %drawdot(148, 455, 0)
	elsif ((((mouseX - ebX) ** 2) /(xClassRadius ** 2) +((mouseY - ebY) ** 2) /(yClassRadius) ** 2) < 1) then %Scroll-over for exponents button
	    Font.Draw("Exponents", 233, 230, Font.New("Comic Sans MS:20"), 61)
	    Font.Draw("(Middle School)", 220, 190, Font.New("Comic Sans MS:17"), 61)
	    if (button = 1) then
		exponents := true
		for i: 0 .. 1040
		    drawfillbox(0 + i, 0, 10 + i, 600, 24) %Transition chalkboard slider
		    delay(1)
		end for
		Font.Draw("Zombie middle-schoolers love showing off the exponential equivalents they have learned!", 30, 560, Font.New("Comic Sans MS:17"), 0)
		Font.Draw("Here are important exponential equivalents:", 270, 510, Font.New("Comic Sans MS:17"), 0)
		for i: 0 .. 4 %Exponents of two
		    Font.Draw("2 = ", 20, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		    Font.Draw(intstr (i + 2), 33, 464 - 100 * i, Font.New("Comic Sans MS:10"), 91)
		    Font.Draw(intstr (2 **(i + 2)), 60, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		end for
		for i: 0 .. 4
		    Font.Draw("2 = ", 120, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		    Font.Draw(intstr (i + 7), 133, 464 - 100 * i, Font.New("Comic Sans MS:10"), 91)
		    Font.Draw(intstr (2 **(i + 7)), 160, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		end for /*
		 for i: 0 .. 4
		 Font.Draw("2 = ", 220, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		 Font.Draw(intstr (i + 12), 233, 464 - 100 * i, Font.New("Comic Sans MS:10"), 91)
		 Font.Draw(intstr (2 **(i + 12)), 260, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		 end for
		 for i: 0 .. 4
		 Font.Draw("2 = ", 350, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		 Font.Draw(intstr (i + 16), 363, 464 - 100 * i, Font.New("Comic Sans MS:10"), 91)
		 Font.Draw(intstr (2 **(i + 16)), 390, 450 - 100 * i, Font.New("Comic Sans MS:17"), 91)
		 end for */
		for i: 0 .. 4 %Exponents of three
		    Font.Draw("3 = ", 240, 450 - 100 * i, Font.New("Comic Sans MS:17"), 68)
		    Font.Draw(intstr (i + 2), 253, 464 - 100 * i, Font.New("Comic Sans MS:10"), 68)
		    Font.Draw(intstr (3 **(i + 2)), 280, 450 - 100 * i, Font.New("Comic Sans MS:17"), 68)
		end for
		Font.Draw("3 = ", 350, 450, Font.New("Comic Sans MS:17"), 68)
		Font.Draw(intstr (7), 363, 464, Font.New("Comic Sans MS:10"), 68)
		Font.Draw(intstr (3 ** 7), 390, 450, Font.New("Comic Sans MS:17"), 68)
		for i: 1 .. 4 %Exponents of four
		    Font.Draw("4 = ", 350, 450 - 100 * i, Font.New("Comic Sans MS:17"), 70)
		    Font.Draw(intstr (i + 1), 363, 464 - 100 * i, Font.New("Comic Sans MS:10"), 70)
		    Font.Draw(intstr (4 **(i + 1)), 390, 450 - 100 * i, Font.New("Comic Sans MS:17"), 70)
		end for
		for i: 0 .. 3 %Exponents of five
		    Font.Draw("5 = ", 470, 450 - 100 * i, Font.New("Comic Sans MS:17"), 96)
		    Font.Draw(intstr (i + 2), 483, 464 - 100 * i, Font.New("Comic Sans MS:10"), 96)
		    Font.Draw(intstr (5 **(i + 2)), 510, 450 - 100 * i, Font.New("Comic Sans MS:17"), 96)
		end for
		/*         */ %Exponents of six
		Font.Draw("6 = ", 470, 450 - 100 * 4, Font.New("Comic Sans MS:17"), 98)
		Font.Draw(intstr (2), 483, 464 - 100 * 4, Font.New("Comic Sans MS:10"), 98)
		Font.Draw(intstr (6 ** 2), 510, 450 - 100 * 4, Font.New("Comic Sans MS:17"), 98)
		for i: 0 .. 2
		    Font.Draw("6 = ", 580, 450 - 100 * i, Font.New("Comic Sans MS:17"), 98)
		    Font.Draw(intstr (i + 2), 593, 464 - 100 * i, Font.New("Comic Sans MS:10"), 98)
		    Font.Draw(intstr (6 **(i + 2)), 620, 450 - 100 * i, Font.New("Comic Sans MS:17"), 98)
		end for
		for i: 3 .. 4 %Exponents of seven
		    Font.Draw("7 = ", 580, 450 - 100 * i, Font.New("Comic Sans MS:17"), 100)
		    Font.Draw(intstr (i - 1), 593, 464 - 100 * i, Font.New("Comic Sans MS:10"), 100)
		    Font.Draw(intstr (7 **(i - 1)), 620, 450 - 100 * i, Font.New("Comic Sans MS:17"), 100)
		end for
		Font.Draw("7 = ", 690, 450, Font.New("Comic Sans MS:17"), 100)
		Font.Draw(intstr (4), 703, 464, Font.New("Comic Sans MS:10"), 100)
		Font.Draw(intstr (7 ** 4), 730, 450, Font.New("Comic Sans MS:17"), 100)
		for i: 1 .. 3 %Exponents of eight
		    Font.Draw("8 = ", 690, 450 - 100 * i, Font.New("Comic Sans MS:17"), 101)
		    Font.Draw(intstr (i + 1), 703, 464 - 100 * i, Font.New("Comic Sans MS:10"), 101)
		    Font.Draw(intstr (8 **(i + 1)), 730, 450 - 100 * i, Font.New("Comic Sans MS:17"), 101)
		end for
		for i: 0 .. 1
		    Font.Draw("9 = ", 800, 450 - 100 * i, Font.New("Comic Sans MS:17"), 103)
		    Font.Draw(intstr (i + 3), 813, 464 - 100 * i, Font.New("Comic Sans MS:10"), 103)
		    Font.Draw(intstr (9 **(i + 3)), 840, 450 - 100 * i, Font.New("Comic Sans MS:17"), 103)
		end for
		/*         */ %Exponents of nine
		Font.Draw("9 = ", 690, 50, Font.New("Comic Sans MS:17"), 103)
		Font.Draw(intstr (2), 703, 64, Font.New("Comic Sans MS:10"), 103)
		Font.Draw(intstr (9 ** 2), 730, 50, Font.New("Comic Sans MS:17"), 103)
		%drawdot(520, 480, 61) //test
		%fork mathClass //Ta-Da!--pseudo-recursion is possible in Turing(albeit in a very, VERY limited manner)!
		exit
	    end if
	elsif ((((mouseX - tbX) ** 2) /(xClassRadius ** 2) +((mouseY - tbY) ** 2) /(yClassRadius) ** 2) < 1) then %Scroll-over for trigonometry button
	    Font.Draw("Trigonometry", 640, 230, Font.New("Comic Sans MS:20"), 66)
	    Font.Draw("(High School)", 650, 190, Font.New("Comic Sans MS:17"), 66)
	    if (button = 1) then
		q1 := true
		exit
	    end if
	else
	    Font.Draw("Exponents", 233, 230, Font.New("Comic Sans MS:20"), 133)
	    Font.Draw("(Middle School)", 220, 190, Font.New("Comic Sans MS:17"), 133)
	    Font.Draw("Trigonometry", 640, 230, Font.New("Comic Sans MS:20"), 115)
	    Font.Draw("(High School)", 650, 190, Font.New("Comic Sans MS:17"), 115)
	    Font.Draw("(Possibly because of all the brains their ancestors ate, but your zombie classmates do not like to talk about it)", 180, 440, Font.New("Comic Sans MS:10"), 150)
	end if
    end loop
end mathClass

var counter: int := 1
var spell, gram: boolean := false

process englishClass
    fork daisy
    gram := false
    spell := false
    counter := 1
    Font.Draw("Hello " + name + ", welcome to English class!", 520 - length("Hello " + name + ", welcome to math class!") * 6, 500, Font.New("Comic Sans MS:16"), 0)
    Font.Draw("It may not seem like it, but zombies are very smart.", 250, 470, Font.New("Comic Sans MS:16"), 0)
    drawfilloval(ebX, ebY, xClassRadius, yClassRadius, 57 /* placeholder color */) %Exponents button
    Font.Draw("  Spelling", 233, 230, Font.New("Comic Sans MS:20"), 133)
    Font.Draw("and Vocabulary", 220, 190, Font.New("Comic Sans MS:17"), 133)
    drawfilloval(tbX, tbY, xClassRadius, yClassRadius, 57 /* placeholder color */) %Trigonometry button
    Font.Draw("Capitalization", 640, 230, Font.New("Comic Sans MS:20"), 115)
    Font.Draw("  (Grammar)", 650, 190, Font.New("Comic Sans MS:17"), 115)
    loop
	exit when ecc = false
	if ((((mouseX - ebX) ** 2) /(xClassRadius ** 2) +((mouseY - ebY) ** 2) /(yClassRadius) ** 2) < 1) then %Scroll-over for exponents button
	    Font.Draw("  Spelling", 233, 230, Font.New("Comic Sans MS:20"), 61)
	    Font.Draw("and Vocabulary", 220, 190, Font.New("Comic Sans MS:17"), 61)
	    if (button = 1) then
		spell := true
		for i: 0 .. 1040
		    drawfillbox(0 + i, 0, 10 + i, 600, 24) %Transition chalkboard slider
		    delay(1)
		end for
		Font.Draw("Even zombies must learn their ABC's!", 10, 560, Font.New("Comic Sans MS:17"), 0)
		Font.Draw(scx(1) + " - " + spellClass(1), 10, 400, Font.New("Comic Sans MS:24"), 0)
		backX := 170
		backY := 80
		backColor := 150
		drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
		drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
		loop
		    if ((((mouseX - backX - 730) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) /(yBackRadius) ** 2) < 1) and (counter = 1) then 
			Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(1040 - i, 0, 1050 - i, 600, 150) %Transition English class slider
				delay(1)
			    end for 
			    fork englishClass
			    exit
			end if
		    else
			if (counter = 1) then
			Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 0)
			end if
		    end if
		    if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) < 1) and (counter < mex) then
			Font.Draw("< more", 90, 65, Font.New("Comic Sans MS:42"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(0 + i, 0, 10 + i, 600, 24) %Transition back slider    
				delay(1)
			    end for
			    if (counter < mex - 1) then
				drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor) 
				%Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 80)
			    end if
			    drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
			    counter += 1
			    Font.Draw(scx(1 + counter) + " - " + spellClass(1 + counter), 10, 400, Font.New("Comic Sans MS:24"), 0)
			end if  
		    else
			if (counter < mex) then
			Font.Draw("< more", 90, 65, Font.New("Comic Sans MS:42"), 0)
			end if             
		    end if
		    if ((((mouseX - backX - 730) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) /(yBackRadius) ** 2) < 1) and (counter > 1) then
			backX := 170
			backY := 80
			backColor := 150
			Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(1040 - i, 0, 1050 + i, 600, 24) %Transition English class slider
				delay(1)
			    end for 
			    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor) 
			    drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
			    counter -= 1
			    Font.Draw(scx(1 + counter) + " - " + spellClass(1 + counter), 10, 400, Font.New("Comic Sans MS:24"), 0)
			end if
		    else
			if (counter > 1) then
			    Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 0)
			end if
		    end if
		end loop
		exit
	    end if
	elsif ((((mouseX - tbX) ** 2) /(xClassRadius ** 2) +((mouseY - tbY) ** 2) /(yClassRadius) ** 2) < 1) then %Scroll-over for trigonometry button
	    Font.Draw("Capitalization", 640, 230, Font.New("Comic Sans MS:20"), 66)
	    Font.Draw("  (Grammar)", 650, 190, Font.New("Comic Sans MS:17"), 66)
	    if (button = 1) then
		gram := true
		for i: 0 .. 1040
		    drawfillbox(1040 - i, 0, 1050 - i, 600, 24) %Transition chalkboard slider
		    delay(1)
		end for  
		Font.Draw("As the saying goes, 'The flower grows only as well as your grammar is good!'", 10, 560, Font.New("Comic Sans MS:17"), 0)
		/*Font.Draw("Here are important exponential equiv", 270, 510, Font.New("Comic Sans MS:17"), 0)
		exit */
		Font.Draw(gramClass(1), 10, 400, Font.New("Comic Sans MS:14"), 0)
		Font.Draw(gcx(1), 10, 350, Font.New("Comic Sans MS:14"), 0)
		Font.Draw(gcx(2), 10, 300, Font.New("Comic Sans MS:14"), 0)
		Font.Draw(gcx(3), 10, 250, Font.New("Comic Sans MS:14"), 0)
		backX := 170
		backY := 80
		backColor := 150
		drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
		drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
		loop
		    if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) < 1) and (counter = 1) then
			backX := 170
			backY := 80
			backColor := 150    
			Font.Draw("   <", 100, 65, Font.New("Comic Sans MS:50"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(0 + i, 0, 10 + i, 600, 150) %Transition English class slider
				delay(1)
			    end for 
			    fork englishClass
			    exit
			end if
		    else
			if (counter = 1) then
			Font.Draw("   <", 100, 65, Font.New("Comic Sans MS:50"), 0)
			end if
		    end if
		    if ((((mouseX - backX - 730) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) /(yBackRadius) ** 2) < 1) and (counter < 3) then
			Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(1040 - i, 0, 1050 - i, 600, 24) %Transition back slider    
				delay(1)
			    end for
			    if (counter < 2) then
				drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
				%Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 80)
			    end if
			    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor) 
			    counter += 1
			    Font.Draw(gramClass(counter + 1), 10, 400, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(1 + 3 * counter), 10, 350, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(2 + 3 *counter), 10, 300, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(3 + 3 * counter), 10, 250, Font.New("Comic Sans MS:14"), 0)
			end if  
		    else
			if (counter < 3) then
			    Font.Draw("  >", 855, 65, Font.New("Comic Sans MS:50"), 0)
			end if             
		    end if
		    if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) < 1) and (counter > 1) then
			backX := 170
			backY := 80
			backColor := 150
			Font.Draw("   <", 100, 65, Font.New("Comic Sans MS:50"), 80)
			if (button = 1) then
			    for i: 0 .. 1040
				drawfillbox(0 + i, 0, 10 + i, 600, 24) %Transition English class slider
				delay(1)
			    end for 
			    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor) 
			    drawfilloval(backX + 730, backY, xBackRadius, yBackRadius, backColor)
			    counter -= 1
			    Font.Draw(gramClass(counter), 10, 400, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(1 + 3 * counter), 10, 350, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(2 + 3 *counter), 10, 300, Font.New("Comic Sans MS:14"), 0)
			    Font.Draw(gcx(3 + 3 * counter), 10, 250, Font.New("Comic Sans MS:14"), 0)
			end if
		    else
			if (counter > 1) then
			    Font.Draw("   <", 100, 65, Font.New("Comic Sans MS:50"), 0)
			end if
		    end if
		end loop
		exit
	    end if
	else
	    Font.Draw("  Spelling", 233, 230, Font.New("Comic Sans MS:20"), 133)
	    Font.Draw("and Vocabulary", 220, 190, Font.New("Comic Sans MS:17"), 133)
	    Font.Draw("Capitalization", 640, 230, Font.New("Comic Sans MS:20"), 115)
	    Font.Draw("  (Grammar)", 650, 190, Font.New("Comic Sans MS:17"), 115)
	end if
    end loop
end englishClass


/* process jimWalk */

/* notes: Reveal correct answer if enter is pressed; make a solution line, add ready set go; add "Good Job"; 
	add instructions: Zombies love to play tag, so that is the only game they play at Phys. Ed.! Since you are trying to avoid getting tagged by your zombie friends, 
	you walk away from them. However, you can solve probems to quickly dash away fromt your zombie friends! Be careful, however, because entering an incorrect answer will render you
	unable to even walk for a few moments.; */
/* REMEMBER: TAKE OUT yChange := yChange - 1 - walk div 1!!!! */

process addition
    userSol := ""
    answer := ""
    solution := 0
    streak := 0
    if (ac = true) then
	delay(5)
	Font.Draw("Ready. . .", 400, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("Set. . .", 410, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("GO!", 355, 280, Font.New("Comic Sans MS:156"), 150)
	delay(1000)
	for i: 3 .. 5
	    randint(element, 10, 99)
	    solution := solution + element
	    Font.Draw(intstr (element), 30, 600 - 30 * i, Font.New("Comic Sans MS:16"), 16)
	end for
	Font.Draw("+", 10, 450, Font.New("Comic Sans MS:17"), 16) 
	Font.Draw("____", 10, 450, Font.New("Comic Sans MS:17"), 16) 
	    loop
		correct := false
		if (hasch) then
		    getch(answer)
		    if (ord(answer) <= 57 and ord(answer) >= 48) then
			userSol := userSol + answer
			Font.Draw(userSol, 20, 420, Font.New("Comic Sans MS:16"), 16)
		    elsif (ord(answer) = 8 and length(userSol) > 0) then %Backspace
			userSol := userSol(1 .. length(userSol) - 1) %Pseudo-backspace 
			drawfillbox(0, 418, 1040, 448, 48) %Clears prior input
			Font.Draw("____", 10, 450, Font.New("Comic Sans MS:17"), 16) 
			Font.Draw(userSol, 20, 420, Font.New("Comic Sans MS:16"), 16)
		    elsif (ord(answer) = 10 and userSol not= "") then %Enter
			if (strint(userSol) = solution) then
			    %correct := true
			    userSol := ""
			    drawfilloval(545, 510 + yChange, 50, 85, 48) %Erasing Jim
			    yChange += 240
			    delay(15)
			    drawfillbox(0, 418, 80, 600, 48) %Erasing question
			    drawfillbox(180, 568, 145, 600, 48) %Erasing previous streak count 
			    Font.Draw("+", 10, 450, Font.New("Comic Sans MS:17"), 16)
			    Font.Draw("____", 10, 450, Font.New("Comic Sans MS:17"), 16)
			    solution := 0
			    for i : 3 .. 5
				randint(element, 10, 99)
				solution := solution + element
				Font.Draw(intstr (element), 30, 600 - 30 * i, Font.New("Comic Sans MS:16"), 16)
			    end for
			    streak += 1 %Correct streak counter
			    Font.Draw("Streak: " + intstr (streak), 70, 570, Font.New("Comic Sans MS:16"), 42)
			else
			    %correct := false
			    userSol := ""
			    streak := 0
			    drawfilloval(520, 470 + yChange, 40, 40, 48)
			    drawfillbox(0, 418, 600, 600, 48) %Erasing question
			    Font.Draw("The correct answer was: " + intstr (solution), 10, 570, Font.New("Comic Sans MS:16"), 16) 
			    walk := 0
			    delay(1000)
			    drawfillbox(0, 420, 600, 600, 48) %Erasing question
			    %delay(15)
			    Font.Draw("+", 10, 450, Font.New("Comic Sans MS:17"), 16)
			    Font.Draw("____", 10, 450, Font.New("Comic Sans MS:17"), 16)
			    solution := 0
			    for i : 3 .. 5
				randint(element, 10, 99)
				solution := solution + element
				Font.Draw(intstr (element), 30, 600 - 30 * i, Font.New("Comic Sans MS:16"), 16)
			    end for
			end if 
		    end if 
		end if
	exit when touched = true %//likely incorrect code     
	end loop 
    end if
end addition

process multiplication
    userSol := ""
    answer := ""
    solution := 0
    streak := 0
    if (mc = true) then
	delay(5)
	Font.Draw("Ready. . .", 400, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("Set. . .", 410, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("GO!", 355, 280, Font.New("Comic Sans MS:156"), 150)
	delay(1000)
	solution := 1
	randint(element, 100, 999)
	solution := solution * element
	Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
	randint(element, 10, 99)
	solution := solution * element
	Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
	Font.Draw("x", 10, 540, Font.New("Comic Sans MS:17"), 16)
	Font.Draw("____", 10, 540, Font.New("Comic Sans MS:17"), 16) 
	loop
	    correct := false
	    if (hasch) then
		getch(answer)
		if (ord(answer) <= 57 and ord(answer) >= 48) then
		    userSol := userSol + answer
		    Font.Draw(userSol, 5, 510, Font.New("Comic Sans MS:16"), 16)
		elsif (ord(answer) = 8 and length(userSol) > 0) then %Backspace
		    userSol := userSol(1 .. length(userSol) - 1) %Pseudo-backspace 
		    drawfillbox(0, 508, 600, 538, 48) %Clears prior input
		    Font.Draw("____", 10, 540, Font.New("Comic Sans MS:17"), 16) 
		    Font.Draw(userSol, 5, 510, Font.New("Comic Sans MS:16"), 16)
		elsif (ord(answer) = 10 and userSol not= "") then %Enter
		    if (strint(userSol) = solution) then
			%correct := true
			userSol := ""
			drawfilloval(520, 470 + yChange, 40, 40, 0)
			yChange += 240
			delay(15)
			drawfillbox(0, 420, 600, 600, 48) %Erasing question       
			drawfillbox(180, 568, 145, 600, 48) %Erasing previous streak count 
			Font.Draw("x", 10, 540, Font.New("Comic Sans MS:17"), 16)
			Font.Draw("____", 10, 540, Font.New("Comic Sans MS:17"), 16)
			solution := 1
			randint(element, 100, 999)
			solution := solution * element
			Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
			randint(element, 10, 99)
			solution := solution * element
			Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
			streak += 1 %Correct streak counter
			Font.Draw("Streak: " + intstr (streak), 70, 570, Font.New("Comic Sans MS:16"), 42)
		    else
			streak := 0
			userSol := ""
			drawfillbox(0, 420, 600, 600, 48) %Erasing question  
			Font.Draw("The correct answer was: " + intstr (solution), 0, 570, Font.New("Comic Sans MS:14"), 16) 
			walk := 0
			delay(1000)  
			drawfillbox(0, 420, 600, 600, 48) %Erasing question 
			solution := 1
			randint(element, 100, 999)
			solution := solution * element
			Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
			randint(element, 10, 99)
			solution := solution * element
			Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
			Font.Draw("x", 10, 540, Font.New("Comic Sans MS:17"), 16)
			Font.Draw("____", 10, 540, Font.New("Comic Sans MS:17"), 16)
		    end if
		end if 
	    end if
	    exit when touched = true %//likely incorrect code
	end loop 
    end if
end multiplication

process subtraction
    userSol := ""
    answer := ""
    solution := 0
    streak :=0
    if (sc = true) then
	delay(5)
	Font.Draw("Ready. . .", 400, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("Set. . .", 410, 300, Font.New("Comic Sans MS:64"), 150)
	delay(1000)
	drawfillbox(0, 0, 1040, 600, 48)
	Font.Draw("GO!", 355, 280, Font.New("Comic Sans MS:156"), 150)
	delay(1000)
	solution := 0
	randint(element, 1000, 9099)
	solution := solution + element
	Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
	randint(element, 100, 999)
	solution := solution - element
	Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
	Font.Draw("-", 10, 540, Font.New("Comic Sans MS:17"), 16) 
	Font.Draw("______", 10, 540, Font.New("Comic Sans MS:17"), 16) 
	loop
	    correct := false
	    if (hasch) then
		getch(answer)
		if (ord(answer) <= 57 and ord(answer) >= 48) then
		    userSol := userSol + answer
		    Font.Draw(userSol, 8, 510, Font.New("Comic Sans MS:16"), 16)
		elsif (ord(answer) = 8 and length(userSol) > 0) then %Backspace
		    userSol := userSol(1 .. length(userSol) - 1) %Pseudo-backspace 
		    drawfillbox(0, 508, 600, 538, 48) %Clears prior input
		    Font.Draw("______", 10, 540, Font.New("Comic Sans MS:17"), 16) 
		    Font.Draw(userSol, 8, 510, Font.New("Comic Sans MS:16"), 16)
		elsif (ord(answer) = 10 and userSol not= "") then %Enter
		    if (strint(userSol) = solution) then
			%correct := true
			userSol := ""
			drawfilloval(520, 470 + yChange, 40, 40, 0)
			yChange += 240
			delay(15)
			drawfillbox(0, 420, 600, 600, 48) %Erasing question       
			drawfillbox(200, 568, 145, 600, 48) %Erasing previous streak count 
			Font.Draw("-", 10, 540, Font.New("Comic Sans MS:17"), 16)
			Font.Draw("______", 10, 540, Font.New("Comic Sans MS:17"), 16)
			solution := 0
			randint(element, 1000, 9999)
			solution := solution + element
			Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
			randint(element, 100, 999)
			solution := solution - element
			Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
			streak += 1 %Correct streak counter
			Font.Draw("Streak: " + intstr (streak), 80, 570, Font.New("Comic Sans MS:16"), 42)
		    else
			streak := 0
			userSol := ""
			drawfillbox(0, 420, 600, 600, 48) %Erasing question 
			Font.Draw("The correct answer was: " + intstr (solution), 0, 570, Font.New("Comic Sans MS:14"), 16) 
			walk := 0
			delay(1000)   
			drawfillbox(0, 420, 600, 600, 48) %Erasing question 
			solution := 0
			randint(element, 1000, 9999)
			solution := solution + element
			Font.Draw(intstr (element), 30, 570, Font.New("Comic Sans MS:16"), 16)
			randint(element, 100, 999)
			solution := solution - element
			Font.Draw("  " + intstr (element), 30, 540, Font.New("Comic Sans MS:16"), 16)
			Font.Draw("-", 10, 540, Font.New("Comic Sans MS:17"), 16)
			Font.Draw("______", 10, 540, Font.New("Comic Sans MS:17"), 16)
		    end if
		end if 
	    end if
	    exit when touched = true %//likely incorrect code
	end loop 
    end if
end subtraction

var regulator, meter, startTime, score, highScore: int := 0
var daisyFieldX, daisyFieldY: array 0 .. 19 of int

process physicalEducation
    drawfillbox(0, 0, 1040, 600, 48)
    startTime := Time.Elapsed
    accel := 0
    regulator := 0
    meter := 0
    yChange := 0
    score := 0
    delay(3000) %Ready, Set, Go!
    %var xZChange, yZChange, xChange, yChange: int := 0
    for i: 0 .. 19
	randint(daisyFieldX(i), 300, 740)
	randint(daisyFieldY(i), 0, 1200)
	Pic.Draw(daisyPic, daisyFieldX(i), daisyFieldY(i), picMerge)
    end for
    Font.Draw("Your score: " + intstr((Time.Elapsed - startTime) div 1000), 800, 570, Font.New("Comic Sans:16"), 9) 
    loop
	/*drawfilloval (520, 470 + yChange, 40, 40, 41) %me*/
	regulator += 1
	score := (Time.Elapsed - startTime) div 1000
	for i: 0 .. 19
	    Pic.Draw(daisyPic, daisyFieldX(i), daisyFieldY(i) + meter, picMerge)
	end for
	Font.Draw(intstr(score), 912, 570, Font.New("Comic Sans MS:16"), 9) 
	if (regulator div 3 mod 4 = 0) then %Walking
	    Pic.Draw(jimBack, 520, 470 + yChange + (walk div 1), picMerge)
	    Pic.Draw(zombieBack, 520, -40, picMerge)
	    Pic.Draw(zombieBack, 475, -40, picMerge)
	    Pic.Draw(zombieBack, 565, -40, picMerge)
	elsif (regulator div 3 mod 4 = 1) then
	    Pic.Draw(jls, 520, 470 + yChange + (walk div 1), picMerge)
	    Pic.Draw(zombieBack, 525, -40, picMerge)
	    Pic.Draw(zombieBack, 470, -40, picMerge)
	    Pic.Draw(zombieBack, 570, -40, picMerge)
	elsif (regulator div 3 mod 4 = 2) then
	    Pic.Draw(jimBack, 520, 470 + yChange + (walk div 1), picMerge)
	    Pic.Draw(zombieBack, 520, -40, picMerge)
	    Pic.Draw(zombieBack, 465, -40, picMerge)
	    Pic.Draw(zombieBack, 575, -40, picMerge)
	elsif (regulator div 3 mod 4 = 3) then
	    Pic.Draw(jrs, 520, 470 + yChange + (walk div 1), picMerge)
	    Pic.Draw(zombieBack, 515, -40, picMerge)
	    Pic.Draw(zombieBack, 470, -40, picMerge)
	    Pic.Draw(zombieBack, 570, -40, picMerge)
	end if
	if (yChange < -500) then %Game over!
	    delay(1000)
	    drawfillbox(0, 200, 1040, 600, 48)
	    Font.Draw("G A M E   O V E R!", 150, 400, Font.New("Comic Sans MS:64"), 16) 
	    if (score > highScore) then
		highScore := score
		Font.Draw("New", 305, 350, Font.New("Comic Sans MS:30"), 40)
	    else
		Font.Draw("Your Score: " + intstr(score), 375, 490, Font.New("Comic Sans MS:36"), 32) 
	    end if
	    Font.Draw("High Score: " + intstr(highScore), 395, 350, Font.New("Comic Sans MS:30"), 16) 
	    Font.Draw("We tagged you!", 410, 100, Font.New("Comic Sans MS:24"), 100) 
	    Pic.Draw(zombieFront, 350, 100, picMerge)
	    Pic.Draw(zombieFront, 640, 100, picMerge)
	    Pic.Draw(zombieFront, 500, 135, picMerge)
	    touched := true
	    exit
	end if
	delay (50)
	drawfillbox(910, 565, 1040, 600, 48) %Update score
	drawfillbox(300, 0, 780, 600, 48)
	accel += 0.1
	meter := meter - 4 - accel div 100
	yChange := yChange - 1 - accel div 100 
	/*if (incorrect = false) then %Even if the user is not entering anything, the character still walks
	    walk += (1 / 2)
	    walk := walk mod 2
	end if 
	if (correct = true) then
	    %yChange += 10
	end if */
	if (meter < -1000) then
	    meter += 1600
	end if
    end loop
end physicalEducation

process physEd
    backX := 100
    backY := 80
    backColor := 48
    xBackRadius := 72
    yBackRadius := 40
    Font.Draw(name + ", welcome to Zombie Physical Education Class!", 200 - length(name) * 10, 530, Font.New("Comic Sans MS:22"), 0)
    delay(200)
    drawfilloval(abX, abY, xPhysEdRadius, yPhysEdRadius, 40) %Addition
    Font.Draw("Addition", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 0)
    delay(200)
    drawfilloval(mbX, mbY, xPhysEdRadius, yPhysEdRadius, 40) %Multiplication
    Font.Draw("Multiplication", mbX - 93, mbY - 5, Font.New("Comic Sans MS:24"), 0)
    delay(200)
    drawfilloval(sbX, sbY, xPhysEdRadius, yPhysEdRadius, 40) %Subtraction
    Font.Draw("Subtraction", sbX - 85, sbY - 5, Font.New("Comic Sans MS:24"), 0)
/*    drawfilloval(pbX, pbY, xPhysEdRadius, yPhysEdRadius, 40) %Exponents
    Font.Draw("Exponents", pbX - 80, pbY - 5, Font.New("Comic Sans MS:24"), 0)
    drawfilloval(trbX, trbY, xPhysEdRadius, yPhysEdRadius, 40) %Trigonometry
    Font.Draw("Trigonometry", trbX - 95, trbY - 5, Font.New("Comic Sans MS:24"), 0) */
    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
    Font.Draw("Instructions", backX - 50, backY - 5, Font.New("Comic Sans MS:14"), 0)
    loop
	exit when pec = false
	if ((((mouseX - abX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - abY) ** 2) /(yPhysEdRadius) ** 2) < 1) then %Addition scroll-over
	    Font.Draw("Addition", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 80)
	    if (button = 1) then
		ac := true
		delay(5)
		fork addition
		fork additionSong
		fork physicalEducation
		exit
	    end if
	elsif ((((mouseX - mbX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - mbY) ** 2) /(yPhysEdRadius) ** 2) < 1) then %Multiplication scroll-over
	    Font.Draw("Multiplication", mbX - 93, mbY - 5, Font.New("Comic Sans MS:24"), 80)
	    if (button = 1) then
		mc := true
		delay(5)
		fork multiplication
		fork multiplicationSong
		fork physicalEducation
		exit
	    end if
	elsif ((((mouseX - sbX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - sbY) ** 2) /(yPhysEdRadius) ** 2) < 1) then %Subtraction scroll-over
	    Font.Draw("Subtraction", sbX - 85, sbY - 5, Font.New("Comic Sans MS:24"), 80)
	    if (button = 1) then
		sc := true
		delay(5)
		fork subtraction
		fork subtractionSong
		fork physicalEducation
		exit
	    end if
	/*elsif ((((mouseX - pbX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - pbY) ** 2) /(yPhysEdRadius) ** 2) < 1) then %Exponents scroll-over
	    Font.Draw("Exponents", pbX - 80, pbY - 5, Font.New("Comic Sans MS:24"), 80)
	elsif ((((mouseX - trbX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - trbY) ** 2) /(yPhysEdRadius) ** 2) < 1) then %Trigonometry scroll-over 
	    Font.Draw("Trigonometry", trbX - 95, trbY - 5, Font.New("Comic Sans MS:24"), 80) */
	elsif ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) < 1) then
	    Font.Draw("Instructions", backX - 50, backY - 5, Font.New("Comic Sans MS:14"), 80) 
	    pec := false
	    delay(5)
	    drawfillbox(backX + xBackRadius, 0, 1040, 600, 64)
	    drawfillbox(0, 200, 1040, 600, 64)
	    loop
		Font.Draw("Zombies love to play tag, so that is the only game they play.", 200, 400, Font.New("Comic Sans MS:18"), 0)
		Font.Draw("Answer the questions on the top left corner to run away from them!", 180, 360, Font.New("Comic Sans MS:18"), 0)
		Font.Draw("               How long can you last without getting caught?", 200, 320, Font.New("Comic Sans MS:18"), 0)
	    exit when (((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) > 1
	    end loop
	    drawfillbox(backX + xBackRadius, 0, 1040, 600, 64)
	    drawfillbox(0, 200, 1040, 600, 64)
	    pec := true
	    fork physEd
	    exit
	else
	    Font.Draw("Multiplication", mbX - 93, mbY - 5, Font.New("Comic Sans MS:24"), 0)
	    Font.Draw("Addition", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 0)
	    Font.Draw("Subtraction", sbX - 85, sbY - 5, Font.New("Comic Sans MS:24"), 0)
	    /*Font.Draw("Exponents", pbX - 80, pbY - 5, Font.New("Comic Sans MS:24"), 0)
	    Font.Draw("Trigonometry", trbX - 95, trbY - 5, Font.New("Comic Sans MS:24"), 0)*/
	    Font.Draw("Instructions", backX - 50, backY - 5, Font.New("Comic Sans MS:14"), 0)
	end if
    end loop
end physEd

process physEdBack
    loop
	if (touched = true) then
	    drawfilloval(abX, abY, xPhysEdRadius, yPhysEdRadius, 40) %Addition
	    Font.Draw("  Retry", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 0)
	    drawfilloval(sbX, sbY, xPhysEdRadius, yPhysEdRadius, 40) %Addition
	    Font.Draw("   Back", sbX - 65, sbY - 5, Font.New("Comic Sans MS:24"), 0)
	    loop
		if ((((mouseX - sbX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - sbY) ** 2) /(yPhysEdRadius) ** 2) < 1) then
		    Font.Draw("   Back", sbX - 65, sbY - 5, Font.New("Comic Sans MS:24"), 80)
		    if (button = 1) then
			touched := false
			ac := false
			sc := false
			mc := false
			pc := false
			trc := false
			drawfill(1, 1, 64, 1)
			fork physEd
			exit
		    end if
		elsif ((((mouseX - abX) ** 2) /(xPhysEdRadius ** 2) +((mouseY - abY) ** 2) /(yPhysEdRadius) ** 2) < 1) then
		    Font.Draw("  Retry", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 80)
		    if (button = 1) then
			touched := false
			if (ac = true) then
			    fork addition
			    fork additionSong
			    fork physicalEducation
			    exit
			elsif (sc = true) then
			    fork subtraction
			    fork subtractionSong
			    fork physicalEducation
			    exit
			elsif (mc = true) then
			    fork multiplication
			    fork multiplicationSong
			    fork physicalEducation
			    exit
			end if  
		    end if
		else
		    Font.Draw("  Retry", abX - 65, abY - 5, Font.New("Comic Sans MS:24"), 0)
		    Font.Draw("   Back", sbX - 65, sbY - 5, Font.New("Comic Sans MS:24"), 0)
		end if
	    end loop
	end if
    end loop
end physEdBack

fork physEdBack

var daisyCount, n, m, p: int := 0
var escaped: boolean := false

process communityService
    View.Set("nocursor")
    daisyCount := 0
    userSol := ""
    startTime := Time.Elapsed
    Font.Draw("Zombies love daisies, and they love being helpful, so they plant pretty daisies for community service!", 100, 450, Font.New("Comic Sans MS:14"), 16)
    Font.Draw("Spell the vocabulary word correctly to help plant flowers! Press the escape button to return to the main menu.", 60, 350, Font.New("Comic Sans MS:14"), 16)
    Font.Draw("Press any key to begin planting:", 360, 250, Font.New("Comic Sans MS:14"), 16)
    Input.Pause
    drawfill(1, 1, 80, 1)
    randint(n, 1, mex + 1)
    Font.Draw(spellClass(n), 520 - length(spellClass(n)) * 6, 500, Font.New("Comic Sans MS:17"), 150)
    Font.Draw("____________________________", 300, 110, Font.New("Comic Sans MS:17"), 0)
    loop
	getch(answer)
	exit when ord(answer) = 27
	if (ord(answer) <= 122 and ord(answer) >= 92) then
	    userSol := userSol + answer
	    Font.Draw(userSol, 400, 120, Font.New("Comic Sans MS:28"), 44)
	elsif (ord(answer) = 8 and length(userSol) > 0) then %Backspace
	    userSol := userSol(1 .. length(userSol) - 1) %Pseudo-backspace
	    drawfillbox(0, 0, 1040, 160, 80)
	    Font.Draw(userSol, 400, 120, Font.New("Comic Sans MS:28"), 44)
	    Font.Draw("____________________________", 300, 110, Font.New("Comic Sans MS:17"), 0)
	elsif (ord(answer) = 10 and name not= "") then %Enter
	    if (userSol = scx(n)) then
		daisyCount += 1 
		answer := ""
		userSol := ""
		drawfill(1, 1, 80, 1)
		for i: 1 .. daisyCount
		    randint(p, 0, 900)
		    randint(m, 0, 450)
		    flowerShiftX := p
		    flowerShiftY := m
		    fork daisy
		    delay(5)
		end for 
		Font.Draw("Hooray! Your answer was correct!", 520 - length("Hooray! Your answer was correct!") * 6, 300, Font.New("Comic Sans MS:17:Bold"), 44)
		randint(n, 1, mex + 1)
		Font.Draw(spellClass(n), 520 - length(spellClass(n)) * 6, 500, Font.New("Comic Sans MS:17"), 150)
		Font.Draw("____________________________", 300, 110, Font.New("Comic Sans MS:17"), 0)
	    else
		answer := ""
		userSol := ""
		drawfill(1, 1, 80, 1)
		Font.Draw("The correct answer was: " + scx(n), 520 - length("The correct answer was: " + scx(n)) * 6, 500, Font.New("Comic Sans MS:17"), 0)
		Input.Flush
		delay(2000)
		drawfill(1, 1, 80, 1)
		for i: 1 .. daisyCount
		    randint(p, 0, 900)
		    randint(m, 0, 450)
		    flowerShiftX := p
		    flowerShiftY := m
		    fork daisy
		    delay(5)
		end for 
		randint(n, 1, mex + 1)
		Font.Draw(spellClass(n), 520 - length(spellClass(n)) * 6, 500, Font.New("Comic Sans MS:17"), 150)
		Font.Draw("____________________________", 300, 110, Font.New("Comic Sans MS:17"), 0)
	    end if
	end if
	if (daisyCount = 1) then
	    Font.Draw("You have planted " + intstr(daisyCount) + " daisy", 0, 570, Font.New("Comic Sans MS:17"), 11)
	else
	    Font.Draw("You have planted " + intstr(daisyCount) + " daisies", 0, 570, Font.New("Comic Sans MS:17"), 11)
	end if
    end loop
    drawfill(1, 1, 80, 1)
    if (daisyCount not= 1) then
	Font.Draw("You have planted " + intstr(daisyCount) + " daisies in " + realstr(round(((Time.Elapsed - startTime) / 6000)) / 10, 0) + " minutes! Please press any key to continue...", 420 - 6 * length("You have planted " + intstr(daisyCount) + "daisies in " + realstr((Time.Elapsed - startTime / 6000) mod .01, 0) + "minutes!"), 295, Font.New("Comic Sans MS:16"), 40)
    else
	Font.Draw("You have planted " + intstr(daisyCount) + " daisy in " + realstr(round(((Time.Elapsed - startTime) / 6000)) / 10, 0) + " minutes! Please press any key to continue...", 420 - 6 * length("You have planted " + intstr(daisyCount) + "daisy in " + realstr((Time.Elapsed - startTime / 6000) mod .01, 0) + "minutes!"), 295, Font.New("Comic Sans MS:16"), 40)
    end if
	escaped := true
end communityService

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

process mainMenu
    mmc := true
    mcc := false
    pec := false
    csc := false
    ecc := false
    fork menuSong
    flowerShiftX := 0
    flowerShiftY := 0
    for i: -500 .. 1040 %Set textured menu background
	if (i mod 2 = 0) then %Give "sweeping transition" effect
	    delay(1)
	end if
	drawline(i, 0, 480 + i, 600, i mod 5 + 46)
    end for
    fork daisy
    delay(200)
    drawfilloval(mcbX, mcbY, xMenuRadius, yMenuRadius, 74) %Zombie math class button
    Font.Draw("Zombie Math Class", 130, 395, Font.New("Comic Sans MS:20"), 124)
    delay(200)
    drawfilloval(ecbX, ecbY, xMenuRadius, yMenuRadius, 74) %Zombie English class button
    Font.Draw("Zombie English Class", 660, 395, Font.New("Comic Sans MS:20"), 124)
    delay(200)
    drawfilloval(etbX, etbY, xMenuRadius, yMenuRadius, 64) %"Physical education time!" button
    Font.Draw("Physical Education Time!", 100, 195, Font.New("Comic Sans MS:20"), 136)
    delay(200)
    drawfilloval(stbX, stbY, xMenuRadius, yMenuRadius, 68) %"Community service time!" button
    Font.Draw("Community Service Time!", 630, 195, Font.New("Comic Sans MS:20"), 140)

    loop %Main menu button interaction
	clicked := false
	if ((((mouseX - mcbX) ** 2) /(xMenuRadius ** 2) +((mouseY - mcbY) ** 2) /(yMenuRadius) ** 2) < 1) then
	    Font.Draw("Zombie Math Class", 130, 395, Font.New("Comic Sans MS:20"), 80) %Scroll-over change
	    if (button = 1) then %Selection change
		clicked := true
		for i: 1 .. 167
		    drawfilloval(mcbX, mcbY, 8 * i, 3 * i, 150)
		    delay(4)
		end for
		fork mathClass
		fork mathClassSong
		mcc := true
		mmc := false
		exit
	    end if
	elsif ((((mouseX - ecbX) ** 2) /(xMenuRadius ** 2) +((mouseY - ecbY) ** 2) /(yMenuRadius) ** 2) < 1) then
	    Font.Draw("Zombie English Class", 660, 395, Font.New("Comic Sans MS:20"), 80) %Scroll-over change
	    if (button = 1) then %Selection change
		clicked := true
		for i: 1 .. 167
		    drawfilloval(ecbX, ecbY, 8 * i, 3 * i, 150)
		    delay(4)
		end for
		fork englishClass
		fork englishClassSong
		ecc := true
		mmc := false
	    end if
	elsif ((((mouseX - etbX) ** 2) /(xMenuRadius ** 2) +((mouseY - etbY) ** 2) /(yMenuRadius) ** 2) < 1) then
	    Font.Draw("Physical Education Time!", 100, 195, Font.New("Comic Sans MS:20"), 80) %Scroll-over change
	    if (button = 1) then %Selection change
		clicked := true
		for i: 1 .. 167
		    drawfilloval(etbX, etbY, 8 * i, 3 * i, 64 /* placeholder color */)
		    delay(4)
		end for
		pec := true
		fork physEd
		fork physEdSong
		mmc := false
		exit
	    end if
	elsif ((((mouseX - stbX) ** 2) /(xMenuRadius ** 2) +((mouseY - stbY) ** 2) /(yMenuRadius) ** 2) < 1) then
	    Font.Draw("Community Service Time!", 630, 195, Font.New("Comic Sans MS:20"), 80) %Scroll-over change
	    if (button = 1) then %Selection change
		clicked := true
		for i: 1 .. 167
		    drawfilloval(stbX, stbY, 8 * i, 3 * i, 80 /* placeholder color */)
		    delay(4)
		end for
		csc := true
		fork communityService
		fork communityServiceSong
		mmc := false
		exit
	    end if
	else
	    Font.Draw("Zombie Math Class", 130, 395, Font.New("Comic Sans MS:20"), 124)
	    Font.Draw("Zombie English Class", 660, 395, Font.New("Comic Sans MS:20"), 124)
	    Font.Draw("Physical Education Time!", 100, 195, Font.New("Comic Sans MS:20"), 136)
	    Font.Draw("Community Service Time!", 630, 195, Font.New("Comic Sans MS:20"), 140)
	end if
	exit when clicked = true
    end loop
    clicked := false
end mainMenu

process esc
    loop
	setscreen("nocursor")
	Input.Pause
	loop
	    if escaped = true then
		fork mainMenu
		escaped := false
		exit
	    end if
	end loop
    end loop
end esc

fork esc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* mbx := 511
mby := 81
xMenuBackRadius := 60
yMenuBackRadius := 45
menuBackColor := 95 */

process menuBack
    loop        
	if (mcc = true) and (exponents = false) /* and (q1 = false and q2 = false and q3 = false and q4 = false) */then
	    mbx := 511
	    mby := 81
	    xMenuBackRadius := 60
	    yMenuBackRadius := 45
	    menuBackColor := 95
	    drawfilloval(mbx, mby, xMenuBackRadius, yMenuBackRadius, menuBackColor)
	    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 150)
	    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 150)
	    loop
		exit when exponents = true or mcc = false /* exponents = true or q1 = true or q2 = true or q3 = true or q4 = true */
		if ((((mouseX - mbx) ** 2) /(xMenuBackRadius ** 2) +((mouseY - mby) ** 2) / (yMenuBackRadius) ** 2) < 1) then
		    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 80)
		    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 80)
		    if (button = 1) then
			fork mainMenu
			exit
		    end if
		else
		    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 150)
		    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 150)
		end if
	    end loop
	elsif (pec = true) and (ac = false and sc = false and mc = false and trc = false and pc = false) then
	    mbx := 520
	    mby := 275
	    xMenuBackRadius := 60
	    yMenuBackRadius := 45
	    menuBackColor := 95
	    drawfilloval(mbx, mby, xMenuBackRadius, yMenuBackRadius, menuBackColor)
	    Font.Draw("Main", 490, 282, Font.New("Comic Sans MS:20"), 150)
	    Font.Draw("Menu", 487, 255, Font.New("Comic Sans MS:20"), 150)
	    loop
		exit when ac = true or sc = true or pc = true or mc = true or trc = true or pec = false
		if ((((mouseX - mbx) ** 2) /(xMenuBackRadius ** 2) +((mouseY - mby) ** 2) / (yMenuBackRadius) ** 2) < 1) then
		    Font.Draw("Main", 490, 282, Font.New("Comic Sans MS:20"), 80)
		    Font.Draw("Menu", 487, 255, Font.New("Comic Sans MS:20"), 80)
		    if (button = 1) then
			fork mainMenu
			exit
		    end if
		else
		    Font.Draw("Main", 490, 282, Font.New("Comic Sans MS:20"), 150)
		    Font.Draw("Menu", 487, 255, Font.New("Comic Sans MS:20"), 150)
		end if
	    end loop
	elsif (ecc = true) and (spell = false and gram = false) then
	    mbx := 511
	    mby := 81
	    xMenuBackRadius := 60
	    yMenuBackRadius := 45
	    menuBackColor := 95
	    drawfilloval(mbx, mby, xMenuBackRadius, yMenuBackRadius, menuBackColor)
	    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 150)
	    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 150)
	    loop
		exit when ecc = false or spell = true or gram = true /* exponents = true or q1 = true or q2 = true or q3 = true or q4 = true */
		if ((((mouseX - mbx) ** 2) /(xMenuBackRadius ** 2) +((mouseY - mby) ** 2) / (yMenuBackRadius) ** 2) < 1) then
		    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 80)
		    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 80)
		    if (button = 1) then
			fork mainMenu
			exit
		    end if
		else
		    Font.Draw("Main", 480, 86, Font.New("Comic Sans MS:20"), 150)
		    Font.Draw("Menu", 477, 55, Font.New("Comic Sans MS:20"), 150)
		end if
	    end loop
	end if
    end loop 
end menuBack

fork menuBack

process mathBack
    loop           
	if (q1 = true) then
	    backX := 170
	    backY := 80
	    for i: 0 .. 1040
		drawfillbox(1040 - i, 0, 1050 - i, 600, 24) %Transition chalkboard slider
		delay(1)
	    end for  
	    backColor := 150
	    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
	    loop
		if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) / (yBackRadius) ** 2) < 1) then
		    Font.Draw("<  Back", 125, 75, Font.New("Comic Sans MS:19"), 80)
		    if (button = 1) then
			for i: 0 .. 1040
				drawfillbox(0 + i, 0, 10 + i, 600, 150) %Transition math class slider
				delay(1)
			end for        
			fork mathClass
			mcc := true
			exit
		    end if
		else
		    Font.Draw("<  Back", 125, 75, Font.New("Comic Sans MS:19"), 0)
		end if
		%exit when next quadrant is clicked or back is clicked
	    end loop
	elsif (q2 = true or q3 = true or q4 = true) then
	    for i: 0 .. 600
		drawfillbox(0, 0 + i, 1040, 10 + i, 24) %Transition chalkboard slider
		delay(1)
	    end for  
	    backColor := 150
	    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
	    loop
		if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) /(yBackRadius) ** 2) < 1) then
		    Font.Draw("<  Back", 125, 75, Font.New("Comic Sans MS:19"), 80)
		    if (button = 1) then
			for i: 0 .. 1040
				drawfillbox(0 + i, 0, 10 + i, 600, 24) %Transition chalkboard slider
				delay(1)
			end for        
			fork mathClass
			mcc := true
			exit
		    end if
		else
		    Font.Draw("<  Back", 125, 75, Font.New("Comic Sans MS:19"), 0)
		end if      
		%exit when next quadrant is clicked or back is clicked
	    end loop
	elsif (exponents = true) then
	    delay(1041)
	    backColor := 150
	    backX := 900
	    drawfilloval(backX, backY, xBackRadius, yBackRadius, backColor)
	    loop
		if ((((mouseX - backX) ** 2) /(xBackRadius ** 2) +((mouseY - backY) ** 2) /(yBackRadius) ** 2) < 1) then
		    Font.Draw("Back  >", 855, 75, Font.New("Comic Sans MS:19"), 80)
		    if (button = 1) then
			for i: 0 .. 1040
			    drawfillbox(1040 - i, 0, 1050 - i, 600, 150) %Transition back slider    
			    delay(1)
			end for         
			fork mathClass
			exponents := false
			mcc := true
			exit
		    end if  
		else
		    Font.Draw("Back  >", 855, 75, Font.New("Comic Sans MS:19"), 0)
		end if
		%exit when next quadrant is clicked or back is clicked
	    end loop
	end if
    end loop
 end mathBack

/* =============================================================================================================================================================
    The Real Code Starts Here  
 ============================================================================================================================================================= */

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

View.Set("nooffscreenonly")

/*
// Running + walking animation
var hi: int := 0
loop
    hi += 1
    if (hi mod 4 = 1) then
	Pic.Draw(jimBack, 540, 100, picMerge)
	Pic.Draw(jrs, 740, 100, picMerge)
    elsif (hi mod 4 = 0) then
	Pic.Draw(jls, 540, 100, picMerge)
	Pic.Draw(jls, 740, 100, picMerge)
    elsif (hi mod 4 = 2) then
	Pic.Draw(jrs, 540, 100, picMerge)
	Pic.Draw(jls, 740, 100, picMerge)
    elsif (hi mod 4 = 3) then
	Pic.Draw(jimBack, 540, 100, picMerge)
	Pic.Draw(jrs, 740, 100, picMerge)
    end if
    delay(150)
    cls
end loop */
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fork titleSong
fork intro
/*
//test
Pic.Draw(jimBack, 100, 150, picMerge)
Pic.Draw(jls, 0, 0, picMerge)
Pic.Draw(jim, 100, 0, picMerge)
Pic.Draw(jrs, 200, 0, picMerge)
Pic.Draw(zombieBack, 300, 0, picMerge)
Pic.Draw(zombieFront, 400, 0, picMerge)
*/
delay(3100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* drawfill(1, 1, 80, 1) %Placeholder for title screen */

introX := 1040
speed := 60

for i: 0 .. 600
    drawline(0, i, 1040, i, i mod 3 + 48)
end for

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 390 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", introX, 400, Font.New("Comic Sans MS:128"), 0)
   /* Font.Draw("O", 180 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("T", 2 * 180 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("U", 3 * 180 + introX, 400, Font.New("Comic Sans MS:128"), 0) */
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

introX := 1040

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 390 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("O", 150 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    /*Font.Draw("T", 2 * 180 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("U", 3 * 180 + introX, 400, Font.New("Comic Sans MS:128"), 0) */
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

introX := 1040

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 390 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("O", 2 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("T", (2 * 150) + introX, 400, Font.New("Comic Sans MS:128"), 0)
    /*Font.Draw("U", 3 * 180 + introX, 400, Font.New("Comic Sans MS:128"), 0) */
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

introX := 1040

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 390 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("O", 2 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("T", 3 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("U", 3 * 150 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

introX := 1040

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 390 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("O", 2 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("T", 3 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("U", 4 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw(":", 4 * 150 + introX, 400, Font.New("Comic Sans MS:128"), 0)
    Pic.Draw(zombieFront, 4 * 150 + introX + 100, 400, picMerge)
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

introX := 1040

for i: 0 .. 15 
    View.Set("offscreenonly")
    for j: 290 .. 600
	drawline(0, j, 1040, j, j mod 3 + 48)
    end for
    Pic.Draw(zombieFront, 30, 400, picMerge)
    Font.Draw("S", 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("O", 2 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("T", 3 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw("U", 4 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Font.Draw(":", 5 * 150, 400, Font.New("Comic Sans MS:128"), 0)
    Pic.Draw(zombieFront, 5 * 150 + 100, 400, picMerge)
    Font.Draw("______________________________", introX, 370, Font.New("Comic Sans MS:28"), 78)
    Font.Draw("  School   Of    The   Undead", introX, 302, Font.New("Comic Sans MS:36"), 0)
    View.Update
    if (introX < 10) then
	exit
    end if
    delay(25)
    introX -= speed
end for

View.Set("nooffscreenonly, nocursor")

Font.Draw("Enter your name to begin!", 260, 200, Font.New("Comic Sans MS:28"), 0)

Font.Draw("__________________________", 190, 100, Font.New("Comic Sans MS:28"), 0)

Pic.Draw(jim, 747, 156, picMerge)

fork daisy
delay(15)
flowerShiftX := 770
fork daisy
delay(1)
flowerShiftX := 0
loop
    getch(answer)
    if (ord(answer) <= 122 and ord(answer) >= 92) or (ord(answer) >= 65 and ord(answer) <= 90) or (ord(answer) = 32) then
	name := name + answer
	Font.Draw(name, 190, 120, Font.New("Comic Sans MS:28"), 44)
    elsif (ord(answer) = 8 and length(name) > 0) then %Backspace
	name := name(1 .. length(name) - 1) %Pseudo-backspace
	for i: 105 .. 150 %Clears prior input
	    drawline(150, i, 750, i, i mod 3 + 48)
	end for
	Font.Draw(name, 190, 120, Font.New("Comic Sans MS:28"), 44)
    elsif (ord(answer) = 10 and name not= "") then %Enter
	answer := ""
	exit
    end if
    exit when length(name) = 29
end loop
began := true

fork mathBack
fork mainMenu
delay(1000)
fork daisy

loop
    if (q1 = true) then
	fork QuadrantI
	mcc := false
    end if
end loop





