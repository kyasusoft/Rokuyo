# Rokuyo
西暦年月日から旧暦と六曜を求めるクラスのサンプル

## License
MIT

# rokuyoクラスの使い方
      必要ファイル
      rokuyo.h
      rokuyo.m
      kyureki.plist
      
      // メソッド
      // plistから旧暦テーブルを取得
      - (id)init
      // 年月日から旧暦を求め、六曜を返す
      - (NSString *)sinrekiToRokuyoWithYear:(int)inYear month:(int)inMonth day:(int)inDay
    
      // プロパティ
      kyuMonth;	// 旧暦の月
      kyuDay;	　　// 旧暦の日
 
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
      MMddccmmdd:　西暦の年月の一日に対応する旧暦の月
      mmDDccmmdd: 西暦の年月の一日に対応する旧暦の日
      mmddCCmmdd: 一か月の中で旧暦が次の月に変わる日（次の月に変わらないときは"99"を記述)
      mmddccMMdd: CCの日の旧暦の月
      mmddccmmDD: CCの日の旧暦の日
    例）
    2022年の12月1日は旧暦では(11)月(08)日。 12月(23)日に、旧暦が(12)月(01)日に変わる。
      ---> "1108231201"
