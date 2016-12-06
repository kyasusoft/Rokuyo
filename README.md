# rokuyo
西暦年月日から旧暦と六曜を求めるクラスとそのサンプル

## License
MIT

# KYRokuyoクラスの使い方
      必要ファイル
      KYRokuyo.h
      KYRokuyo.m
      kyureki.plist
      
      // メソッド
      // plistから旧暦テーブルを取得
      - (id)init
      // 年月日から旧暦を求め、六曜を返す
      - (NSString *)sinrekiToRokuyoWithYear:(int)inYear month:(int)inMonth day:(int)inDay
    
      // プロパティ
      kyuMonth;	// 旧暦の月
      kyuDay;	// 旧暦の日
 
      // plistの内容
    [
      [
        {"#year" : "2007"},
        {"01" : "1113191201"},
        {"02" : "1214180101"},
        ...
        {"12" : "1022101101"}
      ],
      ...
      [
        {"#year" : "2022"},
        {"01" : "1129031201"},
        ...
        {"12" : "1108231201"}
      ],
     ]
    
    各月の10桁は以下の内容
      MMDDccmmdd:　西暦の年月の一日に対応する旧暦の月日
      mmddCCmmdd: 一か月の中で旧暦が次の月に変わる日（次の月に変わらないときは"99"を記述)
      mmddccMMDD: CCの日の旧暦の月日　　　　　　　　（次の月に変わらないときは"0000"を記述)      
    例）
    2022年の12月1日は旧暦では(11)月(08)日。 12月(23)日に、旧暦が(12)月(01)日に変わる。
      ---> "1108231201"
      
    １ヶ月の中で２回月が変わる場合は16桁とします
      MMDDccmmddccmmdd:　西暦の年月の一日に対応する旧暦の月日
      mmddCCmmddccmmdd: 一か月の中で旧暦が次の月に変わる日
      mmddccMMDDccmmdd: CCの日の旧暦の月日
      mmddccmmddCCmmdd: 一か月の中で旧暦が次の月に変わる日（２回目）
      mmddccMMddccMMDD: CCの日の旧暦の月日    
    例)
    2005年の12月1日は旧暦では(10)月(30)日。12月(02)日に、旧暦が(11)月(01)日に変わる。12月(31)日に旧暦が(12)月(01)日に変わる。
      ---> "1030021101311201"
 
      
      mmddccMMddccMMDD: CCの日の旧暦の月日    
