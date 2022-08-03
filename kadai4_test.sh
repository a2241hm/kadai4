#!/bin/bash

#######################################
# shell name  : kadai4_test.sh
# Description : テストスクリプト
# Date        : 2021/08/06
#######################################

## 初期設定
ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

## テスト開始

## 正常系
# test1-1 :引数1の方が大きい場合
./kadai4_main.sh 28 20 > ${result}
echo "4" > ${ans}
diff ${result} ${ans} || echo "test1-1 :引数1の方が大きい場合エラー" >> ${err}

# test1-2 :引数2の方が大きい場合
./kadai4_main.sh 12 60 > ${result}
echo "4" > ${ans}
diff ${result} ${ans} || echo "test1-2 :引数2の方が大きい場合エラー" >> ${err}

# test1-3 :比較的桁数の大きい自然数の場合
./kadai4_main.sh 1905192228 5456037299 > ${result}
echo "1" > ${ans}
diff ${result} ${ans} || echo "test1-3 :比較的桁数の大きい自然数の場合エラー" >> ${err}

## 異常系
# test2-1 :引数なしの場合
./kadai4_main.sh > ${result}
echo "2つの自然数を入力してください" > ${ans}
diff ${result} ${ans} || echo "test2-1 :引数なしの場合エラー" >> ${err}

# test2-2 :引数が1つだけの場合
./kadai4_main.sh 12 > ${result}
echo "2つの自然数を入力してください" > ${ans}
diff ${result} ${ans} || echo "test2-2 :引数が1つだけの場合エラー" >> ${err}

# test2-3 :引数が3つある場合
./kadai4_main.sh 12 24 66 > ${result}
echo "2つの自然数を入力してください" > ${ans}
diff ${result} ${ans} || echo "test2-3 :引数が3つある場合エラー" >> ${err}

# test2-4 :引数２つで文字列の場合
./kadai4_main.sh "aaa" "bbb" > ${result}
echo "2つの自然数を入力してください" > ${ans}
diff ${result} ${ans} || echo "test2-4 :引数２つで文字列の場合エラー" >> ${err}

# test2-5 :引数の1つにマイナスが存在する場合
./kadai4_main.sh -12 36 > ${result}
echo "マイナスが入力されています" > ${ans}
diff ${result} ${ans} || echo "test2-5 :引数の1つにマイナスが存在する場合エラー" >> ${err}

# test2-6 :引数1に0が含まれる場合
./kadai4_main.sh 0 36 > ${result}
echo "0が入力されています" > ${ans}
diff ${result} ${ans} || echo "test2-6 :引数1に0が含まれる場合エラー" >> ${err}

# test2-7 :引数2に0が含まれる場合
./kadai4_main.sh 36 0 > ${result}
echo "0が入力されています" > ${ans}
diff ${result} ${ans} || echo "test2-7 :引数2に0が含まれる場合エラー" >> ${err}

if [ -f ${err} ]; then # エラーログが一つでもあれば
	cat ${err}         # 中身を表示して
	rm /tmp/$$-*	   # 後片付けをして
	exit 1			   # 終了
fi

