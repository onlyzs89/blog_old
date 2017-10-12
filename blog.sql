CREATE DATABASE blog;
USE blog;
GRANT ALL ON blog.* TO sawako;

CREATE TABLE main(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mountain VARCHAR(128) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  conquer_date DATE NOT NULL,
  tags_ids VARCHAR(128),
  del BOOLEAN DEFAULT 0 NOT NULL,
  posted BOOLEAN DEFAULT 0 NOT NULL,
  text TEXT,
	lat DECIMAL(10,7) NOT NULL,
	lon DECIMAL(10,7) NOT NULL,
	alt INT(4) NOT NULL,
  classify INT 
);


CREATE TABLE tags(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  del BOOLEAN DEFAULT 0 NOT NULL,
  blogs TEXT
);

INSERT INTO tags(name, blogs) VALUES ('平ヶ岳','1');
INSERT INTO tags(name, blogs) VALUES ('新潟','1');
INSERT INTO tags(name, blogs) VALUES ('尾瀬','1,70,71,106,107');



INSERT INTO main(mountain,start_date,end_date,lat,lon,text,posted,tags_ids,conquer_date)
VALUES ('平ヶ岳','2017/09/03','2017/09/03',37.0019444,139.1708444,'美しい湿原',1,'1,2,3','2017/09/03');
  
INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('剱岳','2017/08/05','2017/08/06',36.6233361,137.6172222,'いよいよ最難関だ','2017/08/06');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('奥大日岳','2017/09/30','2017/10/01',36.5983333,137.5808333,'紅葉の立山へ','2017/09/30');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('笠ヶ岳','2017/09/16','2017/09/16',36.6766333,138.4814782,'志賀高原の絶景','2017/09/16');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('横手山','2017/09/16','2017/09/16',36.668899,138.525928,'志賀高原の絶景②','2017/09/16');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('祖母山','2017/10/07','2017/10/07',32.8281313,131.3470458,'九州遠征','2017/10/07');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('九重山','2017/10/08','2017/10/08',33.0821866,131.2408706,'めっちゃ混雑だった久住山','2017/10/08');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('阿蘇山','2017/10/09','2017/10/09',32.884338,131.103908,'寂しい阿蘇山','2017/10/09');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('雌阿寒岳','2017/09/11','2017/09/11',43.3863889,144.0086111,'素晴らしい景色','2017/09/11');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('斜里岳','2017/09/10','2017/09/10',43.7655556,144.717778,'沢登りは怖かった','2017/09/10');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('羅臼岳','2017/09/09','2017/09/09',44.0758333,145.122222,'クマと出会わないように','2017/09/09');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('飯豊山','2017/08/26','2017/08/27',37.8548312,139.7071098,'頂上は遠かったよ','2017/08/27');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('越後駒ヶ岳','2017/08/20','2017/08/20',37.1236199,139.0752492,'ヘビ4匹と遭遇した','2017/08/20');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('荒川岳','2017/08/10','2017/08/13',35.500739,138.182412,'南アルプスへのリベンジ','2017/08/11');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('赤石岳','2017/08/10','2017/08/13',35.4612064,138.1573598,'南アルプスへのリベンジ②','2017/08/11');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('聖岳','2017/08/10','2017/08/13',35.422544,138.139645,'南アルプスへのリベンジ③','2017/08/12');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('立山','2017/08/05','2017/08/06',36.575973,137.619773,'大好きな立山','2017/08/05');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('大朝日岳','2017/07/30','2017/07/30',38.2605329,139.9223205,'お急ぎの低山ハイキング','2017/07/30');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('奥穂高岳','2017/07/22','2017/07/23',36.289221,137.647989,'楽しかった岩場','2017/07/22');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('爺ヶ岳','2017/07/15','2017/07/16',36.588318,137.750885,'八峰キッレトへの挑戦','2017/07/15');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('鹿島槍ヶ岳','2017/07/15','2017/07/16',36.624566,137.747038,'八峰キッレトへの挑戦②','2017/07/15');

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('五龍岳','2017/07/15','2017/07/16',36.658412,137.752668,'八峰キッレトへの挑戦③','2017/07/16');  

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('槍ヶ岳','2017/07/08','2017/07/09',36.34198,137.647605,'念願のヤリ！','2017/07/08');  

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('乾徳山','2017/07/02','2017/07/02',35.822762,138.714858,'お腹が壊れた','2017/07/02'); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('苗場山','2017/06/24','2017/06/24',36.8459364,138.6903206,'残雪の湿原へ','2017/06/24'); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date)
VALUES ('空木岳','2017/06/10','2017/06/11',35.71897892,137.8170919,'前日避難小屋泊','2017/06/11'); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('白馬岳','2017/05/27','2017/05/28',36.758527,137.758544,'残雪の白馬へ','2017/05/27',1); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('皇海山','2017/05/21','2017/05/21',36.68986344,139.3369649,'山より林道の方が怖かった','2017/05/21',1); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('御正体山','2017/05/14','2017/05/14',35.48692364,138.9316071,'トレランの練習','2017/05/14',2); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('八幡平','2017/05/04','2017/05/04',39.957821,140.854057,'雪山ハイキング','2017/05/04',1); 

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('岩手山','2017/05/03','2017/05/04',39.85260664,141.0010177,'怖かった残雪','2017/05/03',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('黒岳','2017/04/30','2017/04/30',35.55207089,138.7494364,'気楽なハイキング','2017/04/30',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('唐松岳','2017/04/22','2017/04/23',36.687222,137.754722,'最高な雪山','2017/04/23',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('開聞岳','2017/04/10','2017/04/10',31.179947,130.528395,'雨','2017/04/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('宮之浦岳','2017/04/08','2017/04/09',30.335956,130.504293,'島へ','2017/04/09',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('霧島山','2017/04/07','2017/04/07',31.93417047,130.8615767,'雨','2017/04/07',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('愛鷹山','2017/03/20','2017/03/20',35.23805742,138.7940161,'気楽なハイキング','2017/03/20',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('天狗岳','2017/03/05','2017/03/05',36.01917128,138.3554534,'強風の天狗岳','2017/03/05',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('入笠山','2017/03/04','2017/03/04',35.89632269,138.1716028,'気楽な雪山ハイキング','2017/03/04',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('金時山','2017/02/04','2017/02/04',35.289672,139.004858,'気楽なハイキング','2017/02/04',3);



INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('榛名山','2016/12/18','2016/12/18',36.477371,138.850852,'気楽なハイキング','2016/12/18',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('三ツ峠山','2016/11/15','2016/11/15',35.54927233,138.8092044,'ヤマノススメ','2016/11/15',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('笠ヶ岳','2016/10/15','2016/10/16',36.31547739,137.5504008,'2016年最後のアルプス','2016/10/15',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('月山','2016/09/25','2016/09/25',38.549134,140.026942,'紅葉へ','2016/09/25',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('鳥海山','2016/09/24','2016/09/24',39.099394,140.048855,'紅葉へ','2016/09/24',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('光岳','2016/09/16','2016/09/18',35.33817553,138.0837788,'悪天候で撤退決定','2016/09/16',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('茶臼岳','2016/09/16','2016/09/18',35.369142,138.140403,'悪天候で撤退決定','2016/09/17',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('上河内岳','2016/09/16','2016/09/18',35.38961878,138.1528124,'悪天候で撤退決定','2016/09/17',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('常念岳','2016/09/10','2016/09/11',36.325541,137.727584,'穂高連峰を見に行く','2016/09/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('塩見岳','2016/09/03','2016/09/04',35.57380506,138.1830793,'最高だった仙塩尾根','2016/09/03',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('間ノ岳','2016/09/03','2016/09/04',35.6460115,138.2283238,'最高だった仙塩尾根','2016/09/04',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('北岳','2016/09/03','2016/09/04',35.674333,138.238822,'最高だった仙塩尾根','2016/09/04',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('磐梯山','2016/08/28','2016/08/28',37.600975,140.0722476,'真っ白だった磐梯山','2016/08/28',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大峰山','2016/08/20','2016/08/20',34.17358572,135.9075499,'ルート選択間違えた','2016/08/20',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('薬師岳','2016/08/11','2016/08/14',36.46884083,137.5447998,'初めての長期縦走','2016/08/11',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('黒部五郎岳','2016/08/11','2016/08/14',36.39254958,137.5399483,'初めての長期縦走','2016/08/12',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('鷲羽岳','2016/08/11','2016/08/14',36.40299567,137.6052501,'初めての長期縦走','2016/08/13',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('水晶岳','2016/08/11','2016/08/14',36.426356,137.602754,'初めての長期縦走','2016/08/13',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('三俣蓮華岳','2016/08/11','2016/08/14',36.389989,137.5877342,'初めての長期縦走','2016/08/13',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('蓼科山','2016/08/07','2016/08/07',36.10372947,138.2950714,'北八ヶ岳','2016/08/07',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('美ヶ原','2016/08/06','2016/08/06',36.225809,138.107433,'牧場へ','2016/08/06',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('白山','2016/07/30','2016/07/31',36.15506311,136.7714488,'霊山','2016/07/31',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('早池峰山','2016/07/24','2016/07/24',39.558356,141.488705,'東北遠征','2016/07/24',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('八甲田山','2016/07/23','2016/07/23',40.65890686,140.8772482,'東北遠征','2016/07/23',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('雨飾山','2016/07/16','2016/07/16',36.90202017,137.9626101,'ムーンライト信州号の乗車券が取れた','2016/07/16',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('吾妻山','2016/07/10','2016/07/10',37.738174,140.140766,'ハイキング','2016/07/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('焼岳','2016/07/02','2016/07/02',36.226885,137.587049,'火山の音が怖かった','2016/07/02',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('乗鞍岳','2016/07/02','2016/07/02',36.10648667,137.5536336,'時間余ったから','2016/07/02',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('燧ヶ岳','2016/06/19','2016/06/19',36.955139,139.285319,'前回に見間違えたことへのリベンジ','2016/06/19',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('会津駒ヶ岳','2016/06/18','2016/06/18',37.047562,139.353512,'念願のTシャツ入手','2016/06/18',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('草津白根山','2016/05/29','2016/05/29',36.622911,138.531722,'伝説の草津温泉へ','2016/05/29',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('霧ヶ峰','2016/05/22','2016/05/22',36.10289367,138.1966695,'暑かった','2016/05/22',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('戸隠山','2016/05/14','2016/05/14',36.770383,138.055084,'蟻の渡りへ','2016/05/14',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('高妻山','2016/05/14','2016/05/14',36.800046,138.0519336,'長かった道','2016/05/14',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('巻機山','2016/05/07','2016/05/08',36.978561,138.964422,'朝日を見えなかった','2016/05/08',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('岩木山','2016/05/03','2016/05/03',40.65591578,140.3030745,'残雪の東北','2016/05/03',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('剣山','2016/04/30','2016/04/30',33.85357614,134.0942805,'四国遠征','2016/04/30',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('石鎚山','2016/04/29','2016/04/29',33.76778,133.115062,'楽しかった鎖場','2016/04/29',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('丹沢大山','2016/04/23','2016/04/23',35.440853,139.231183,'楽しかった鎖場','2016/04/23',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('甲武信ヶ岳','2016/04/09','2016/04/10',35.90911,138.728903,'寒かった','2016/04/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('伯耆大山','2016/03/17','2016/03/17',35.371218,133.546323,'絶景','2016/03/17',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('荒島岳','2016/03/13','2016/03/13',35.93428903,136.6012731,'最後の春休み','2016/03/13',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('安達太良山','2016/03/05','2016/03/05',37.62113,140.287862,'雪遊び','2016/03/05',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('蔵王山','2016/03/04','2016/03/04',38.143663,140.439386,'風強かった','2016/03/04',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('四阿山','2016/02/12','2016/02/12',36.541781,138.412946,'初本格的な雪山','2016/02/12',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('武甲山','2016/02/09','2016/02/09',35.951617,139.097786,'雪山ハイキング','2016/02/09',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('筑波山','2016/01/31','2016/01/31',36.225375,140.106933,'雪遊び','2016/01/31',1);



INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大岳山','2015/12/14','2015/12/15',35.76521975,139.1304193,'流星群を見に行くのに','2015/12/14',2);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('三頭山','2015/12/14','2015/12/15',35.738969,139.013769,'流星群を見に行くのに','2015/12/14',3);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('恵那山','2015/11/18','2015/11/18',35.443019,137.597917,'雲海','2015/11/18',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('伊吹山','2015/11/17','2015/11/17',35.41783575,136.406346,'ハイキング','2015/11/17',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('天城山','2015/11/07','2015/11/07',34.86284433,139.0018031,'トレラン入門','2015/11/07',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('火打山','2015/10/23','2015/10/24',36.92270128,138.0681224,'誕生日登山','2015/10/23',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('妙高山','2015/10/23','2015/10/24',36.891271,138.113469,'誕生日登山','2015/10/24',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('木曽駒ヶ岳','2015/10/10','2015/10/11',35.78954986,137.8045743,'台風来た','2015/10/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('赤城山','2015/09/26','2015/09/26',36.56036714,139.1932699,'雨後','2015/09/26',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('武尊山','2015/09/25','2015/09/25',36.80518886,139.1326009,'雨で誰も会えなかった','2015/09/25',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('甲斐駒ヶ岳','2015/09/19','2015/09/20',35.757997,138.236675,'混雑なテント場','2015/09/19',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('仙丈ヶ岳','2015/09/19','2015/09/20',35.72006861,138.1835805,'初雷鳥遭遇','2015/09/20',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('雲取山','2015/09/15','2015/09/15',35.85550794,138.9439135,'長かった日帰り縦走道','2015/09/15',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('鳳凰山','2015/09/07','2015/09/08',35.701747,138.304602,'大雨の中で撤退','2015/09/08',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大台ヶ原','2015/08/13','2015/08/13',34.18522733,136.1091994,'ハイキング','2015/08/13',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('男体山','2015/07/25','2015/07/26',36.765074,139.490708,'500円の入山料','2015/07/25',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('日光白根山','2015/07/25','2015/07/26',36.79853858,139.3759008,'道迷った','2015/07/26',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('燧ヶ岳','2015/07/04','2015/07/05',36.955139,139.285319,'頂上間違えた','2015/07/04',1,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('至仏山','2015/07/04','2015/07/05',36.90347367,139.1732478,'いつかまた来る','2015/07/05',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('那須岳','2015/06/26','2015/06/26',37.124845,139.963125,'徹夜後の登山','2015/06/26',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('金峰山','2015/06/12','2015/06/13',35.871608,138.625469,'テントデビュー','2015/06/12',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('瑞牆山','2015/06/12','2015/06/13',35.893465,138.592103,'雲海','2015/06/13',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('八ヶ岳','2015/05/22','2015/05/23',35.97079733,138.3700667,'怖かった','2015/05/22',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大菩薩嶺','2015/05/10','2015/05/10',35.74876186,138.8455058,'ハイキング','2015/05/10',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('谷川岳','2015/04/25','2015/04/25',36.837129,138.930159,'いきなり雪山？','2015/04/25',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('両神山','2015/04/18','2015/04/18',36.02339989,138.8413174,'鎖場初体験','2015/04/18',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('丹沢山','2015/01/24','2015/01/24',35.47429311,139.1626799,'アイゼン初体験','2015/01/24',1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('筑波山','2015/01/17','2015/01/17',36.225375,140.106933,'百名山旅の始まり','2015/01/17',1,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('筑波山','2014/11/14','2014/11/14',36.225375,140.106933,'ハイキング','2014/11/14',1,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('丹沢山','2014/11/01','2014/11/01',35.47429311,139.1626799,'小雨中の登山体験','2014/11/01',1,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('筑波山','2014/10/24','2014/10/24',36.225375,140.106933,'登山開始','2014/10/24',1,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('富士山','2014/08/06','2014/08/07',35.360642,138.727358,'もう二度と登りたくない','2014/08/07',1);



INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('龍王岳','2017/09/30','2017/10/01',36.5647222,137.607222,'紅葉の立山へ②','2017/10/01',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('阿寒富士','2017/09/11','2017/09/11',43.374063,144.0065041,'富士山と似ている','2017/09/11',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('中岳(くじゅう連山)','2017/10/08','2017/10/08',33.08597,131.249015,'九州本土最高点','2017/10/08',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('烏帽子岳(三伏峠)','2017/08/10','2017/08/13',35.553543,138.15348,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('小河内岳','2017/08/10','2017/08/13',35.53774122,138.1530487,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大日影山','2017/08/10','2017/08/13',35.522172,138.138288,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('板屋岳','2017/08/10','2017/08/13',35.5179,138.146055,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('荒川中岳','2017/08/10','2017/08/13',35.49657342,138.1670673,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('荒川前岳','2017/08/10','2017/08/13',35.494081,138.164079,'南アルプスへのリベンジ','2017/08/10',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('大沢岳','2017/08/10','2017/08/13',35.44890547,138.1201763,'南アルプスへのリベンジ','2017/08/12',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('中盛丸山','2017/08/10','2017/08/13',35.442806,138.121996,'南アルプスへのリベンジ','2017/08/12',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('兎岳','2017/08/10','2017/08/13',35.428596,138.121173,'南アルプスへのリベンジ','2017/08/12',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('真砂岳(立山)','2017/08/05','2017/08/06',36.586712,137.619998,'大好きな立山','2017/08/05',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('別山(立山)','2017/08/05','2017/08/06',36.597562,137.62034,'大好きな立山','2017/08/05',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('前穂高岳','2017/07/22','2017/07/23',36.28197856,137.6605741,'楽しかった岩場','2017/07/22',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('抜戸岳','2016/10/15','2016/10/16',36.32766497,137.5751348,'2016年最後のアルプス','2016/10/15',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('蝶ヶ岳','2016/09/10','2016/09/11',36.287424,137.726077,'穂高連峰を見に行く','2016/09/10',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('北荒川岳','2016/09/03','2016/09/04',35.59469372,138.1945348,'最高だった仙塩尾根','2016/09/03',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('新蛇抜山','2016/09/03','2016/09/04',35.607128,138.205308,'最高だった仙塩尾根','2016/09/03',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('安倍荒倉岳','2016/09/03','2016/09/04',35.62305897,138.202969,'最高だった仙塩尾根','2016/09/03',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('弥山(大峰山)','2016/08/20','2016/08/20',34.180108,135.909335,'ルート選択間違えた','2016/08/20',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('北ノ俣岳','2016/08/11','2016/08/14',36.421044,137.512327,'初めての長期縦走','2016/08/12',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('双六岳','2016/08/11','2016/08/14',36.371877,137.587113,'初めての長期縦走','2016/08/13',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('刈田岳(蔵王山)','2016/03/04','2016/03/04',38.12775433,140.4481874,'風強かった','2016/03/04',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('駒津峰','2015/09/19','2015/09/20',35.754672,138.23082,'混雑なテント場','2015/09/19',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('双児山','2015/09/19','2015/09/20',35.750678,138.221462,'混雑なテント場','2015/09/19',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('薬師ヶ岳(鳳凰山)','2015/09/07','2015/09/08',35.695921,138.311643,'大雨の中で撤退','2015/09/07',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('高嶺','2015/09/07','2015/09/08',35.70976556,138.2877079,'大雨の中で撤退','2015/09/08',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('風越山','2015/08/23','2015/08/23',35.549481,137.78379,'免許合宿の休み','2015/08/23',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('三本槍岳','2015/06/26','2015/06/26',37.150149,139.961402,'徹夜後の登山','2015/06/26',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('阿弥陀岳','2015/05/22','2015/05/23',35.97245,138.358769,'怖かった','2015/05/22',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('横岳(八ヶ岳)','2015/05/22','2015/05/23',35.98475,138.373448,'怖かった','2015/05/23',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('硫黄岳(八ヶ岳)','2015/05/22','2015/05/23',35.99876,138.369912,'怖かった','2015/05/23',4);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('塔ノ岳','2015/01/24','2015/01/24',35.454047,139.163288,'アイゼン初体験','2015/01/24',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify,del)
VALUES ('塔ノ岳','2014/11/01','2014/11/01',35.454047,139.163288,'小雨中の登山体験','2014/11/01',5,1);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('陣馬山','2013/01/30','2013/01/30',35.652163,139.166514,'初登山','2013/01/30',5);

INSERT INTO main(mountain,start_date,end_date,lat,lon,text,conquer_date,classify)
VALUES ('高尾山','2013/01/30','2013/01/30',35.62516647,139.2436115,'初登山','2013/01/30',4);