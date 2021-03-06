###TIMSKA_NLB


За подобрување на евиденцијата и контрола на набавената компјутерска опрема, <b>НЛБ Тутунска планира</b> набавка на програмско решение за евиденција и следење на компјутерската опрема. 

Во прилог е соодветна <i>имплементацијата</i> на ова програмско решение, кое што е веб базирано. 
Избрана платформа на која треба да биде развиено програмското решение е MS .NET. 

	1.	Функционални барања

      	Софтверот за следење на ИТ опремата треба да ги обезбеди следните функционалности:

        •	Евиденција на набавената компјутерска опрема
        •	Следење на статусот на опремата и нејзината локација во банката
        •	Прегледи и пребарување според предефинирани критериуми 

<img src="http://i.imgur.com/e1xzBd3.png" alt="Start Screen"/> 	
- - -
<b>Автентикација и авторизација</b>
      Системот управуваа и со привилегиите на корисниците за пристап во системот. 
<img src="http://i.imgur.com/JLKPezD.png" alt="Start Screen"/><br />

<img src="http://i.imgur.com/aSrFIfK.png" alt="Start Screen"/>
- - -
<br /><br />
Постојат два мода на пристап од страна на корисниците кои го користат системот, <b>Admin</b> и <b>User</b>.
#User мод
   Корисниците<i>(User мод)</i> имаат за цел само да вршат преглед на опремата, да пребаруваат по клучни зборови како и да ги увидат промените кои се направени, како и кои корисници ги извршиле.
<img src="http://i.imgur.com/CRy8tA9.png" alt="Start Screen"/><br />
<br/>
<img src="http://i.imgur.com/E1agBne.png" alt="Start Screen"/><br />
<br/>
<img src="http://i.imgur.com/YFhlgJi.png" alt="Start Screen"/><br />
	Овозможена е опција на така наречен advanced search, каде дополнително, покрај внесените клучни зборови може да избере некои од предифинираните шифрарници.
<img src="http://i.imgur.com/DO8cnBR.png" alt="Start Screen"/><br />
* * *
#Admin мод
   Администраторот<i>(Admin мод)</i> има за цел да врши преглед на опремата, да ја уредува, контролира истата, да врши промени, да додава нова опрема како и да уредува шифрарници.
<br/>
<img src="http://i.imgur.com/uFnqyhV.png" alt="Start Screen"/><br />
<b>1.1.	Евиденција на набавената опрема</b>
	Оваа опција треба да овозможи додавање на нов инвентар . Новата опрема ќе биде дефинирана со следните податоци:

	•	ID – автоматски генериран број кој е единствен и неповторлив и кој се доделува при секој нов внес
	•	Тип на опрема –избор од предефиниран шифрарник 
	•	Производител–избор од предефиниран шифрарник
	•	Модел –избор од предефиниран шифрарник 
	•	Број на продуктот -  поле за внес во кое ќе може да се внесе податок директно или да се прочита со баркод читач  
	•	Сериски број -  поле за внес во кое ќе може да се внесе податок директно или да се прочита со баркод читач
	•	Part No -  поле за внес во кое ќе може да се внесе податок директно или да се прочита со баркод читач
	•	Инвентарен број -  поле за внес во кое ќе може да се внесе податок директно или да се прочита со баркод читач 
	•	Добавувач –избор од предефиниран шифрарник  
	•	Набавна цена– поле за внес
	•	Број на фактура– поле за внес
	•	Датум на внес – датумско поле 
	•	Датум на фактура – датумско поле
	•	Статус –избор од предефиниран шифрарник (слободен, на залиха, сервис, расходуван, активен....)
	•	Корисник –избор од предефиниран шифрарник  
	•	Град –избор од предефиниран шифрарник  
	•	Организациона единица –избор од предефиниран шифрарник  
	•	Служба –избор од предефиниран шифрарник  
	•	Сектор –избор од предефиниран шифрарник  
	•	Број на барање – поле за внес
	•	Број на налог– поле за внес 
	•	Гаранциски рок -поле во кое се внесува гарантниот рок во месеци, во однос на датумот на набавка се калкулира гаранциски 
	•	Број на check lista- поле за внес 
	•	Поле за забелешка 
	•	Прикачување на документи поврзани со набавката: барање, фактура и сл.

	Исто така постои и опција за преглед и пребарување на опремата.Оваа опција треба да овозможи прегледи и пребарување на внесената компјутерска опрема, како и печатење на прегледите. Како филтер може да се искористи  било кој од внесените податоци. 
	Прегледот што ќе се добие како резултат од пребарувањето треба да обезбеди увид во сите податоци за избраната опрема. Притоа, треба да биде овозможено дополнително сортирање и групирање на опремата прикажана во одбраниот преглед

	Решението овозможува поврзување со постојната база на вработени во банката, од каде ќе можат да се црпат податоците за вработените.

- - -

<b>1.2.	Додавање на нови податоци, односно нови опреми, преку предифинирани шифрарници.</b>
Додавањето е по стого запазен критериум и е имплементирано соодветна валидација на полињата.<br />
<img src="http://i.imgur.com/rFTKMmG.png" alt="Start Screen"/>
- - -

<b>1.3.	Измени на внесените податоци за опремата</b><br />
	
	Преку оваа опција се овозможува измени на внесените податоци за опремата. Дозволено е измена на следните податоци:
	•Статус
	•Корисник
	•Град
	•Организациона единица
	•Служба
	•Сектор
	•Поле за забелешка 

<img src="http://i.imgur.com/HOztEUV.png" alt="Start Screen"/><br />
- - -
<b>1.4.	Уредување на шифрарниците</b><br />

	Уредување на шифрарниците треба да биде овозможено од страна на вработени – администратори на решението со посебни привилегии за таа намена.
	Уредевањето се одвива на тој начин што постојат некои предифинирани категории коие треба да се преку предифинар шифрарник. 
	Типот на категории е прикажен преку копчиња, каде со избор на некоја од понудените се прикажува листа од елементи од тој тип прикажани во dropdown контрола, 
	како и копче кое што овожува додавање на нов елемент во шифраникот. Со клик на копчето се појавува модален прозорец, 
	каде е имплементирана соодветна валидација на полињата. 
	Со клик на копчето додади веќе имаме нов елемент во листата.


<img src="http://i.imgur.com/IIQBq5u.png" alt="Start Screen"/><br />
<img src="http://i.imgur.com/JwyJYKP.png" alt="Start Screen"/><br />
<img src="http://i.imgur.com/Dt7Dcu0.png" alt="Start Screen"/><br />
	За секој од шифрарниците со клик на копчето Уреди, се прикажуваат податоци од предифинираниот тип кој сте го избрале, и за нив е овозможена опција за едитирање, како и бришене на секој елемент.

<img src="http://i.imgur.com/f9ZVMSd.png" alt="Start Screen"/><br />
- - -
<b>1.5.	Историјат на промените</b><br />

	За секој поединечен елемент  потребно е да биде зачуван историјат на промените, кој подразбира:
	кој ја евидентирал опремата, кои податоци биле внесени, кој направил промена,  датум и време, како и
	кој податок е сменет. Со тоа се овозможува подобар преглед за тоа на кој елемент се вршени промени на податоците. 
<img src="http://i.imgur.com/PGTmE0u.png" alt="Start Screen"/><br />
