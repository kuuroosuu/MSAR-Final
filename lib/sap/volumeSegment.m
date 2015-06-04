function out=volumeSegment(volume, minLen, plotOpt)
% volumeSegment: Segment a volume curve
%	Usage: volumeSegment(volume, minLen, plotOpt)

%	Roger Jang, 20080807

if nargin<1, selfdemo; return; end
if nargin<2, minLen=round(length(volume)/10); end
if nargin<3, plotOpt=0; end

% Find a point to split
%index=localMin(volume);
[sorted, index]=sort(volume);
found=0;
for i=1:length(index)
	splitPoint=index(i);
	if splitPoint>=minLen & length(volume)-splitPoint>=minLen
		found=1;
		break;
	end
end

if ~found
	out=[];
else
	segment1=volume(1:splitPoint-1);
	segment2=volume(splitPoint+1:end);
	out=[volumeSegment(segment1, minLen), splitPoint, splitPoint+volumeSegment(segment2, minLen)];
end

if plotOpt
	plot(volume); axis tight
	axisLimit=axis;
	for i=1:length(out)
		line(out(i)*[1 1], axisLimit(3:4), 'color', 'r');
	end
	xlabel('Frame index');
	ylabel('Volume');
end

% ====== Self demo
function selfdemo
volume=[276074 225281 128639 130814 177654 202676 157650 146284 224427 257876 232470 245022 349955 351047 305463 346711 314532 227729 224462 193515 243885 307541 272102 1388674 3385763 3861549 3506293 3024758 2892659 2826893 2821189 2786082 2684239 2517764 2346220 1959616 1537351 1299541 1158963 1028489 941770 916991 541532 204832 739573 2679640 4060681 4463664 4546289 4237542 4153335 4460923 3138053 1247792 2528491 4138838 3768660 3562426 3553468 3556487 3483938 3082130 2484674 1472727 1211970 3075651 3956192 3631213 3771043 3806945 3504830 3141926 3060010 3058662 2946226 2815759 2733285 2504319 2442864 2524035 2448125 2341031 2188706 1678049 903438 350476 239790 966439 2421628 2973518 2467597 2188433 2277578 2327329 2224624 2158977 2143896 2189718 2300293 2252762 2091531 2024042 2015817 2030943 2202453 2069336 1870544 2403095 3237405 3662478 3655350 3475906 3253127 2976146 2808231 2890342 2856925 2747598 2941293 3196553 3270826 3207221 2776078 1641940 803686 1121790 2095627 4002094 5645291 5926740 5908017 5395987 4851330 4976942 5543295 5451840 5649231 5590584 4672414 4029009 3796894 3824201 3908064 3927062 3991158 3926565 3655655 3591266 3620121 3562110 3623662 3535432 3385436 3291626 3287132 3345436 3277162 3102668 2855794 2660499 2429895 2060644 1440881 695892 284413 239301 126541 318414 448720 280689 212462 379508 361924 290871 330981 379707 425298 548925 518736 403004 314533 279910 181850 111194 417369 1917207 4311656 5829275 6016968 5686684 5019747 4697179 3568406 1300538 578387 1998421 4325293 5614926 5874690 5935357 5640629 5428968 5197583 5078306 4626134 4021248 3878525 3825647 3698401 3688404 3452846 2114808 836163 450763 438426 1136514 3684809 5326473 4480193 3593387 3258533 3232406 3360508 3371979 3261785 2678233 2106336 1982202 1982475 1941903 1754851 1399706 752640 606030 1017106 1377702 2652269 3685364 3295145 2691305 2518268 1917565 833464 375887 545107 718804 596275 918071 1203224 1105153 1047145 972038 985974 1070908 1078425 1069472 1038422 951405 932533 887498 916673 893452 858446 839996 785528 760657 723593 693832 658119 597673 460624 385325 304910 289335 208594 185861 163054 159483 115804 152335 207577 248068 244842 226374 274887 260491 168503 180994 161800 181039 236562 205020 153644 149987 167831 161247 116452 150243 1283492 3905246 4754428 4372401 4117325 4157531 3930190 3646631 3712436 3713154 3578554 3486702 3420721 3393017 3125287 3007693 3045493 2883380 2815361 2208832 1052739 490875 768454 2330550 3821877 3693137 3491014 3312686 1787563 401798 1678215 4008516 4494654 3957268 3801765 3733960 3583675 3319031 2015928 839064 2436354 2682349 1985811 3293738 3407764 3096980 2844979 2832688 2870777 2757136 2632100 2558243 2469576 2508573 2312596 1833232 1622650 1410434 799570 367970 471736 1311518 2080340 2062125 1987916 1944941 1987981 1906642 1944818 2066433 1973821 1904869 1899532 1860258 1908413 1891434 1884514 1770247 1622340 1824305 2132946 2288425 2184111 1996771 2023942 2049945 2024796 2066892 2057054 2037185 2078071 2192593 2312662 2294419 1506622 505496 278230 795408 1481335 3238179 4897025 5058909 4942233 4655873 4307823 4293012 4464806 4422691 4447530 4010051 3201035 2765195 2620730 2605904 2517956 2349993 2246287 2336379 2411444 2233923 2016135 1838675 1666382 1346797 816024 437371 408625 327327 256352 302189 216196 211549 239488 248152 282661 232450 205202 308511 344921 362905 294223];
out=feval(mfilename, volume, 30, 1);